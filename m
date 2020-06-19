Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44407201D0B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 23:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F1E6EA65;
	Fri, 19 Jun 2020 21:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700063.outbound.protection.outlook.com [40.107.70.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5800E6EA65;
 Fri, 19 Jun 2020 21:21:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgWOhWjr+Lh4ZCgd4PO7mxpVE6PlQllQwY1c+Ce1B5w1qf9f0NzqRZB/ZRgKzqpUjUcin/Z5BDNwM7d3Fqt5FyCfLSFfVj63Z7VtqXytVEs6AV2ZSqt1Oobhble1ZWZLHMrmFxr0FYQ8hETq4KZ5AT806W2KWwLDAt+fn9vggtZ5Rth7RPw5xwGbEuaDU0GiI3heW1FITdIUMt6b4hCIIUivkfOcrtYp+Dr2galix/kAJg47eXv0/pB6Ni6rfCcObbquPjikKcMEFr7MtKO3qosOKv8p89t9+1vAwpRPlDqKih+GEofC2BL3C/G+GpFpx3247OaxEqunefRLZjgWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsNP3XbVRSA6wGFLl6AzI1Fn6dyS2+l6lwsBZ+xrlZE=;
 b=mYwfdroxIhFXt3TdPR/btSAGYf6gjdaL160/Qp3M16tO094jvp4e6vZBgNkhkwT8/mKQ/jHbIaH3KixRm9USiqEC43ONbwr9XgFjR61qzkyEZbK2K3Q2shwU6O0tm+1JVl7q8ChqV/loBELAD9CXC0F9r/w44GAsJ7fF/1wWOlySyZ/BuZdI7Vjb6mfU3XUre6JL9x1o1SlEAW/PedIGwOLLhPWNg8Crm6rFmVdDLs76U7nnwjdVfU3K2KpNX38dw5EiZiIWrKzGt6aRCCyqTHvw7188eslAR89+OnnMbESd7VYmC38UMG04Vsq6Icj484fUDnDqPOD5jatGTTNhEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsNP3XbVRSA6wGFLl6AzI1Fn6dyS2+l6lwsBZ+xrlZE=;
 b=ch2tH6sLXQ/v/scgokO2/tk7nP5Lo9nZrVF4StMSSbUqDQo8nF1kYBmzcR45WqVKpbX6EOd/Ja4HTjbp2f+HtyaDD+n/HmCDJAC6RUxavE1ITt4uqJlM6h94z6aXWRl38Ro4RS5KJNG3N2OxAhQ4mEhwzcSCWUbRoACxSE4bJcQ=
Authentication-Results: vivo.com; dkim=none (message not signed)
 header.d=none;vivo.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SA0PR12MB4574.namprd12.prod.outlook.com (2603:10b6:806:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 21:21:26 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 21:21:26 +0000
Subject: Re: [PATCH] drm/amd: fix potential memleak in err branch
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200619114533.2612-1-bernard@vivo.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <3f7e1ac8-c613-8650-56d6-715d39d5f372@amd.com>
Date: Fri, 19 Jun 2020 17:21:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200619114533.2612-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: YQXPR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::17) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YQXPR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:41::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.21 via Frontend Transport; Fri, 19 Jun 2020 21:21:25 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 45ce2caf-c039-413e-b962-08d81496b96a
X-MS-TrafficTypeDiagnostic: SA0PR12MB4574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4574A1A5FC3E08446E59463392980@SA0PR12MB4574.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iASdIAzRPxSe+bnlcmn/Imnv/CV8n1hePhpy05ChHiiD6zeL3xsNL0g7t9pQ/9aSuQRBlLVIKPSAwR6WB6GZpxUabcaKhMhlH4dDDdZpJe6Riv1BITDqLuoxJ42Tr10a3kXLwemSo5UwJy0mdqQq6ohg/4fg24QSaNHpXgg+ZWXu1aONBtNJo9SekPJdRABRHZXWdwCVcUd2E1EhmTz6kkxx1ptuiJ9xXYLuUdoKcPKmHSJq7xg0zIu9OARnLxrhqaJCVF8pO7qsTCHF9Wxv9Y69iskaq13RoXiEkxzH0srIvLtDgeHC2mlF0tHlkuu9wMMqWNvTK6ENtHMH2aBGawOu9YAr6wRHke4Gr9Zw6yEO8Yz/cWjXCMBn22ewB6BtboxXnmgNboG/HIbUJ7VDv7B0jiazfWsbu+sjbnwnW+U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(2616005)(26005)(956004)(66476007)(66556008)(44832011)(66946007)(31696002)(5660300002)(36756003)(16526019)(186003)(86362001)(31686004)(4326008)(6486002)(16576012)(316002)(966005)(8676002)(83380400001)(2906002)(478600001)(8936002)(110136005)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: YL80xVBpoO1y8io1kkfnUyj0LvgN+FYdXlJzE3ejoDZhiRDnslQ/j9bnPi/bjRGFPL2abtPYjag5et6GcE+D8SrWMUV2nHz8FiQB5IgGbyMQgCxSR/ju6otF+aYSKgvu17lPSxE3yTfGPcBlHe8ABNc2xCetnpoINEB8tGpc3Gent1GXMLN46sSNSEBHyG5LB967H/8Dgzlws7Pe9DmjVI3LjAIgvqX76rAeHjubU6ux321JQzI/MvP72svGL4ZHJRnQ+67Klroq7JpVnBNNvk+QMqkKZ4MNpLSjmcBbf25L6scV/rOPIuy2/UoA/kbyNLzqb2JMGfDmzGiNGyX0pciLaT6dqwxz02IJNQ6WmPaY8GOfFGCFnSfMNW+c3/cuPV/0zD8khACxxVTeGMyK5qVVsKXalGzX3xt3WMjaDSvW278JJKcdCPjMYH6fh4240Etflupo+LfAtszf550f9vLj0xSWWjLqDY4N3+46+XoIOqDyAzDSCBEthzLe4uoP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ce2caf-c039-413e-b962-08d81496b96a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 21:21:26.5421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJ/TVsSvrQUeZ1VcHZKFo3O/b8shHyE3BRWBhKGgl26+EgSqCo6eAb8ujLByWU0dUf25X0UlMZuHmadmjtzKCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4574
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmVybmFyZCwKCkkganVzdCBhcHBsaWVkIGEgcGF0Y2ggZnJvbSBhbm90aGVyIGNvbnRyaWJ1
dG9yIGZvciB0aGUga2ZkX3RvcG9sb2d5CnBhcnQgb2YgdGhpcy4gU2VlCmh0dHBzOi8vY2dpdC5m
cmVlZGVza3RvcC5vcmcvfmFnZDVmL2xpbnV4L2NvbW1pdC8/aD1hbWQtc3RhZ2luZy1kcm0tbmV4
dCZpZD1mYzBmZTgxMzgzMDlmZWUzMDNiZDEyOTkxZjEyYjIzZjAxYmJmNThjCgpQbGVhc2UgcmVi
YXNlIHlvdXIgcGF0Y2ggb24gdGhhdC4gSSBiZWxpZXZlIHRoYXQgc2hvdWxkIG9ubHkgbGVhdmUg
dGhlCmZpeGVzIGluIGtmZF9wcm9jZXNzLmMuCgpUaGFua3MsCsKgIEZlbGl4CgpBbSAyMDIwLTA2
LTE5IHVtIDc6NDUgYS5tLiBzY2hyaWViIEJlcm5hcmQgWmhhbzoKPiBUaGUgZnVuY3Rpb24ga29i
amVjdF9pbml0X2FuZF9hZGQgYWxsb2MgbWVtb3J5IGxpa2U6Cj4ga29iamVjdF9pbml0X2FuZF9h
ZGQtPmtvYmplY3RfYWRkX3ZhcmctPmtvYmplY3Rfc2V0X25hbWVfdmFyZ3MKPiAtPmt2YXNwcmlu
dGZfY29uc3QtPmtzdHJkdXBfY29uc3QtPmtzdHJkdXAtPmttYWxsb2NfdHJhY2tfY2FsbGVyCj4g
LT5rbWFsbG9jX3NsYWIsIGluIGVyciBicmFuY2ggdGhpcyBtZW1vcnkgbm90IGZyZWUuIElmIHVz
ZQo+IGttZW1sZWFrLCB0aGlzIHBhdGggbWF5YmUgY2F0Y2hlZC4KPiBUaGVzZSBjaGFuZ2VzIGFy
ZSB0byBhZGQga29iamVjdF9wdXQgaW4ga29iamVjdF9pbml0X2FuZF9hZGQKPiBmYWlsZWQgYnJh
bmNoLCBmaXggcG90ZW50aWFsIG1lbWxlYWsuCj4KPiBTaWduZWQtb2ZmLWJ5OiBCZXJuYXJkIFpo
YW8gPGJlcm5hcmRAdml2by5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9wcm9jZXNzLmMgIHwgIDIgKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X3RvcG9sb2d5LmMgfCAyMCArKysrKysrKysrKysrKystLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9wcm9jZXNzLmMKPiBpbmRleCBkMjcyMjFkZGNkZWIuLjVlZTRkNmNmYjE2ZCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3Byb2Nlc3MuYwo+IEBAIC0xMjQs
NiArMTI0LDcgQEAgdm9pZCBrZmRfcHJvY2ZzX2luaXQodm9pZCkKPiAgCWlmIChyZXQpIHsKPiAg
CQlwcl93YXJuKCJDb3VsZCBub3QgY3JlYXRlIHByb2NmcyBwcm9jIGZvbGRlciIpOwo+ICAJCS8q
IElmIHdlIGZhaWwgdG8gY3JlYXRlIHRoZSBwcm9jZnMsIGNsZWFuIHVwICovCj4gKwkJa29iamVj
dF9wdXQocHJvY2ZzLmtvYmopOwo+ICAJCWtmZF9wcm9jZnNfc2h1dGRvd24oKTsKPiAgCX0KPiAg
fQo+IEBAIC00MjgsNiArNDI5LDcgQEAgc3RydWN0IGtmZF9wcm9jZXNzICprZmRfY3JlYXRlX3By
b2Nlc3Moc3RydWN0IGZpbGUgKmZpbGVwKQo+ICAJCQkJCSAgIChpbnQpcHJvY2Vzcy0+bGVhZF90
aHJlYWQtPnBpZCk7Cj4gIAkJaWYgKHJldCkgewo+ICAJCQlwcl93YXJuKCJDcmVhdGluZyBwcm9j
ZnMgcGlkIGRpcmVjdG9yeSBmYWlsZWQiKTsKPiArCQkJa29iamVjdF9wdXQocHJvY2Vzcy0+a29i
aik7Cj4gIAkJCWdvdG8gb3V0Owo+ICAJCX0KPiAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRr
ZmQva2ZkX3RvcG9sb2d5LmMKPiBpbmRleCBiYjc3ZjdhZjJiNmQuLmRjM2M0MTQ5Zjg2MCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jCj4gQEAgLTYzMiw4
ICs2MzIsMTAgQEAgc3RhdGljIGludCBrZmRfYnVpbGRfc3lzZnNfbm9kZV9lbnRyeShzdHJ1Y3Qg
a2ZkX3RvcG9sb2d5X2RldmljZSAqZGV2LAo+ICAKPiAgCXJldCA9IGtvYmplY3RfaW5pdF9hbmRf
YWRkKGRldi0+a29ial9ub2RlLCAmbm9kZV90eXBlLAo+ICAJCQlzeXNfcHJvcHMua29ial9ub2Rl
cywgIiVkIiwgaWQpOwo+IC0JaWYgKHJldCA8IDApCj4gKwlpZiAocmV0IDwgMCkgewo+ICsJCWtv
YmplY3RfcHV0KGRldi0+a29ial9ub2RlKTsKPiAgCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICAKPiAg
CWRldi0+a29ial9tZW0gPSBrb2JqZWN0X2NyZWF0ZV9hbmRfYWRkKCJtZW1fYmFua3MiLCBkZXYt
PmtvYmpfbm9kZSk7Cj4gIAlpZiAoIWRldi0+a29ial9tZW0pCj4gQEAgLTY4MCw4ICs2ODIsMTAg
QEAgc3RhdGljIGludCBrZmRfYnVpbGRfc3lzZnNfbm9kZV9lbnRyeShzdHJ1Y3Qga2ZkX3RvcG9s
b2d5X2RldmljZSAqZGV2LAo+ICAJCQlyZXR1cm4gLUVOT01FTTsKPiAgCQlyZXQgPSBrb2JqZWN0
X2luaXRfYW5kX2FkZChtZW0tPmtvYmosICZtZW1fdHlwZSwKPiAgCQkJCWRldi0+a29ial9tZW0s
ICIlZCIsIGkpOwo+IC0JCWlmIChyZXQgPCAwKQo+ICsJCWlmIChyZXQgPCAwKSB7Cj4gKwkJCWtv
YmplY3RfcHV0KG1lbS0+a29iaik7Cj4gIAkJCXJldHVybiByZXQ7Cj4gKwkJfQo+ICAKPiAgCQlt
ZW0tPmF0dHIubmFtZSA9ICJwcm9wZXJ0aWVzIjsKPiAgCQltZW0tPmF0dHIubW9kZSA9IEtGRF9T
WVNGU19GSUxFX01PREU7Cj4gQEAgLTY5OSw4ICs3MDMsMTAgQEAgc3RhdGljIGludCBrZmRfYnVp
bGRfc3lzZnNfbm9kZV9lbnRyeShzdHJ1Y3Qga2ZkX3RvcG9sb2d5X2RldmljZSAqZGV2LAo+ICAJ
CQlyZXR1cm4gLUVOT01FTTsKPiAgCQlyZXQgPSBrb2JqZWN0X2luaXRfYW5kX2FkZChjYWNoZS0+
a29iaiwgJmNhY2hlX3R5cGUsCj4gIAkJCQlkZXYtPmtvYmpfY2FjaGUsICIlZCIsIGkpOwo+IC0J
CWlmIChyZXQgPCAwKQo+ICsJCWlmIChyZXQgPCAwKSB7Cj4gKwkJCWtvYmplY3RfcHV0KGNhY2hl
LT5rb2JqKTsKPiAgCQkJcmV0dXJuIHJldDsKPiArCQl9Cj4gIAo+ICAJCWNhY2hlLT5hdHRyLm5h
bWUgPSAicHJvcGVydGllcyI7Cj4gIAkJY2FjaGUtPmF0dHIubW9kZSA9IEtGRF9TWVNGU19GSUxF
X01PREU7Cj4gQEAgLTcxOCw4ICs3MjQsMTAgQEAgc3RhdGljIGludCBrZmRfYnVpbGRfc3lzZnNf
bm9kZV9lbnRyeShzdHJ1Y3Qga2ZkX3RvcG9sb2d5X2RldmljZSAqZGV2LAo+ICAJCQlyZXR1cm4g
LUVOT01FTTsKPiAgCQlyZXQgPSBrb2JqZWN0X2luaXRfYW5kX2FkZChpb2xpbmstPmtvYmosICZp
b2xpbmtfdHlwZSwKPiAgCQkJCWRldi0+a29ial9pb2xpbmssICIlZCIsIGkpOwo+IC0JCWlmIChy
ZXQgPCAwKQo+ICsJCWlmIChyZXQgPCAwKSB7Cj4gKwkJCWtvYmplY3RfcHV0KGlvbGluay0+a29i
aik7Cj4gIAkJCXJldHVybiByZXQ7Cj4gKwkJfQo+ICAKPiAgCQlpb2xpbmstPmF0dHIubmFtZSA9
ICJwcm9wZXJ0aWVzIjsKPiAgCQlpb2xpbmstPmF0dHIubW9kZSA9IEtGRF9TWVNGU19GSUxFX01P
REU7Cj4gQEAgLTc5OCw4ICs4MDYsMTAgQEAgc3RhdGljIGludCBrZmRfdG9wb2xvZ3lfdXBkYXRl
X3N5c2ZzKHZvaWQpCj4gIAkJcmV0ID0ga29iamVjdF9pbml0X2FuZF9hZGQoc3lzX3Byb3BzLmtv
YmpfdG9wb2xvZ3ksCj4gIAkJCQkmc3lzcHJvcHNfdHlwZSwgICZrZmRfZGV2aWNlLT5rb2JqLAo+
ICAJCQkJInRvcG9sb2d5Iik7Cj4gLQkJaWYgKHJldCA8IDApCj4gKwkJaWYgKHJldCA8IDApIHsK
PiArCQkJa29iamVjdF9wdXQoc3lzX3Byb3BzLmtvYmpfdG9wb2xvZ3kpOwo+ICAJCQlyZXR1cm4g
cmV0Owo+ICsJCX0KPiAgCj4gIAkJc3lzX3Byb3BzLmtvYmpfbm9kZXMgPSBrb2JqZWN0X2NyZWF0
ZV9hbmRfYWRkKCJub2RlcyIsCj4gIAkJCQlzeXNfcHJvcHMua29ial90b3BvbG9neSk7Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
