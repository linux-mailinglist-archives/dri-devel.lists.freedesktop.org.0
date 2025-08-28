Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2D9B3A8AE
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 19:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786D710EA6D;
	Thu, 28 Aug 2025 17:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STibA1JD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A6510EA6D;
 Thu, 28 Aug 2025 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756403399; x=1787939399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=nczNZGWq8t65vMFMNL4TuYiRhHH7wfOlYwnA7gHCGSg=;
 b=STibA1JDeHRnfzt9HevqDrjiRb7Tj1a9Q4sn7KMcEZxz4B36jxtpwTOV
 WMnJbLZjBbqCp8zPm7jDfmpQT3BwxyInPI0AtLyIik6CjzaQf92Smayvy
 vz89hD3wqS2/abNNZJ0nEzf2rJkKw30DqZw60OEdrNGMStr885sW/pUGn
 RpACO3Qba+EnQ0JUuHXCk6Jhf/iWQow5cNl8N9NK2dRxH6pxS4S2/Q51Q
 HFF8y4SRsr0TvWutoSao8yFEY4r6FWMd9VXlImhVC1Wl5PW9et2HDN2R5
 8BKZslhneBJVY8Wa2ilre4igtZRcke5GJ9KmtdqVthQJINqQLIAe52OAz A==;
X-CSE-ConnectionGUID: /ENEFFAgTiCA7Z5h/CpOrg==
X-CSE-MsgGUID: tUCxmLz6Req6DOCAYhXbXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61318939"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="61318939"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:49:58 -0700
X-CSE-ConnectionGUID: qfy0+BExS/iqCK+UKBsv/A==
X-CSE-MsgGUID: hZxYgdFfRcehSulBOuFavw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="174520135"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:49:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:49:52 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 10:49:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.77)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:49:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AkZo/ciirAMEQGRPgaCXY1Cdwz1W7ERgeH/YRq9EUQhO3qyU8gwd/iXv5Nl+tW8rysf1du2oymwDJakmxONuLpr8UR5kIMbkCma1+W67ck3P8ckMBphnCf45y/guz2oIYxaCbr6WY5+3jfx+Hc3TCBVI7ZNrdPxsw/cI8HDam4mbRg2deg2BuOUiAKKc378nUuWRDH8yPvXI8MceL8camUWxhwBzZN7jjnVRey9Ca+NR0zTWB6sTqx4UZ/xR3/yHx7DnnP1vXlgyBxu+rw5iV2pDzEsLJ2OdR+eLUX7LI1u92EXphWPPuMlTIyj2D7BcmcjGaTlknameEzRp3vROIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYBSRUR7bp9mwpWaRt/gqvwOMqdTyMr3K/jo6M7BDyw=;
 b=hQJ2B6NhKsISXaL7NEufVpzaE0J9xeUjpf/xv6w3LAGakseUhXTCr2uKcOiVletrC44Na1OXizY5V2GI49ttmr7nFmX3qzwmf8BnOjr41G2yvwUzjBlR9C45n8Njxby0qCbpYEc2nOLDL52TS6g5yRKMKDn9efaXE4Jb3UDh7ZXQk+4EiN8LsqGxrb3YWx21aw12We4v/HfgJ2B41HITCFK8yeTP2ysxQv9j4OU9FdlyyueQhvS8ztbBhSWd3v3mrnMAqXoGn1ftK2BUHoFOk0SZ920GZx58Qt0RimlqJ4BDnVB3nbIak7iTP3SWoQoSblyVWwa49tagERCO7nyEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Thu, 28 Aug
 2025 17:49:45 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9052.023; Thu, 28 Aug 2025
 17:49:45 +0000
From: Imre Deak <imre.deak@intel.com>
To: <stable@vger.kernel.org>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1.y] Revert "drm/dp: Change AUX DPCD probe address from
 DPCD_REV to LANE0_1_STATUS"
