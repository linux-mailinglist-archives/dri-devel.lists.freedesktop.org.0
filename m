Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEADCC8FC4A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 18:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCDF10E850;
	Thu, 27 Nov 2025 17:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJBVW2nk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE87310E841;
 Thu, 27 Nov 2025 17:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764265854; x=1795801854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=vCTWq1cOEA62NmJmM5QvhN0At9/w5U/pSwbVlR0KSC4=;
 b=LJBVW2nkWUjP/6+Enx4bljWKWxobSB18KxlH+eyPrXd2T7DsUJFJeh/O
 b9KaxzSHKMh5soQzjnnZJa+5DxcdYRjMNnXadnuvxWgdXpkcXZuzmfwKk
 LXwccLkSeROjQqIZLM24uFOt71xlFg7K8UGJQSpSaExTLcJdXSqshdNPq
 SlL2iJd3RTADKUPqiKfjeBg4zl6hMHPIJq2BqJj1VHIJzRuMVf9LiLVZ+
 FrhqyyxfC1iM3O6NyIctZj1YRn3lmp0qnMtCvsM09J+jyrYMF3vv3hqOP
 XjpSUiNNXBowdGwO10jb58qdU17kfYGDBqxID+t1rt52Wy1Le4xkvsB1s g==;
X-CSE-ConnectionGUID: CSK1w4WwTJ2dzdUQzJvd9w==
X-CSE-MsgGUID: Nwj3deydQdG02WlqTB6nDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77676514"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="77676514"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:50:53 -0800
X-CSE-ConnectionGUID: Qjo4ahjHQ/edPsT+lQ8pEw==
X-CSE-MsgGUID: VZKePv/WSgaGF5ySDZkLMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="193082784"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 09:50:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 09:50:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 09:50:52 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 09:50:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSbVzv13k/1t1MlnwKWSu+xBNYKdNL+e90lK53FTe+elXNZ5H2eXI7ULnKIKs5BbR/trA0CfsDdtYbI7b5ijbl4NjUTtsI37Q1sd+cFZvf9ugvuCRyvKASkHIEcn7p/XfitJrGSUXrUbxjg2uLxDG3nENj+qFnkQAIVZF00SqCHr+v7TaeK4d2kiJXAPX/Yripinh1hdRy+PAH8Dj8vK+6XmAB8uqPt87iV9/5pjkL4RLaDCR+PzSQsA65MxdOjUXtEizkKNEewgrHYQjhBtE/z4Y3fBL+eyGd4csn3IVEFfiWD5lXabOngm1s/iTIW9s/0O3/onCMPFPtlt04nKvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZrWXTlZcem5s9OgG0utAJ3qatsrkJFrxcvK1xxnyTI=;
 b=V3IEmjq8v6vlaB00MrS3B1B0LTS8gh0zwMaa02I8OM0jr2KWDg2kuXS9KbTnx+LsoMMe5cpgWy+ePKmdtmMCubrRAVCPFihQ6tow9zzq6y5uN566V3cZZxGTNNeKq8Fxr0jPtQBhirTB5C8grLh3TsIm3Y/4WeZ8xwALZAV6/T5FbZeMkkg7OnxeQWgrvNE1ksf+7J7xQqLMGc8ck5WezmdhhtxvPNx8cSIUQ8aTfJZ2IyAjE1/0yKmNUxVpekzKUOJGDCoLyo99WKFlnX818gUHVDa1TWdFnAd6b5aajde6812nlipKZjPJrGglhM05Xui/wFzc68Awxmf9gkhQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA4PR11MB9035.namprd11.prod.outlook.com (2603:10b6:208:55e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 17:50:49 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 17:50:49 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/50] drm/dp: Parse all DSC slice count caps for eDP 1.5
