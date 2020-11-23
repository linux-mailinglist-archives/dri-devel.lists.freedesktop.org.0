Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B522BFF54
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 06:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149AD89B68;
	Mon, 23 Nov 2020 05:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C05189B57;
 Mon, 23 Nov 2020 05:15:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULE2gxBzk9ApDHWM9dWjMnjXFMwsjSH5cK/jPStXuVegLRn8mnfErIrkGdiwVxEDJFbf6lOvApJqlX3CAMiKF5ET/CwixFxZEJJEkeNrHIOe8lda+1/QgY2ZsOJfv49IgBy7hU6dAeE5D36l4prMd7kSgePnmFxh6AMGMZ0+aMT/R60DcMwEjyHZ97gULdBW5BvL5NjeQEE8tjiD2p9q02YBbi040rqr4pQ+ElLAzNxv6HRYGMAKpHKaExc6iEp/82ui6lNt9Oq28eqyA+DJw9BXlZmqphiZDAA+uNibiyQdsQcDRWS75pwWHkovRykW6iVX3O7P2Xfdb/TuJSENug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORmZoagX9OM8xZcSDx9YfvNrsZL+Dsw/wOFJkrbOuEg=;
 b=haEBEJ9uXS/A13G4PwHNYn74fngVSZLL2WDjuuJWN+Lucl5O1Rsv9v72NmxQemJvxvC6BSIoaahK1Fd5eBZMC3PlYk5xvPNYobGACZ5gej6gLtNOEXk8umD1Xo8pMbQllfXcSVKgS8f0bmAO7Q2NZsMLkytpuER/KwOFcNiSDlCv3tDw2sciiOANt0lpqRlnJAW3dTaq5ScEDsooYtLsClHqdGcfXEV+q6Tdyfje7EKKAOgCbikcb9VK8R47BKrIDNeFDzMz+WalBuBrbbMe4JieNwkMzay1RT86G3g66r7S+HSJNIrARKhFQW7rCK+S07LecILTziE28109U1NNhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORmZoagX9OM8xZcSDx9YfvNrsZL+Dsw/wOFJkrbOuEg=;
 b=abIHbYvkp4+uN50lKEUYS7g4x9wCUubBkbZvJaMdrIcqJtB6DNGwL5M8Kc4r03Qo/lB6llI45jz4aXZ7GMi8CKrVa6bc7GOjCtZicrv4ii4OHT5mmS469q1YVAkdUNjXwVMTZ52wgehWFdn6mWGIT9gBfhaqIQUIbwcjoPEJmAI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.29; Mon, 23 Nov 2020 05:15:42 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Mon, 23 Nov 2020
 05:15:41 +0000
Subject: Re: [PATCH v3 04/12] drm/ttm: Set dma addr to null after freee
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-5-git-send-email-andrey.grodzovsky@amd.com>
 <cc970f95-ae21-ab8d-232e-abbddf7d6a0f@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <dd7e107a-d1c0-404d-81d6-7ecca358cd8e@amd.com>
Date: Mon, 23 Nov 2020 00:15:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <cc970f95-ae21-ab8d-232e-abbddf7d6a0f@gmail.com>
Content-Language: en-US
X-Originating-IP: [208.98.222.53]
X-ClientProxiedBy: YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::17) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.7.57] (208.98.222.53) by
 YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Mon, 23 Nov 2020 05:15:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 88166861-12f6-4e12-2405-08d88f6ed2b4
