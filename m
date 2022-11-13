Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BE8626F84
	for <lists+dri-devel@lfdr.de>; Sun, 13 Nov 2022 13:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0731510E20A;
	Sun, 13 Nov 2022 12:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn2059.outbound.protection.outlook.com [40.92.98.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4D1910E20A;
 Sun, 13 Nov 2022 12:42:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8pNtE+RnJH1CDj0KniH2VjJ3xYhEl0OPXyPgOHoIKHnrnlczlJnE9ia8377Ayi/rzXqgt3DL/ZR8fkJniUjOlk8/4HaoTsWT6S8Cr5hvECK4nCA/8G7J+fhi0yykUUFJpktTW8Un0/m5ibKNC2nx+vlBoDyfedkLWyABuVSkLJDQ9NNDSvhcqxt+VIozpTMkNMY+foTac2HFtUed3TDF05+aRiVrSGFNTdkCifDlrHejeTiKycIlHKtTB9R5e6P5jK3y6zWh6hnJ5FsIsH428oo6rKguETsb0sVoxUhmEp/G291hxI15Bmq4VIwp7EKi3I21nLETnfgYo42CtzCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=orgT42Omv8iP6Yl7CUg/UjNucnJq3jfST9+LgqExNQM=;
 b=YNG7NjU9Fq7FAWBSGFVN3Hk0JFB4rzgT5yX+jLfg/tPZqwSRoHRtvRENoSiH2XVpl7FiWEFfoDWpJCd1X9sWRF4n1Sf9s5WhCDxOrJASTBHsrhaqRlzaGiwvLo7FiJ1JQZ07/anDSfFBkmiAvGZMq19BuaciiY9WVLMCqKLbhVAJuTHlUCYJJQ7C3XmfwD5RDG1LUxP8WkPFBliBGzpmrWG/ZYf3ADZK11oV4bLvkJoiER/xIwHTQR9Een5lTRa6Y3h9J+w1uPJFO8pqH0ompmvM6pmqHV1VnMrG+Ji9/2wa+OnwAfFJxyyMeJazxaqQhrmXWhpcUzScvbfEVxcdbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orgT42Omv8iP6Yl7CUg/UjNucnJq3jfST9+LgqExNQM=;
 b=Tz49o2MF2b33FdquYkaHPOgqC099U9MdzjC3qSuAoFNmzTRHbAgRlyrsRbmZA8rAVQGoPCJ5OKO1Uc1TQZTF0edm8wNz28pzimSYllCcSqEcYP9mFzJs0ov6GCXD6NBUj3EtfWpFeB/v6IKhT/U38I+YfVn3Xdi3uzWIrLQG1qXWRUafFxhYxQ+wKwWz3jGvdJKpCQ4mQeI5VaUwXzjii7tio4wrUfh0X6ao79/fTss2XUyAR5aNz4w+k7pJGCQKfIsVz3/NV0O6ZX3WhvXvr7kCBqaS3QPMH7q+0JUt87ke1iZOkbwKK/QGtEmgc9Scnu3OZyWCpuu25s9rL4tipA==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by OSZP286MB1558.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Sun, 13 Nov
 2022 12:42:28 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::ff96:9cb6:e047:c605%4]) with mapi id 15.20.5813.017; Sun, 13 Nov 2022
 12:42:28 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Subject: [PATCH] drm/radeon: fix potential racing issue due to mmap_lock
Date: Sun, 13 Nov 2022 20:42:15 +0800
Message-ID: <TYCP286MB232339970F7009B962E2F1BECA029@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [0+5NliQOW+jHJS3TfmEQZoi9idqBjqK2]
X-ClientProxiedBy: SG2PR06CA0229.apcprd06.prod.outlook.com
 (2603:1096:4:ac::13) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20221113124215.2723318-1-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|OSZP286MB1558:EE_