Date: Thu, 27 Nov 2025 19:49:34 +0200
Message-ID: <20251127175023.1522538-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251127175023.1522538-1-imre.deak@intel.com>
References: <20251127175023.1522538-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0255.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::20) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA4PR11MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: e13a40d1-d6d9-4293-f4ea-08de2ddd8022
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zbLPO0ktuh+gGV8FjIk4WGpQANiR+2T20NWJ11fjcPqTObDQue5eDgDkrj9u?=
 =?us-ascii?Q?ldEZwKu9683JzEaA9fqjB9D8hztYvEMwqTKnhudfIyvgZkvU/byx8pVuMMhT?=
 =?us-ascii?Q?hP7EO91LNYBvP1REsq6yossLNKUxF4wcCSS/CoWU9fGlwXHUWxhA8SMGe1j6?=
 =?us-ascii?Q?GpwCN0eQ87RRrfoc5VA1CLLpfDu2pey64EP4xzBQzMrsOLUYj8e/ahn46ql8?=
 =?us-ascii?Q?SOkgFVeSE80qEo4ENGtMK41RpzJiiSvOMmzBYya/6pTTG1ElE3kWquq1aC7N?=
 =?us-ascii?Q?mjYL25EfN0NWxmYBTNyKtSzbvlQLQzUTLfFv5zHx9Lem5Ugg+n9gXodDwQFB?=
 =?us-ascii?Q?I+cL80yN1Eh2M/+/2eUYNGbmV4vCS6gKDEfPaTK2TwRB35cjmzxxddJ41D3b?=
 =?us-ascii?Q?krEJNhlffUMePQEN7Mjvn6I8oeJ98LEXFxXj49ZKaVhe2+NQNzBeeMKnfZ8I?=
 =?us-ascii?Q?fS/3ebZyOIlT4L72JhgemLYrQa/jULc62YdyYOM/Q1hbNguZyIGseLoxIiSX?=
 =?us-ascii?Q?jCk/MvpMyV4e25Mhygeyxy9SPxFn45gxFVfk5/nTrFQqHmnzxO4SYVTzoDo1?=
 =?us-ascii?Q?/g/v2FVMWSWf25Fm5R1zQmQ3n6+KOG0LM8BAEqx9JEdcS/oAwB3dHODqiwDS?=
 =?us-ascii?Q?o88CyyvgZD3C8z1mOvAx7U/KqdJRXuQt67krNtJe/smnzBNhZ4zKyFJRbUBT?=
 =?us-ascii?Q?JC9Rao94R6SGwWbFeHDH4s5q2dtxTUhvhhNue2TyKh1orN51tih5lC/BqmXf?=
 =?us-ascii?Q?9tfjaDuUYlPdhKG3eQh5yQc9woZopCqvsW+zDqupurv48r7z1zxs45C/SYl+?=
 =?us-ascii?Q?gchGiHvkORqdw6G5Nu0ZOAqMviW0NvB8HJRCK1XIA3b89g8aKGVhOalVRd5F?=
 =?us-ascii?Q?yMDEnoiVAaiIwzpHTabawRslmSj2tJgCLYkhgKU4dWp8dAWEgjP2JjdwPdj/?=
 =?us-ascii?Q?BxMF4UD9/wQ4jMDHWFCAIuzG81IjrGA5GZ3LOyi/DWzG8vUy8Dwo+Gz6cmjW?=
 =?us-ascii?Q?uC5YHsDhIWNNGS0SjXukvFrTWvqT7Fa7UVl4dT4VYa/Poa6smGrZFpXePaF4?=
 =?us-ascii?Q?AETwQXzPcT7pCo4kfzP9/gY9IWeeTVoblCXXxvbym+m5Gc4oHkjqGOmoEfD6?=
 =?us-ascii?Q?59pXPXNqm8azXk3Ttd5ANr3vhvjiu/XWPo0HT854QETK3cA3YW2XoLG86HIL?=
 =?us-ascii?Q?4Wx2AO4uwAAcVELo1etTLpne5fQCHGDV2UcX2rR5n5hKmCoyFSOnXI09ksny?=
 =?us-ascii?Q?AhBylRpwatcloAUVan+XHAxR7rzxnDuZMMnvqmvJFtXt/6UKg52dF0MlCnMa?=
 =?us-ascii?Q?eg+CkTUH2DfSkc3WnqrI9rMx6jwrFEqOGThbOVHR4WeYnuZ3K9Xxr2EzQvEv?=
 =?us-ascii?Q?yUxMkU41f9aqRpl3oAzxHI86vYk5/hcacMjasFQdBP1aPtMxcXwNN+YKAi91?=
 =?us-ascii?Q?YqP4x/5aXu9rmLMx13PaYZ0JPdICRBGd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IA6YtLXxgKDhzhGpfOXoIAIo7oDto6Z0Xmf8xtbCPV1yJqVeD48cjSqB3ugT?=
 =?us-ascii?Q?BDzHOM1Q6mjl/HPqmAgqLKHXnEpMMiMf0IW0jl7aNTXTRwQp50CCJo4lf9Wr?=
 =?us-ascii?Q?f0g2Bx+rzaOcTFx+C8RJlsyMwwR/Xa9oPaHzygrV0CUhpRDZMjOtD7xb+jWI?=
 =?us-ascii?Q?Tb2gGQSqnwr3RW0LJt0/LXu7htrpEVSYe+zCc4zraCUJVdwwBj9Qo0D+s0w5?=
 =?us-ascii?Q?1j9BUp3WXbX+iTFp+49KoGLSe2+Ujvp8VVHiin2VFagO6Bn7tdwCj+Chg0V4?=
 =?us-ascii?Q?7zZSpK2KdhAq/6Zm3w6OsMnreL9HNjM4OyaRe5FF4SxdXZD1+l/1leQ8tQvV?=
 =?us-ascii?Q?6pjtG+UegKWWxJZ+poGJOgOEPnYufzAAbWj1GuIuraXFZLUEjD8SVEiD9L+8?=
 =?us-ascii?Q?dwR5/4wMmJI1RcJGR8stCTy3x5DAsROOQ91XC09EQPqa007/BOqQU3jtY9NS?=
 =?us-ascii?Q?RhTW34Gdx3a/EeQ5t1tysf+Aa46XX53i0oT+wUWHqKbyEO41VCtJBU+GsHAQ?=
 =?us-ascii?Q?aqv9yQT803YBXjD0z1P/kCx2/mE/6rSISa9OO04DYW2Z8H9luJ7AETjPRezX?=
 =?us-ascii?Q?ox7W6EYECgkinLFzq/81LWQ9TjRqBiWsWO7XAGKCFBlGdR5BTc+RZ/Rek4cg?=
 =?us-ascii?Q?+JXVkREtoo1JWVN4J+z9Pl/cBLDrPVARhoD8QCf2NIvezelHrivFaj1codd7?=
 =?us-ascii?Q?loJEtHFLHtW5x8xydDQMc3LjmtE+eiJ7oavsEC4x/LhOKRaBHPhw3TGEZ4QF?=
 =?us-ascii?Q?Wbkb9MOl1oX+KjJhPxZaN+Q3lZIRCiP9OozLEF7OdHqQSpq75LkIc9J+/ipG?=
 =?us-ascii?Q?7/KPXy++mRH4eL0APOTZJfGgygKJCb1K6id44oFMRlRH8xAshUDGvKx5HYuH?=
 =?us-ascii?Q?+H1vk9itBk8Ux/oA9si/Vwx1B9ytpg5splWFx4dJ8QKTYd7pAX9DMildvD69?=
 =?us-ascii?Q?lMcdR0O8gG6/U1DbmfR4LjqkGgGXUATYh7vuN+FglVNipeueM0aFn8wt0M3k?=
 =?us-ascii?Q?z/pRsWedw3OaPl3WdAd9lCcPrHfKaJWcoCe0ECFEkxL1IkWCm5JwyI9ke7va?=
 =?us-ascii?Q?vTcQRwjCQ3IX0e7PswC6WsdDUx0jlAxpl8i7pY3DbDrX8uAEpv5SXWV3qtQM?=
 =?us-ascii?Q?X+PiFQEtnkhhglH1VUnV6tIAUZRU1YXoTwSMs2qGWNG3pM0YdsG9gO/HU+v1?=
 =?us-ascii?Q?ktboCDmLMWn+00iggSRG51qPGShNVFTHaCcehkh1S/1SY0nsRC3fmFxpgOjO?=
 =?us-ascii?Q?BAk55qkGMPJ1l/2K71L30I5MZoLCG1+2Lu4UUwV/eFG15bHTYa/IXZ9mQK4O?=
 =?us-ascii?Q?0cMQGxMNs9zH3EOKIYvRZNSlhOfKYsBbZRAj/j4ehTgy2487G/AbJYWG773v?=
 =?us-ascii?Q?lX1ZVEOM6IZP9/IwUpXMfPytVjN+GvJwtGO/v7kpem80iVUZMNu/bcYRqvD5?=
 =?us-ascii?Q?O5RyrKQqFRgu2y2KcvGQ77Z3AY8YWvq5OIFk4aZ01aLiaheYEXIlIndOl4MI?=
 =?us-ascii?Q?XwrKm27ert0gGdJJsBMpcpNvHlZQSbw+qHXxqir4X9Ig3BRrsk3lQfRlKkhq?=
 =?us-ascii?Q?U0dLMnUadbzxoXssWupN7nFKF7IB2tQryJKqWdr3K/TK37nN68s58iDBiJf5?=
 =?us-ascii?Q?UJLuK48amHN14NYIfBan6AcPsGndBoCOaslK0upVn5pY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e13a40d1-d6d9-4293-f4ea-08de2ddd8022
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 17:50:49.6112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/L2mTzfV2TTAE8BC9u2nwB1gqL6c6fX7L+Jr1l1YET8a8O1mR0+WRiSIYk/yxCaq7H0aRt9G/Q03z6PVYAf8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9035
X-OriginatorOrg: intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

