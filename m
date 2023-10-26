Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F387D8728
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 19:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288A310E83D;
	Thu, 26 Oct 2023 17:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04olkn2086.outbound.protection.outlook.com [40.92.73.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099F210E83D;
 Thu, 26 Oct 2023 17:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkGSRHXK2u2/AkNrPRaBWPxTN5U1bcm7lYpL/bncma7s5TVy7/ngv1BN1Dh1hkpzhvkMahl1PhPDEZNxgpjtmtzdbxLUIlUJiia5P3LxOw8B47isIiVgVnDd5ecVajgxB+qKhsioVX6tNsn6zhCQjTP4/XBtLbG7hcmqUhaxz44ZRV0fslXLqqz8dC2c8TH0IljQ6inZdFerzT09heIUwfQjD/r1S+ScauZW1Sdwp1/fQW8L2te8SqapZilRKOAjpDLhpsIEhQVIBiBrwR05GmhKKuGBSbF//n4R/SwCfKcCvKZv5F8W406+OI9E/UMSRV6dI71WbFWF9jT+BONlfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DySbyAS4MuNDdF8DJ1MsgZREpdIzLojtPz8AN28we9o=;
 b=EqAx3OPn7hW1OHH0H0n0PDbB6WUyLtDHX9LeI9WPvJISeNqEb5fhmvHaANVyPvhcVukohkymyvmth5UswPmsDuMlNrN9thBd5fMBUI9sooqk/2Y4u+CDtcXQ1vlRJG/F6PSGL4HL23PfSa6ZPGgKDj5NAuuJGQN0qR8mbdGDRvbBBLtL41R/cEAh3XNjHZj0GDJ/NS7iOI+aIhUpcH2IuXM0M1f7q5f28AtdFEe8pi04/81qsDhOiJ6y3KPBt1rVrDhWnoxH3ZxI5D+t6gtzLKxsSc0ChSNDglV4HOUZnDQQmKchTTxRCdOgaCy4LA8MGEuM8BZMQ6AT8smAmPFV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DySbyAS4MuNDdF8DJ1MsgZREpdIzLojtPz8AN28we9o=;
 b=b4HUVQQ/GEey28sZ3DdLM9ILiAldk6y4YaC/FU99jRF4PiDJEkMWdkDA+4xuLfA6ucLyPHw8ksus7b3PDcscj3/6WrQwCY9VeCd+tEpHzCImWdulPV97WbNCj4gsNJVmJ9XCmW8p2Z+h2t0Y+19+I00/ijIVVg0mJBUhFXJFPXyB2Cl7opL7oZwtkMxRHLQ9ZiDVmTBgHgTMWajW//5dF9MgVT/CMdeJcvTHirf3fc53xtriYLo+1qUP8yG0OBWjlGX4IYq19IjE3XUSDFIofuHehPxiOZZoWtg+fQTIMt50VMnke0yvaBzd7pNpR0LdM8WsmAIOzFNLm3i6vjTAkg==
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:42a::7)
 by AM0PR10MB3156.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 17:04:07 +0000
Received: from DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97]) by DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e2b0:8d7e:e293:bd97%6]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 17:04:06 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: airlied@gmail.com
Subject: [PATCH] drm/nouveau: Prevents NULL pointer dereference in
 nouveau_uvmm_sm_prepare
Date: Thu, 26 Oct 2023 22:33:40 +0530
Message-ID: <DB3PR10MB6835FA6E15F3C830FC793D2EE8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [a4ahwLf7QLcym1MdXngeSfHtBkMIiJNr]
X-ClientProxiedBy: JN2P275CA0003.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::15)
 To DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:42a::7)
