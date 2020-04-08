Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE1B1A2423
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 16:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C356E128;
	Wed,  8 Apr 2020 14:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2E06E128;
 Wed,  8 Apr 2020 14:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crxF87j75nByOIb9Ob6/4hxLxI2laVKkOdIRpnuDaX/rf9Um9IV9pfF6MwTgd5AbFC+UZLk3lKo72A6mkSrWEPVEiBDHf8Sroicy3gTM5aC3u62PaJ08LmcAFX0B3B6gYNw91hUKoqIcenvGmTUg+IMFKUpvTdnehBRRUrdLU5fxZmkTybJJxkDyWYoXL+2ErvfFe1FFkBKhCFtnXMaVavrPLQ+4Lp1ftCGIJpjbMGoMHuFA8F7ABqMj8y55x81JBCigN7dt0uEllMp//ji6pysb51pFfBEAMjEyYvAvY/84j8lfzljsLZ7FNDCLxIfmr78ne8FRhC/RgRBNRsMhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7pOePAjJXo1uU9hKDb4ajBsQI0Xxf5iJSvHxbyQPNo=;
 b=NGJT9BXJkDk439DVVrzrhz/n2D3GOvULVpRn5lDXCTxW/nhAk6jyKkAms2Jrg5yVb05O7/kOCr2qJpvy8RE4+55MVIxmmaigVrTio6I0VsvtcJUHdKBQI/PVlBgO2Wry9ffHaBOk6mClRUqaXVllZ/2VLoNtDSHSyVgojSbjSXPxRRPaui17VjNKGMm4Zmvujf3AD8Q3kW/ENTTyaTeBQl7toIGvtOweNBssIpbDuSRB+zwkqHuyKnyLVzm/Q1P2KyC5BoWjRATqpANh+JKZxY1z0jdYlJX4W29nGl/FhkIzLXBpu2lNXRZLZDoLaCLxkcrfHUA5iDvojAfYRXqIvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7pOePAjJXo1uU9hKDb4ajBsQI0Xxf5iJSvHxbyQPNo=;
 b=De2ttiGJfIDDM8wqsBjCco87nlfWMw9AovLpMpuaY5g9IwPG+ODd9PDYchNtbo+/HuTjDbKlBf+BFw70nf6ZhjjRZW52/fT70FcJmPc75O7hMqXnUV20Ap9HKk0/CLzAQQi73CTplIs01oxnGOWlqtesyfKeVT2JFCtAN499tg4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Wed, 8 Apr
 2020 14:36:50 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 14:36:50 +0000
Subject: Re: [PATCH v2] drm/ttm: clean up
 ttm_trace_dma_map/ttm_trace_dma_unmap (v2)
To: Alex Deucher <alexdeucher@gmail.com>
References: <1586250773-31519-1-git-send-email-ray.huang@amd.com>
 <58129925-9bc4-25bb-6f26-69e8362b4c9e@gmail.com>
 <CADnq5_P8fFBj2R+owKoX+YEdgOExPMoRKrJUuhVBKroEtBW9Xw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ef29a057-7688-da7d-05f2-792c2d015a54@amd.com>