X-MS-Office365-Filtering-Correlation-Id: d18a857b-f5f9-47df-e3d5-08dac57485ed
X-MS-Exchange-SLBlob-MailProps: fNPDeqDZc0LhcnwXkCC2ybqWGJ5u/EXML2J5Ddo+QJ5u30gFk+ZKLYkdSu0tTCFt800dTSLcaHk4WFJbwHSYwehJ3096e0EX8MJIcIERgHFXHnYY3YvEkSAFJIvrSi3ZRpAejPSZd0wfoEPFScYbnWpudgW3hf6D3AwD6NJ8Qob2HV89I77mEZbH5oHbgfVXge5bmxyZPGRX4T35jKXG6hF3BMRKk1FAAts/lnn5tiPoIcihVg6sgVLUfihn6H5B+HU04OnCsm3qaUKi4SWSMWIKQp4g/nzlhorKCoGfHcmV/5wp6KM0wHAUWHpA+G+HI1E8fngzyGS+xZszchR5hm+tOJCT+dNduvAGk66z3yhECengGTkxqkSTz9//Jo6//rKEJOZcUx5RlxF0BOYD7aNQI5ZrBXUFaWjkpHCOVpY2FzyKuKd/UuLuhQXK4nlmSnpTi3fjP5nMTHxpDdnUankNJEYnVoa+4gkOR79bXHV1aHsHtw1v+kECZqaR3Rpk8aI4bAH/+diwMDubooQVEs3zfCBMedM6HozXcQZDO9WwFCCX6tqDxPLeaRFs1B7To6m0EbgtHwcPgXyZ4qLNl2UufXmp78UZXyChOoct/xDu6NCJ9MWpt8DvElnl4rdRC+1/CbfdT7id7/BsuHlrEwDkBvRDrz7IkE/z32jLNBw8xOOLG+ysLwDK8KgiENkIB8rZOf4LK3V6ErcbAvgE1Ly1xtd+AsoG79K6PAUmK7w++DJgzqJKs2Ysod8HTtjUv9jK7QnXEOM5odAetIIeXg==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/I8NVe4zX4XdR2qmsgQAucQngA9KUWcN4A/KohD1EdIB+Og3krFZYbYBZZTqMwhia2fjBmSlFJAeuz6awbqt92Zw/641J+3KLQ185LDPdKIjQscE0XkW6NJ/AxNZHYjrlOhxcah0L70elBVhaQEoRGT4RGyZuvfL/oE6AEXxTntnStvgNRJJVxufLr8z7azp92JIa9vdBInWJdC/e3aooUSl7iAuCzkXmD54MmDf+jIj31rao5GL/aC3wCyuHTInvHHKXSTfWOl/1+isx5ch/mLCxNiXy98pPKQ5hKOhthS0sVIA5bJyAiiEahL2u0q1etVZjjR2hT4f5XoRLrNydADsmaLRAzJdQwGsYcOETFG0DrehlQkzhdbHCgRTEGF57L9vOlWKELyhchAH2CVpmPXZcrWuLcGr4H9u71dte+5NA7k3MqqWPwQDcD3tJ4RXlmvVgU2X4iEHCPL0JtVbM1T7c/nRWGKe8SKAciWx/Buugbyf2CZ6S0YrICVGiZBmgaSgYK5qxoIS/4oXRAy/T338NhxVnidJH7jnGwKPqinNBFNsayqqED/Z3DpCazEErFPgL/UOjnYiskEKW4wV27nfxJl1nYPf1fvksDKNM5adTeBhe9P+yC2cAL3hosg8NUWlyUbXjE4oGxmm485Ftp/uyG5s0hD2+hrT2ZuaIYRnf8h2fSzNjx3tZ2ftuLD
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t3mjIGZkgsc+5fuYUI9xzct9v+o2yzb6tvygltnICeQQCM5KxtUmN31pkec5?=
 =?us-ascii?Q?ES0nhyXsJAk1QC8iN1/WlxjVU22lOo9zU4YAVX/Pi5BFBjVSHS6XLEzThjPI?=
 =?us-ascii?Q?v3OPf18g2ZaP6zB34HgbSEFDXOHf9q446WaqHaGyJQ2omUmQv2cfqevdfpap?=
 =?us-ascii?Q?27TAJPuyWe0JRL1weZZGE0xMLy3GkZqM2BeT2SjMiGTzbpIv9cwYdnS/kXK2?=
 =?us-ascii?Q?a0mI2zJqSAj7X1gEjQrlLVkXh0+GH7CgIUXK5qQi0xh9Ngr7gM2n95MbqTyZ?=
 =?us-ascii?Q?GtLLIRcTJz7e1udZWkBrGiaEEZq1IvOzI9Y7GJE+tPVQr2ZLoZDiZMl9YZiQ?=
 =?us-ascii?Q?h7ixvP225b2pTn5LiayFgBAwhV1KyhzDswkxQDPhhMwCCciQiKnELy9hMk61?=
 =?us-ascii?Q?H1e7mTHbNQHtWdkjHNqEEMoOL/txxb9f/eWIHSuhOHXkOI1I69n5UUNTDFQG?=
 =?us-ascii?Q?Ta01BG1gc9YueutcSuTZQc06cmYDBpBU2MXq/c0Tvp+gTQdgs0PvZ3tMREFt?=
 =?us-ascii?Q?5raO1H8+k8gIeb2PtCtTiKP5bzzp77T8Sth6LYvClB1G9U0gimFlphG68nc2?=
 =?us-ascii?Q?TQd9E3j4DoIvqSLNhJfkKWbH7iGeOCu1LgFyVoN7jN7VWY22UAq4EW5zcycg?=
 =?us-ascii?Q?btoAk2lYOfOj5Er38lpepXxaYs6YoXUvV/RIS6OwKOLsF/vgMtdnAI59RcQl?=
 =?us-ascii?Q?wPAeZ8IHpY8/7V1m6qIktznBZkE+hF97phbVobxhSeV10VXyvSxFTRXSRqg2?=
 =?us-ascii?Q?4rcaVVo8p8aM0tJjGiVyaEKFlM+Dico5gDo7zqpoRWQKYbURFqdrkAsfSKXD?=
 =?us-ascii?Q?eYO/Tyijcz86I55LMQHMSbNYcRTZzmXQcfwKkwaVd+V9yDNBdSU4Se6eP2wG?=
 =?us-ascii?Q?JHr3s6PSP8zMsD5eo5RkF7kUaG/BhAO4luQUZH1PkRzta9NsxdXqDaU29vj9?=
 =?us-ascii?Q?QMaYQqlR53HpOlivcj7Wem+izu8XDac0o07jlHwQK/UwY9/ZkkX7P1KWaH6y?=
 =?us-ascii?Q?jB5demSKC+vXigItmUGHus8j+I0TvAMrvDmmMXkFVRFIwpAqK+tLN9PUvIHR?=
 =?us-ascii?Q?6Og3P3m4C/1L7UzbjNSXQCSaviQqV5r9RZKahx2mdXV1mlABJky8GtnnsxoZ?=
 =?us-ascii?Q?1bHuSng6l3U3AfI7qSELLIxQL1l73j49ZefYWWmySrinFIUKgo3Au9dLYw0a?=
 =?us-ascii?Q?/qqIg+//fRfeKBDJB1j/zFzJjomebt3x4prX0SbwohrF32zuErD0bNJC95f4?=
 =?us-ascii?Q?VmDYFqYnbapjk5W0mW5OGA0H4LSdWZ3SsQ7MHpWoKQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18a857b-f5f9-47df-e3d5-08dac57485ed
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2022 12:42:28.2384 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZP286MB1558
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org,
 Dawei Li <set_pte_at@outlook.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both find_vma() and get_user_pages() need explicit protection of
