Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F22922BC28
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 04:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B426E3FC;
	Fri, 24 Jul 2020 02:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD586E3FC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 02:56:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fujQ6fZ+/pJaEX19h+T97ycx5pbko3T1aVq8s0ZoFdPnlhCtSHrqtIcAY8t46CD2sdzc0NUGRx5ccq0WQx5eQOEiI4rjIlK/UnOz83EuMZWchuNKQ+WT8ztfXfyA0UGGEwT7B6JQDclbve6AAwRh4hC/5Iwb7X8C55FRR/m/6ovB3ZxJblTX2na7cDQv9XDQFYrhedXCr97oV0iWPwqp+ycL8Qi03JbB1RVsaXVcgC6anKjiYHV56v79OGtvMVa0QBIlUaeIygg0iJ/5FORZ/X0jXE/XDQHr1sGgHyxBRupvn2QxqaIc1uJolN1o1iKPV3lNXsXttPWBokrVUmJ6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCT3arGmlnYgsvA/Dz2lwaoXMG39MELSF1uAdFN/mG0=;
 b=M3YuehIqzKjdn+ZgdiCRJf2vZN2jtpOYfq/w30M0EAJQ0bx5HmhXw+RQW90yMBIswwPpRlSwR1sHOBMpgLO9JUA177SHjUk7qe8BNAGmFCrEOyck8XKi8XOggSKeaF1WfHJjJpn6RpOsBnVERJmnsbe2DVAOlh+xUrYH5UD0sqQXjy/OTth/qC5IDAv7ioWiwpbjnjvGiPyOg7zYUSjSk/Jw2I1ClNbU/GXnz6nG5mOVHuicbDe5/C1JX3eMM+gJfT6Z8HBHjj7VN0LfYBRHZcUUlc89EhkCyXWKA9JA24elEMNOOjKEeSoPjx+hqgykZIKp6iEpHbla0fk/ka6uIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aCT3arGmlnYgsvA/Dz2lwaoXMG39MELSF1uAdFN/mG0=;
 b=VE1gYfZUx3bpNWrCTEWVQ7YLVnfyuZWELO3jDzXW7YsJfBQYAmMQr8RZO3VxfIESeiShFVAhfq8UT4hiScJGaLO4GQkgwnA3mpHH4LAX40/LV//8ET9fnhUPqFFb8CxYqemXJanlVm+nR2SeZ04ESRQxlHa7lWJRe48EB/TgAxQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN6PR12MB2830.namprd12.prod.outlook.com (2603:10b6:805:e0::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Fri, 24 Jul
 2020 02:56:27 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::5d1d:887c:3ba6:1d0d]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::5d1d:887c:3ba6:1d0d%7]) with mapi id 15.20.3216.020; Fri, 24 Jul 2020
 02:56:27 +0000
Subject: Re: [PATCH] drm/ttm: fix pipelined gutting for evictions
To: philip yang <yangp@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200723090000.5725-1-christian.koenig@amd.com>
 <982ad05c-f2f8-0a53-9b90-119fe93a5374@amd.com>
 <a854df68-5487-552d-0ee0-335fbe2d6356@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <7faab05c-c956-8a82-7ec8-30438f614e02@amd.com>
Date: Thu, 23 Jul 2020 22:56:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a854df68-5487-552d-0ee0-335fbe2d6356@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0144.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::23) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.61.76) by
 YT1PR01CA0144.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.21 via Frontend Transport; Fri, 24 Jul 2020 02:56:26 +0000