Date: Wed, 8 Apr 2020 16:35:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CADnq5_P8fFBj2R+owKoX+YEdgOExPMoRKrJUuhVBKroEtBW9Xw@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM5PR0701CA0064.eurprd07.prod.outlook.com
 (2603:10a6:203:2::26) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM5PR0701CA0064.eurprd07.prod.outlook.com (2603:10a6:203:2::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.6 via Frontend
 Transport; Wed, 8 Apr 2020 14:36:49 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: abd96911-b335-4ac2-ae1f-08d7dbca463b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4404:|DM6PR12MB4404:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4404BC530E8E45A2C32C8A4583C00@DM6PR12MB4404.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0367A50BB1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(66946007)(31686004)(36756003)(5660300002)(66556008)(66476007)(86362001)(31696002)(2616005)(16526019)(186003)(66574012)(53546011)(6666004)(8676002)(54906003)(52116002)(81166007)(316002)(8936002)(81156014)(6916009)(6486002)(2906002)(478600001)(45080400002)(4326008)(966005);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 32fJICiXglNOgSzrESWUQkpfUPDytttfSfy880N/9LURqN4pr09R5jUPX7oaOW+f88NCSk4lENhEx2nqOu1P+NdcLgq3gOuOWA/Ps+MtM/eGsiThF5azSp3uG+5NDptm37q4OV9ORbh6DeptMmeB5kIgBTmfxjRjUDdNgE8Gd9u4ChRvWsrbFWhPr7WJOSZcb8FxomWgxk3qILcdaK2coKlcJI6MmRBiDfSzVrddPsmlUFX0ufEwaWVu31kt5/4Q3d3REwtx/AT2P80O2l3ukvcLIrKg+8hFF5G3aAuxU7yVt9JC5st8EJJ6uZXVIF3zDsrQG+KRXYS23i7chn6ZzkbpXPSDh3kMDoPQaMerxfFvkPtaYl20T43dKlt/gnEEdPveJklUPk2saP7xfftsCTHXyTYvXzZ0C8oQxj9R2DuAm4e/xUfaHv7FbOpZDSDIJ+euRbnZxAvX93rR6IwBQgxUU4XCff8WoXDX8lOSuQ0=
X-MS-Exchange-AntiSpam-MessageData: 8r3jX/pAx/BIKqrTNwAQ9TieZKZ3kc7gAwke9luitgBUm3PWXEprrQHzVLrWipX7hY3wfH+M1jXO/2z4tmFE2Z67/KYjEJ8f9TzXyGoJhum8dxgAg2nJOJIsWDEND9GF8kcI3SGu2hfJRZzHOCCYls0OgcbVhW0fBFShWGNIXeUmcXfbfXA9Lm+LXQVczth8PDZjH0jq+AIaGrnAblyH2g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd96911-b335-4ac2-ae1f-08d7dbca463b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2020 14:36:50.5951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g77Lxvux6FTYb4wGQmRaw/AnZwle4BOqa42RRE4cbqHHTS5GtQiLDLuFgixYbd8b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404
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
Cc: Huang Rui <ray.huang@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDQuMjAgdW0gMTY6MDAgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gT24gVHVlLCBBcHIg
NywgMjAyMCBhdCA1OjUwIEFNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6dW1l
cmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+PiBBbSAwNy4wNC4yMCB1bSAxMToxMiBzY2hyaWViIEh1
YW5nIFJ1aToKPj4+IHR0bV90cmFjZV9kbWFfbWFwL3R0bV90cmFjZV9kbWFfdW5tYXAgaXMgbmV2
ZXIgdXNlZCBhbnltb3JlLgo+Pj4KPj4+IHYyOiByZW1vdmUgdGhlIGZpbGUgY29tcGxldGVseQo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+Cj4+IFJl
dmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+
Cj4gQ2FuIG9uZSBvZiB5b3UgbWFrZSBzdXJlIHRoaXMgbGFuZHMgaW4gZHJtLW1pc2M/CgpEb25l
LgoKQ2hyaXN0aWFuLgoKPgo+IFRoYW5rcywKPgo+IEFsZXgKPgo+Pj4gLS0tCj4+PiAgICBpbmNs
dWRlL2RybS90dG0vdHRtX2RlYnVnLmggfCAzMSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMzEgZGVsZXRpb25zKC0pCj4+PiAgICBkZWxldGUg
bW9kZSAxMDA2NDQgaW5jbHVkZS9kcm0vdHRtL3R0bV9kZWJ1Zy5oCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fZGVidWcuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fZGVi
dWcuaAo+Pj4gZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCBiNWU0NjBmLi4wMDAw
MDAwCj4+PiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2RlYnVnLmgKPj4+ICsrKyAvZGV2L251
bGwKPj4+IEBAIC0xLDMxICswLDAgQEAKPj4+IC0vKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPj4+IC0gKgo+
Pj4gLSAqIENvcHlyaWdodCAoYykgMjAxNyBBZHZhbmNlZCBNaWNybyBEZXZpY2VzLCBJbmMuCj4+
PiAtICogQWxsIFJpZ2h0cyBSZXNlcnZlZC4KPj4+IC0gKgo+Pj4gLSAqIFBlcm1pc3Npb24gaXMg
aGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFpbmluZyBh
Cj4+PiAtICogY29weSBvZiB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50YXRp
b24gZmlsZXMgKHRoZQo+Pj4gLSAqICJTb2Z0d2FyZSIpLCB0byBkZWFsIGluIHRoZSBTb2Z0d2Fy
ZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcKPj4+IC0gKiB3aXRob3V0IGxpbWl0YXRp
b24gdGhlIHJpZ2h0cyB0byB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2UsIHB1Ymxpc2gsCj4+PiAt
ICogZGlzdHJpYnV0ZSwgc3ViIGxpY2Vuc2UsIGFuZC9vciBzZWxsIGNvcGllcyBvZiB0aGUgU29m
dHdhcmUsIGFuZCB0bwo+Pj4gLSAqIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNvZnR3YXJl
IGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0bwo+Pj4gLSAqIHRoZSBmb2xsb3dpbmcg
Y29uZGl0aW9uczoKPj4+IC0gKgo+Pj4gLSAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFu
ZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIChpbmNsdWRpbmcgdGhlCj4+PiAtICogbmV4dCBwYXJh
Z3JhcGgpIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9y
dGlvbnMKPj4+IC0gKiBvZiB0aGUgU29mdHdhcmUuCj4+PiAtICoKPj4+IC0gKiBUSEUgU09GVFdB
UkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQ
UkVTUyBPUgo+Pj4gLSAqIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhF
IFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAo+Pj4gLSAqIEZJVE5FU1MgRk9SIEEgUEFS
VElDVUxBUiBQVVJQT1NFIEFORCBOT04tSU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTAo+
Pj4gLSAqIFRIRSBDT1BZUklHSFQgSE9MREVSUywgQVVUSE9SUyBBTkQvT1IgSVRTIFNVUFBMSUVS
UyBCRSBMSUFCTEUgRk9SIEFOWSBDTEFJTSwKPj4+IC0gKiBEQU1BR0VTIE9SIE9USEVSIExJQUJJ
TElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJBQ1QsIFRPUlQgT1IKPj4+IC0gKiBP
VEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5FQ1RJT04gV0lUSCBUSEUg
U09GVFdBUkUgT1IgVEhFCj4+PiAtICogVVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZU
V0FSRS4KPj4+IC0gKgo+Pj4gLSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KPj4+IC0vKgo+Pj4gLSAqIEF1
dGhvcnM6IFRvbSBTdCBEZW5pcyA8dG9tLnN0ZGVuaXNAYW1kLmNvbT4KPj4+IC0gKi8KPj4+IC1l
eHRlcm4gdm9pZCB0dG1fdHJhY2VfZG1hX21hcChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCB0
dG1fZG1hX3R0ICp0dCk7Cj4+PiAtZXh0ZXJuIHZvaWQgdHRtX3RyYWNlX2RtYV91bm1hcChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCB0dG1fZG1hX3R0ICp0dCk7Cj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0
Cj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxp
bmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVk
ZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDIlN0Mw
MSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMDYwYzdiNGU0MTk0NDI3ZTUxMDEwOGQ3
ZGJjNTM5NWMlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3
MjE5NTEyNDMwNDEyNjQ0JmFtcDtzZGF0YT1UMGNreUd2UzJkUXAwZWxaVkh2eThQRjd5TzJMbnVh
bEVEJTJGaWxFaFVxVXMlM0QmYW1wO3Jlc2VydmVkPTAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