X-MS-TrafficTypeDiagnostic: DM6PR12MB4268:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4268DF4C2E77B8D53E629278EAFC0@DM6PR12MB4268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qnW/tgD+Ub79KlFr3OPmgARH3njQ7d+Vy/oMHdKoawvFEOj98po3910FwPVqtsShACAHYhTJcNY486+TkY2LEGVSrYL02a+YndoEiYWG+bFrEzHIabLbYz4ynXYoo0gAby6jVtuxr2LxV08gfPQNXhEVH4ONdJyrqAeuKmHvKkAt2pm2QeQ0GbVd6EWDmypX23SnUXLxAqFZ7zRQ8yffnVph9EH/CZbRWMsrsGPcnSPpDdGLmZ0QZcdfSK3BGtgqC6MHy9GmYcraNvDNWHr8ATgAbc9jKjIxwhNc6+8z/CyQQ5Mns4lpsVKBR2q2K/snjcERtb2wue/FR8V+7uOZVtTixjUgdMAWLQJG4OZhmQ60XsVtcfb1D+UFgWui4D0i0SWTM94A7CUc0QiLpEuRR5B/akxq0/1Edq40DOANRxFDEPw+dmC3XGRFOW7vxsYq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(316002)(31686004)(66574015)(16526019)(6486002)(16576012)(186003)(52116002)(26005)(86362001)(31696002)(36756003)(2616005)(956004)(966005)(5660300002)(66556008)(66476007)(66946007)(4326008)(53546011)(8676002)(2906002)(478600001)(45080400002)(8936002)(127203001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: P5noLa+UWYLF7D1dDnY3l/XueSWtsvaNyNcW2u7eZIL2a9DX0140IFJ9sTWx0cV/0W+ust/AqZa2d14gvf77s/RURIh88K/dtgFCRuF2Pgs2r03akbW1XwJo3jErxht0wTZ0P+iMF8sbWkJNXfw9A+v6YyTjvT6ESBec2qcxmOoVSWj8w2Pq9uExkRVKMBxCiAjycRcWIEoawZQOdpLM1a9Cc5uO1ffsQprDk6qmhsdcHFjQ2uVPs5vbrQWDPtw4GYhpxeY1853AewWJ37S0E9hlx7PK9kpulZmxnajipcMQzNHMBwWHNKNErkGeP2xvL8DRmLVNkCKhQIH39aFyZHTDY+q08qBwkseYPcyR7PlWV1uJ/IPhWpY21yehVmmOKj6Zl1DSnOYXEEm6fMWAaeG/+BWgxQRJQpCrVGHeOoXPNjrs6ZIftuw4wVwQ3QRDEdgrHzqDy1SSMbr1wl+AXxn5JwwcX8qkTJNr6WYyiXpk/D6rocYtUumjh8W+iYPi9V8IZObyZ+zakXETRlPFFXerD+ExJ6ODyIDnFJ5Kru0Z0xpYkzKTd09LEKy3iwC1syvxaF1hnoPI6GwV4hAITAkfYo02roRep3sjad4+skHjigJieX31OR026PTGf9BafMFXr/v5rJtwaqNxuYx1LGBNzqcULB3aAQqFOOWETegYx+fVWTaa0ULjmEGWfd9Yapyuc7lDmiKf9jkv5ckDGDie9tRRFNjdpAdgmF/fkF7tEPKf6wBvOfDU778no50KTnKROpg+Vydr1JuujCBCYkqnBEM8gif1C9mk1QMdtAZGblUoYQfNf2Ld1MTb5DLVgqhTBqM7fy8qdqMpiZ1drHBZsmDn87xw2B1uJn7u4gpg6uly6M9C7ahwOVR7JuhVrJiyUrusWUBSBxkodeoWkQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88166861-12f6-4e12-2405-08d88f6ed2b4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 05:15:41.8534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SwAV87hcVbug4hC2a5S9oxRSFq1nKlk16OOsqhXQT/mhZiGTPZraVqZ7mEXy4RCHwcrEOGIST/9K2PNWVo26w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzIxLzIwIDk6MTMgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjEuMTEu
MjAgdW0gMDY6MjEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4gRml4ZXMgb29wcy4KPgo+
IFRoYXQgZmlsZSBkb2Vzbid0IGV2ZW4gZXhpc3QgYW55IG1vcmUuIFdoYXQgb29wcyBzaG91bGQg
dGhpcyBmaXg/CgoKV2hpY2ggZmlsZSA/CldlIHNldCBkbWFfYWRkcmVzcyB0byBOVUxMIGluIGV2
ZXJ5IG90aGVyIHBsYWNlIGFmdGVyIHVubWFwLiBUaGlzIGlzIHNvIHRoYXQKaWYgZG1hIGFkZHJl
c3Mgd2FzIGFscmVhZHkgdW5tYXBwZWQgd2Ugc2tpcCBpdCBuZXh0IHRpbWUgd2UgZW50ZXIgCnR0
bV91bm1hcF9hbmRfdW5wb3B1bGF0ZV9wYWdlcwp3aXRoIHNhbWUgdHQgZm9yIHNvbWUgcmVhc29u
LgpUaGUgb29wcyBoYXBwZW5zIHdpdGggSU9NTVUgZW5hYmxlZC4gVGhlIGRldmljZSBpcyByZW1v
dmVkIGZyb20gaXQncyBJT01NVSBncm91cApkdXJpbmcgUENJIHJlbW92ZSBidXQgdGhlIEJPcyBh
cmUgYWxsIHN0aWxsIGFsaXZlIGlmIHVzZXIgbW9kZSBjbGllbnQgaG9sZHMgCnJlZmVyZW5jZSB0
byBkcm0gZmlsZS4KTGF0ZXIgd2hlbiB0aGUgcmVmZXJuZWNlIGlzIGRyb3BwcGVkIGFuZCBkZXZp
Y2UgZmluaSBoYXBwZW5zIGkgZ2V0IG9vcHMgaW4KdHRtX3VubWFwX2FuZF91bnBvcHVsYXRlX3Bh
Z2VzLT5kbWFfdW5tYXBfcGFnZSBiZWNhdWUgb2YgSU9NTVUgZ3JvdXAgc3RydWN0dXJlcyAKYmVp
bmcgZ29uZSBhbHJlYWR5LgpQYXRjaMKgIFsxMS8xMl0gZHJtL2FtZGdwdTogUmVnaXN0ZXIgSU9N
TVUgdG9wb2xvZ3kgbm90aWZpZXIgcGVyIGRldmljZSB0b2dldGhlciAKd2l0aCB0aGlzIHBhdGNo
IHNvbHZlIHRoZSBvb3BzLgoKQW5kcmV5CgoKPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6
b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMgfCAyICsrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X3BhZ2VfYWxsb2MuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMK
Pj4gaW5kZXggYjQwYTQ2Ny4uYjBkZjMyOCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fcGFnZV9hbGxvYy5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bh
Z2VfYWxsb2MuYwo+PiBAQCAtMTE2MCw2ICsxMTYwLDggQEAgdm9pZCB0dG1fdW5tYXBfYW5kX3Vu
cG9wdWxhdGVfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCAKPj4gc3RydWN0IHR0bV9kbWFfdHQg
KnR0KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX3VubWFwX3BhZ2UoZGV2LCB0dC0+ZG1hX2Fk
ZHJlc3NbaV0sIG51bV9wYWdlcyAqIFBBR0VfU0laRSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBETUFfQklESVJFQ1RJT05BTCk7Cj4+IMKgICvCoMKgwqDCoMKg
wqDCoCB0dC0+ZG1hX2FkZHJlc3NbaV0gPSAwOwo+PiArCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBp
ICs9IG51bV9wYWdlczsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgdHRtX3Bvb2xfdW5w
b3B1bGF0ZSgmdHQtPnR0bSk7Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2su
Y29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJG
bGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTA0JTdDMDElN0NhbmRyZXkuZ3JvZHpvdnNreSU0
MGFtZC5jb20lN0MxYzcwZWI2MDJhNDk0OTdhZmYzNTA4ZDg4ZTI3YWQxYSU3QzNkZDg5NjFmZTQ4
ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MTU2NDgzODEzMzgyODglN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENK
QlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9cDhIanJFZnlkS3Jz
cHNGQ3AxdjhLQ2RUNmxLcjFPRUtYZEYzJTJCU29oNHprJTNEJmFtcDtyZXNlcnZlZD0wIAo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