Date: Thu, 28 Aug 2025 20:49:29 +0300
Message-ID: <20250828174932.414566-4-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250828174932.414566-1-imre.deak@intel.com>
References: <20250828174932.414566-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0111.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::12) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: a1711464-2240-45d9-ed26-08dde65b4630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l2MLQDegIcEYzIgBx2wjxdlZCG/D4ohgWt0Bl/L47sFgDfoJ+8LapNpqUEXZ?=
 =?us-ascii?Q?vLO2qx5Dx/WEP2SiUcz1ttGqkjy+h3SRvEAm92p4rgUQR9RznYuW3bMbcOTQ?=
 =?us-ascii?Q?55m11LBhVVRGNzk2RnhLFwfegt5CFwS3dGJtZoIY/L0dGL3Sk7sqOG1YTGx9?=
 =?us-ascii?Q?6D1cW0ROtive5+/vFChWsY/i0EkTom2tGLb//b9yZNvy/qbr6spR4OKM1NlM?=
 =?us-ascii?Q?OSvm3QuZc6s4+7lP7thQ83r43DMZ/IYHYrLECyedUv16Ul9haQzDsYd3AvGw?=
 =?us-ascii?Q?4HoJu/6ECWYYVa2DDWqJBwoK1GouZaZnRqhaUqsaAHAlujSt07BhxgwCQmLP?=
 =?us-ascii?Q?Vq7Zd4V/lv/xz3sb15aph6RZVLMH7w/iQ+HFdqUHpJVCsiK+Ie2qG3VLA0qR?=
 =?us-ascii?Q?B7FY5Isgg+U4N447JHx/K0QCMfJ3jOmu0ndn4NTreDY5xwGgNUPGdpopswyq?=
 =?us-ascii?Q?xIkWZSZiHnUMlKWJ6MEnQXLmaaITLp4u4dongaNW7Wi2TseNn6D0tzjqAD2h?=
 =?us-ascii?Q?OAY6NP4o0Qxeq7QDrA9ZjFRIzxZ/J8cy4+iqTXgbABvaaLR0sPUMhKrjJCnq?=
 =?us-ascii?Q?rZSZpXszbhmvSeWYQ1iDBUXGhVPKjNwpDn2D7+V+jC7b/uAmktmofqIN+GKK?=
 =?us-ascii?Q?atMbSS1V/agyJEmwQyjJCSAm9IWGyG/1c9xakfV9mJnQsXbrZKyXhb2q+mxq?=
 =?us-ascii?Q?UsCQ0rcfewnQxLu6TnDVyRN4rk5UE/n8zv5KS+7gIfxkpocdahZZX0SmG6nN?=
 =?us-ascii?Q?zfwoAHRGYaOtEjIj610sT30NvskjDN2RnUouc9WXHjEn/H+vZ612AByGwaha?=
 =?us-ascii?Q?Fd9rqI9XMtUW6nKITtdW8PVfxn+ohxaUHA2KPVvsWTEJBnP/L3K6pF7FnrMD?=
 =?us-ascii?Q?ZPsZ9V9VF1DM76a/X+3kVyS1gex+Kn7pXDWdHGUa1jCfrcw99qnMmBJzjIRB?=
 =?us-ascii?Q?xtSWUg1ZoaFdKaOJg45nZ43opjjPObe6cnjfDHzWcwBLzPQzhvmmHiV8UAaA?=
 =?us-ascii?Q?55YN2awh0R7qhY3BGk9kk88ioilqMtEMysnbUzmIc/fOnK02irk29nZgv4mz?=
 =?us-ascii?Q?18AbmVVASJESz7matN5nHuBjMRnApFYyEHtb1OaJ75AZTMBoGssTlkZDgbmM?=
 =?us-ascii?Q?/NIX6jqQkRjSkN+HUFSZWNo/R0U+Cgz3QN//cZbOnjeHpUizg43BTmM4YaGz?=
 =?us-ascii?Q?gRVAgxx4kFrriU6Aww9JJLK5Fvb6hsrcelnNZCHuFc81poHiMBPwufta78Ju?=
 =?us-ascii?Q?SkcpycewCzUJogw4J1ZfvoktBbEqgY8v1tNDvrQoI3TKEUrwNg9+7DYPR98J?=
 =?us-ascii?Q?Ef/5pyoGSONI9DkYF4t+OulWTjZS2CWya4v8JlrItdnZvWr+uS23b+fe+7F1?=
 =?us-ascii?Q?mikNl+8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hHF+QEm1f2ouTmn3ANS0nJfCpy3r1/08pvN336H80mwmPojYw/I0/HWg5Shj?=
 =?us-ascii?Q?lzIhcN4dJVmt2MSgBHMFDc0zpsrNDuxCAtm8/0SHXpqDu1pReUxA+/laaxGl?=
 =?us-ascii?Q?xEZE+xF1VBFrGdZ9V22IzdlGNZTMakLXZjPvO8YQbI2DqM8wqOK8nTo8gS6V?=
 =?us-ascii?Q?z/isA77ZA8yYLtIkRFy3mhKNvpD+DQY0MPB+IaGYdARGvx4leMA5XJ5De/gX?=
 =?us-ascii?Q?qJu13MxpRGzA1vaJo3hSYREcVQDpIOJy9xFEvY+Gfj70pVj7K8yOMYzstRah?=
 =?us-ascii?Q?gHDG1Rwd9q6InWGKrJMz5bdaqtemUA5vio6kPc3m54j+etlfJ0ySbA6YuKGU?=
 =?us-ascii?Q?b32tbxVFgD0rdldx6N2tJyf/eE49C267+0CwsVdDWkzCXtOaOBWPpn6YzWWI?=
 =?us-ascii?Q?eU43aOaxih3l/HR2Z/fNj9l01fe2lbrpReWpmzarXOS63wzCa6t1W8OTWmRK?=
 =?us-ascii?Q?WNv1mgMdmLN4uBUc7/CkDjKQ5wFJwDhPMr+oMlHDEFfGAWOZN+va1MQcRPrp?=
 =?us-ascii?Q?YDqI7yi3oT91Psc2ZT7PoGNIfo83VdQOpXXSdjfTHRG1sZwFOSecpRZwAfBg?=
 =?us-ascii?Q?bxbNeCZI986KtJryI6sX2Z7P9cX0SPK3lBPcRLZNt5JsAwTomEM2n/YLUzuP?=
 =?us-ascii?Q?5qWmisosVgKs6snOkqXNs2tD+NSPIMkJcmizXogJxu2/AzqOUEprxY1NfHU5?=
 =?us-ascii?Q?6pIf4/0tI/3xigBu4YyyifWKOSk1xSoqC/g6/dnB7ro2wDGwZIyEztdn39dN?=
 =?us-ascii?Q?56a9Tk0KafIwLR2YzzcS5VU9315OeL+j1+IE2gkCSyZaIEdrcQ/XKsuxm/8/?=
 =?us-ascii?Q?d6hUdCzEBtDMuh8hM0ebq3Wu5LIGYWriXFzcqUwQAHcWJJdtGXgmc8W4mALv?=
 =?us-ascii?Q?i+o/6pQw2fMpeQS9FhX9QCkshniGgb0MwD0jRo5T82bBaEXgAiM4ki/2mW07?=
 =?us-ascii?Q?Df85b6lC8u0b1J6wYTdf7DhPbc+A7vykcd4W0JpnIpB7RtfjxyZDvY8naIS9?=
 =?us-ascii?Q?NUoIUmzVnoTKTwBbkQRW+ZFTs0xM5k4Fia7bFdLqD5yHk0Mw1wlJ7FNXSaTo?=
 =?us-ascii?Q?atOVxPivzCV+G9K8zJkOMuO2AD9IeudK2KnA/0Or90XD4mlWQFiZcuj0uUFd?=
 =?us-ascii?Q?Ny5OC5aFXBsVKHg/tJPYLfGV6l0hOXNTAikNyrTobGNX9DUOxPmDQVhvCxyi?=
 =?us-ascii?Q?J1pFJyVcSW7atD/8Nqf13DUh0meRgo4R62WyluVT755rtt4FLhy0Oerbprip?=
 =?us-ascii?Q?tF9M7KTo1M/fbfnYliApKSItOnI3jnk6WntahujbivKFMalgsqGlI14u9270?=
 =?us-ascii?Q?CL5FgwZieQgO4T5TvCCyybrxnsYT3kriUI0cP9HVei3quFMhvbr7+qjop7d/?=
 =?us-ascii?Q?3KLlk8Cq+aeJBcMoUaxj2j92nsgvZw5xHLqiAyttCZ4a9cj/6dw6dPVg7VGY?=
 =?us-ascii?Q?X2JcvffjlRKSYnZxWOjJk4OMUPTSWNZoalTsd2SmIwl/yBYjS7qQbcWE4sc8?=
 =?us-ascii?Q?E+TVApUs1ySnXj4DrjzMm+aip9TcWhg+SctEtKldDR8+BGieScK1td5VTiBF?=
 =?us-ascii?Q?Q1kNHQKD+ToS9G4SmuHBFPl3XJpTi6l14D20MaERq5WAB780KN4iA6JGQcVx?=
 =?us-ascii?Q?C/vRGfFWm2559pcfwGpZSVCM3sL0jvpD59VMEIo725ND?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1711464-2240-45d9-ed26-08dde65b4630
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:49:45.2971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /2Ox6UnBjuJXnCuLCMYn/smns39xdsX6vl3wyeiLehvWcrdhc948vO8OirveEBbu3YUg1+Uu6Cz70jUfMdfXWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
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

This reverts commit 4f546a77671076a0a49c08b4c6a7d0888d72f7d2.

The upstream commit a40c5d727b8111b5db424a1e43e14a1dcce1e77f ("drm/dp:
Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS") the
reverted commit backported causes a regression, on one eDP panel at
least resulting in display flickering, described in detail at the Link:
below. The issue fixed by the upstream commit will need a different
solution, revert the backport for now.

Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: Sasha Levin <sashal@kernel.org>
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index ecb30e17d50c..e839981c7b2f 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -663,7 +663,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
+		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.49.1