X-Microsoft-Original-Message-ID: <20231026170340.1229132-1-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR10MB6835:EE_|AM0PR10MB3156:EE_
X-MS-Office365-Filtering-Correlation-Id: f895dcd2-29f6-4ae9-586d-08dbd6459038
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4hf+MRy1VZqH34l9xHxRby1/Pdz7Ra2vKqsumcGu/7mLG0OJD9b/5vmGOKNmQbD12TgbxOx4cD+IY8emY+8fer6LTwWDafTKsQk5wI90QNvuzCtcoUDxxaFGkmxAHkwgKRVucY89JUGaKu+/rJ/CUx7WjjKshzTczo2IinSyZfacJ1nCf2RKx1bC76ohEUaS7WuiQvAdWz6rAwrY9hND/zzb9rrfvKU3se2fSwgCnRRduwM5nNLylw47wfqIo00huyWWqYohiARHzJUVghgdedy1cZfKIkP4PDYcTclcYArYUrftJeImWw/u86zUcwD7wi/A8w7LZ+JWrhq7nlohA8ezYIHdVQo/MbWusN2iQoK5Kz8GXglcdm2vjuIaUFl1mKiBSYYhmoj/f/b+u7JXf+EpLQYjx9g0QBH5LHT3M+p5Q/091/1SqRicMDHFr8Tz2y0VfZba7mymMkHDAhpSwenvct96YPAZZQYu5StbcEVNmMkkh4QVmNVV5o7HhLoxR6oH8EvrniDZcUd38aLdaqE7ctAceU+O80o6l+Xoh3Hd8wiBeq0Xo9XGAXOJAtXDpBwudlZvsiOE9iWJ+Xi03mYoYDdbE9Ht07KbrO0ntWQLAtywjabgFzk9vja3McZS
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a97BNOaUMumDoLUEiNtfOO6f1zfrvCzeExZHbuHXIzi7eRp2PiVFDlI0EKbH?=
 =?us-ascii?Q?oauibER/ofwErc6oZmI/jJD7Hq5//9obUYe9GJdVCvFLpZJUyoYq8ILgDXgI?=
 =?us-ascii?Q?pF7fsGxDstR/9pAVWLLMYjosw7FOxyqyLYTWlqVLGSwsjpl+TmvK3nOtIfWc?=
 =?us-ascii?Q?HpXOozcbEH48xMr7UKa+kErmDlrX7Yio5pQMLwyYfPiLQoexfOme4MFkj8TC?=
 =?us-ascii?Q?YdpYyRVmki7ZRXZATLMxgaMRW3OJvDGtb6PhphZdfaVDJ2JIDJJ9U6f7GDOT?=
 =?us-ascii?Q?rdhGu4nb2IlnWj+goQPt3c7SQ8aZsHRkbWYFILgOHj003bSpsGOlm+JBsNno?=
 =?us-ascii?Q?Ykvusgaoq+g3kbhc4qjF/E4C++iapsdXwWnsuwLn9hWX3ZcfDVU4YXUFhn7S?=
 =?us-ascii?Q?TSj8IRemeTx0Scy5V8uukbv/pyhuXthQadRQzXB9Sj5/Hw9xPBgg45N6aBWW?=
 =?us-ascii?Q?yJw9bxu+nw1Arth1rNfmDN6z1B+f96dUZdSi4rsQPc+YcwZX39/Xx/fwT/l2?=
 =?us-ascii?Q?6lXEl4H3PSomxBNuYewBTjg3qo+4JDDNBTdE8a9hHOC1A4wz2ajjXYzdHjTO?=
 =?us-ascii?Q?fNeKXBL23ou1hSmvDX3kXRsS3mMxWDAiSE8h91Gc+xr9p0MdkUvSgzktaBk3?=
 =?us-ascii?Q?dOf33ynFT4C5mXjR4Je4HAGBVU73M4voUYIxc/VuW7xznaMtp9X626qk/lpK?=
 =?us-ascii?Q?lTKwM8S5awzcchnLpEA2AD3G4PNKe1XjT2Kig9U8CSxRADlm8eaS3a8iHaLg?=
 =?us-ascii?Q?lIxzQluq5hp9jd3vfPX50csY8ndmWxRgy4YvfVBPvcQfo5kKDvln90lX/CRt?=
 =?us-ascii?Q?nqhWqdzo7IuLDkyczGj5e0o6zgedsEunjtbD7bdgkW6bkSEKOxFz/EIRoKvc?=
 =?us-ascii?Q?njgO6vMIwMsDT2qU6l7jLIoNw61bqMxvi9Irha50k1IDEJqWUtprInwDeFBm?=
 =?us-ascii?Q?vDxSMbsnIKoegfCt6A7JhAYFwNtWLjCBvzEzaL538pA2oUHm6fpEuth3cqFu?=
 =?us-ascii?Q?33F4f2nsZCxowj2j8ECE/0cSRfbbUUaj9kqWnglFbB4FRX5C62eGSziWt5Bs?=
 =?us-ascii?Q?Y0f+ANi3avufoFBSI5ixRuLJqlABMecgfzvv8YWmeJ9HEwIDNhl0WMPvJIIT?=
 =?us-ascii?Q?mVPwk5Ct/8IFSH8zyg+HM3CQhoEcMn29Ok8XMC0USFnqDuMlKBVkZQep2ELr?=
 =?us-ascii?Q?MjONvzPdgQs4kwCOrdiAEkXyvJFjVm2rQOkxwBqUtKRVdnaUEK/7gg84goo?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f895dcd2-29f6-4ae9-586d-08dbd6459038