X-Originating-IP: [142.117.61.76]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eefed10f-cec1-4e5c-3e7c-08d82f7d2870
X-MS-TrafficTypeDiagnostic: SN6PR12MB2830:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB28309C23CEBECC27CC27102492770@SN6PR12MB2830.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T9cbdoMjus5yqV8n07gNosR6pluskFaQH+h2++Q+aOLmi5tz4u63tUrXRrnkSi4zMv2czdlYlOIC93AFt214vOLEmGu04YO1rNF3M1P6ayroz0TEpwA2Ra85X56kNVLvAXQ/kxNZ/h9XqXM0EZOdRsDa4ret6GtImbg1YlgdehiM2fR3wR/UYKhcD0JMIn5VTzV2eFajTa/ByfrInPNx1I0ncrf84zrxlgWUEBKivFFkgP7I0ijrZPdLLjtuD0AlK6IMO4vYawmTQ4oBcAAuzuCUP/VoFv3mLBy0EelEUooaMfMv/IgchpejSlaRfnihDdyi2weEXNp2RogmgjaSelm9cyCqLW24a7+MxtQrJQPClm6CWOGzsAcl3QVgthxh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(16576012)(316002)(53546011)(2616005)(86362001)(5660300002)(36756003)(110136005)(52116002)(31696002)(956004)(478600001)(4326008)(16526019)(186003)(26005)(8936002)(66946007)(44832011)(31686004)(8676002)(66556008)(6486002)(66476007)(2906002)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: eot6h0D/GRa0fw5shoINK3Ha+yZmBlZg1ofB2mLFDtsthVCdWk3GI6SFz8GRGJGYa6+QUPu7N+A7VVASwSB4pCfLftX7dYSdtUSNIb+ga7SL2ogCWwbyMvTL2TXUUVFdcJTvHBVRtjUmdSDRq8lR+8d7Q2bW6FLY69zZsvBy7VGN8HVZqyBN6Boc+ky6WO4JrpZ2e4NkrdIGMagXX5UiSbV7nQI3v4fxXZ/pNcloHqv9JcdtGaXk4Sjj4r+2yJa7tj8ORZ2ajtm/qY1HhHrY+37Je1RL5b4qiHUfZvShqkNqVe2Qls0oXDnK/Bu/SI3dLNRAf2RBJduabawIftShPMt7nX5b8e+WJW20Gnl4wskNrlpDSWEMAHTRbQc0+dj2E70tZRlQEJhuPwxne6ywFsGmd9LpEuV4mrnfE2ihcvE7ipcO4xs2pj6Au+vYm9VePm+9ljjQhseGeIcrz2tnrLLLMzgyisk58j4nLf47QEaJq/8EL0nPsJFJ9iuS64ay
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eefed10f-cec1-4e5c-3e7c-08d82f7d2870
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2414.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 02:56:27.0086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gDkVteI25ZpZB5nTFV63KGXzTmL+vCRSxh7SM6799/yZJCK8qM0GNgdo+BVhHRWRmBL/sFCx7mrI2W3KvBYD+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2830
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
Cc: Alex.Sierra@amd.com, Philip.Yang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDIwMjAtMDctMjMgdW0gOTo1OCBwLm0uIHNjaHJpZWIgcGhpbGlwIHlhbmc6Cj4KPiBPbiAy
MDIwLTA3LTIzIDc6MDIgcC5tLiwgRmVsaXggS3VlaGxpbmcgd3JvdGU6Cj4+IEFtIDIwMjAtMDct
MjMgdW0gNTowMCBhLm0uIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4+IFdlIGNhbid0IHBp
cGVsaW5lIHRoYXQgZHVyaW5nIGV2aWN0aW9uIGJlY2F1c2UgdGhlIG1lbW9yeSBuZWVkcwo+Pj4g
dG8gYmUgYXZhaWxhYmxlIGltbWVkaWF0ZWx5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDEyICsrKysrKysrKystLQo+Pj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+IGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYwo+Pj4gaW5kZXggYmMyMjMwZWNiN2UzLi4xMjIwNDAwNTZhMDcgMTAwNjQ0
Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+PiBAQCAtNjUxLDggKzY1MSwxNiBAQCBzdGF0aWMgaW50
IHR0bV9ib19ldmljdChzdHJ1Y3QKPj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4+IMKgwqDC
oMKgwqAgcGxhY2VtZW50Lm51bV9idXN5X3BsYWNlbWVudCA9IDA7Cj4+PiDCoMKgwqDCoMKgIGJk
ZXYtPmRyaXZlci0+ZXZpY3RfZmxhZ3MoYm8sICZwbGFjZW1lbnQpOwo+Pj4gwqAgLcKgwqDCoCBp
ZiAoIXBsYWNlbWVudC5udW1fcGxhY2VtZW50ICYmICFwbGFjZW1lbnQubnVtX2J1c3lfcGxhY2Vt
ZW50KQo+Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhi
byk7Cj4+PiArwqDCoMKgIGlmICghcGxhY2VtZW50Lm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVu
dC5udW1fYnVzeV9wbGFjZW1lbnQpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCB0dG1fYm9fd2FpdChi
bywgZmFsc2UsIGZhbHNlKTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCB0dG1fdHRfZGVzdHJv
eShiby0+dHRtKTsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBtZW1zZXQoJmJvLT5tZW0sIDAs
IHNpemVvZihiby0+bWVtKSk7Cj4+IFdoZXJlIGRvZXMgdGhlIG1lbW9yeSBpbiB0aGUgYm8tPm1l
bSAodHRtX21lbV9yZWcpIGdldCBkZXN0cm95ZWQ/IEl0Cj4+IGRvZXNuJ3QgZ2V0IGF0dGFjaGVk
IHRvIGEgZ2hvc3QgQk8gaW4gdGhpcyBjYXNlLCBzbyBzb21lb25lIHdpbGwgaGF2ZSB0bwo+PiBj
YWxsIHR0bV9ib19tZW1fcHV0IGV4cGxpY2l0bHkgYmVmb3JlIHlvdSB3aXBlIG91dCBiby0+bWVt
Lgo+Cj4gQWZ0ZXIgbWlncmF0aW5nIHRvIHJhbSwKPiBzdm1fcmFuZ2VfYm9fdW5yZWYtLT5hbWRn
cHVfdW5yZWZfYm8tPnR0bV9ib19wdXQtPnR0bV9ib19yZWxlYXNlIGNhbGxzCj4gdHRtX2JvX21l
bV9wdXQuCgphbWRncHVfYm9fdW5yZWYgd29uJ3QgZnJlZSBhbnl0aGluZyBpZiB0aGUgcmVmZXJl
bmNlIGNvdW50IGRvZXNuJ3QgZ28gdG8KMC4gQW5kIFRUTSBpcyBzdGlsbCBob2xkaW5nIGEgcmVm
ZXJlbmNlIGhlcmUuIFRoZSBCTyB3b24ndCBiZSBmcmVlZAp1bnRpbCB0dG1fbWVtX2V2aWN0X2Zp
cnN0IGNhbGxzIHR0bV9ib19wdXQuCgpUaGUgbWVtc2V0IGFib3ZlIG92ZXJ3cml0ZXMgdGhlIHR0
bV9tZW1fcmVnIHN0cnVjdHVyZSwgd2hpY2ggbWVhbnMgaXQKd2lsbCBmb3JnZXQgYWJvdXQgdGhl
IFZSQU0gbm9kZXMgaGVsZCBieSB0aGUgQk8uIFRoZXkgbmVlZCB0byBiZQpyZWxlYXNlZCBmaXJz
dC4gVGhhdCdzIHdoYXQgZnJlZXMgdGhlIHNwYWNlIHRoYXQgdHRtX2JvX2V2aWN0IHdhcyB0cnlp
bmcKdG8gbWFrZSBhdmFpbGFibGUgaW4gdGhlIGZpcnN0IHBsYWNlLgoKUmVnYXJkcywKwqAgRmVs
aXgKCgo+IHZyYW0gaXMgYWxyZWFkeSBmcmVlZCBiZWZvcmUgd2Ugc2lnbmFsIGZlbmNlLCByaWdo
dD8KPgo+IFJlZ2FyZHMsCj4KPiBQaGlsaXAKPgo+PiBSZWdhcmRzLAo+PiDCoMKgIEZlbGl4Cj4+
Cj4+Cj4+PiArwqDCoMKgwqDCoMKgwqAgYm8tPm1lbS5tZW1fdHlwZSA9IFRUTV9QTF9TWVNURU07
Cj4+PiArwqDCoMKgwqDCoMKgwqAgYm8tPnR0bSA9IE5VTEw7Cj4+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIDA7Cj4+PiArwqDCoMKgIH0KPj4+IMKgIMKgwqDCoMKgwqAgZXZpY3RfbWVtID0gYm8t
Pm1lbTsKPj4+IMKgwqDCoMKgwqAgZXZpY3RfbWVtLm1tX25vZGUgPSBOVUxMOwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