mmap lock, fix them by mmap_lock and get_user_pages_fast().

Fixes: ddd00e33e17a ("drm/radeon: add userptr flag to limit it to anonymous memory v2")
Fixes: f72a113a71ab ("drm/radeon: add userptr support v8")
Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index d33fec488713..741ea64b9402 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -351,7 +351,10 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm_tt *ttm
 		   to prevent problems with writeback */
 		unsigned long end = gtt->userptr + (u64)ttm->num_pages * PAGE_SIZE;
 		struct vm_area_struct *vma;
+
+		mmap_read_lock(gtt->usermm);
 		vma = find_vma(gtt->usermm, gtt->userptr);
+		mmap_read_unlock(gtt->usermm);
 		if (!vma || vma->vm_file || vma->vm_end < end)
 			return -EPERM;
 	}
@@ -361,8 +364,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm_tt *ttm
 		uint64_t userptr = gtt->userptr + pinned * PAGE_SIZE;
 		struct page **pages = ttm->pages + pinned;
 
-		r = get_user_pages(userptr, num_pages, write ? FOLL_WRITE : 0,
-				   pages, NULL);
+		r = get_user_pages_fast(userptr, num_pages, write ? FOLL_WRITE : 0, pages);
 		if (r < 0)
 			goto release_pages;
 
-- 
2.25.1