X-MS-Exchange-CrossTenant-AuthSource: DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 17:04:06.7700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3156
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org, dakr@redhat.com,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are instances where the "args" argument passed to
nouveau_uvmm_sm_prepare() is NULL.

I.e. when nouveau_uvmm_sm_prepare() is called from
nouveau_uvmm_sm_unmap_prepare()

```
static int
nouveau_uvmm_sm_unmap_prepare(struct nouveau_uvmm *uvmm,
...
{
    return nouveau_uvmm_sm_prepare(uvmm, new, ops, NULL);
}
```

The problem is that op_map_prepare() which nouveau_uvmm_sm_prepare
calls, dereferences this value, which can lead to a NULL pointer
dereference.

```
static int
op_map_prepare(struct nouveau_uvmm *uvmm,
...
{
    ...
    uvma->region = args->region; <-- Dereferencing of possibly NULL pointer
    uvma->kind = args->kind;     <--
    ...
}
```

```
static int
nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
...
            struct uvmm_map_args *args)
{
    struct drm_gpuva_op *op;
    u64 vmm_get_start = args ? args->addr : 0;
    u64 vmm_get_end = args ? args->addr + args->range : 0;
    int ret;

    drm_gpuva_for_each_op(op, ops) {
        switch (op->op) {
        case DRM_GPUVA_OP_MAP: {
            u64 vmm_get_range = vmm_get_end - vmm_get_start;

            ret = op_map_prepare(uvmm, &new->map, &op->map, args); <---
            if (ret)
                goto unwind;

            if (args && vmm_get_range) {
                ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
                               vmm_get_range);
                if (ret) {
                    op_map_prepare_unwind(new->map);
                    goto unwind;
                }
            }
    ...
```

Since the switch "case DRM_GPUVA_OP_MAP", also NULL checks "args"
after the call to op_map_prepare(), my guess is that we should
probably relocate this check to a point before op_map_prepare()
is called.

This patch ensures that the value of args is checked before
calling op_map_prepare()

Addresses-Coverity-ID: 1544574 ("Dereference after null check")
Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index aae780e4a4aa..6baa481eb2c8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -620,11 +620,14 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 		case DRM_GPUVA_OP_MAP: {
 			u64 vmm_get_range = vmm_get_end - vmm_get_start;
 
+			if (!args)
+				goto unwind;
+
 			ret = op_map_prepare(uvmm, &new->map, &op->map, args);
 			if (ret)
 				goto unwind;
 
-			if (args && vmm_get_range) {
+			if (vmm_get_range) {
 				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
 							   vmm_get_range);
 				if (ret) {
-- 
2.25.1