eDP 1.5 supports all the slice counts reported via DP_DSC_SLICE_CAP_1,
so adjust drm_dp_dsc_sink_max_slice_count() accordingly.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 41 +++++++++++--------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f9fdf19de74a9..19564c1afba6c 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2725,15 +2725,7 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 {
 	u8 slice_cap1 = dsc_dpcd[DP_DSC_SLICE_CAP_1 - DP_DSC_SUPPORT];
 
-	if (is_edp) {
-		/* For eDP, register DSC_SLICE_CAPABILITIES_1 gives slice count */
-		if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
-			return 4;
-		if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
-			return 2;
-		if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
-			return 1;
-	} else {
+	if (!is_edp) {
 		/* For DP, use values from DSC_SLICE_CAP_1 and DSC_SLICE_CAP2 */
 		u8 slice_cap2 = dsc_dpcd[DP_DSC_SLICE_CAP_2 - DP_DSC_SUPPORT];
 
@@ -2743,22 +2735,25 @@ u8 drm_dp_dsc_sink_max_slice_count(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
 			return 20;
 		if (slice_cap2 & DP_DSC_16_PER_DP_DSC_SINK)
 			return 16;
-		if (slice_cap1 & DP_DSC_12_PER_DP_DSC_SINK)
-			return 12;
-		if (slice_cap1 & DP_DSC_10_PER_DP_DSC_SINK)
-			return 10;
-		if (slice_cap1 & DP_DSC_8_PER_DP_DSC_SINK)
-			return 8;
-		if (slice_cap1 & DP_DSC_6_PER_DP_DSC_SINK)
-			return 6;
-		if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
-			return 4;
-		if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
-			return 2;
-		if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
-			return 1;
 	}
 
+	/* DP, eDP v1.5+ */
+	if (slice_cap1 & DP_DSC_12_PER_DP_DSC_SINK)
+		return 12;
+	if (slice_cap1 & DP_DSC_10_PER_DP_DSC_SINK)
+		return 10;
+	if (slice_cap1 & DP_DSC_8_PER_DP_DSC_SINK)
+		return 8;
+	if (slice_cap1 & DP_DSC_6_PER_DP_DSC_SINK)
+		return 6;
+	/* DP, eDP v1.4+ */
+	if (slice_cap1 & DP_DSC_4_PER_DP_DSC_SINK)
+		return 4;
+	if (slice_cap1 & DP_DSC_2_PER_DP_DSC_SINK)
+		return 2;
+	if (slice_cap1 & DP_DSC_1_PER_DP_DSC_SINK)
+		return 1;
+
 	return 0;
 }
 EXPORT_SYMBOL(drm_dp_dsc_sink_max_slice_count);
-- 
2.49.1

