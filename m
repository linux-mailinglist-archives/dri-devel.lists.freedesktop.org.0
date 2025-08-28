Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF97B3A8B9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 19:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AE110EA67;
	Thu, 28 Aug 2025 17:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwvApB+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A3C10EA78;
 Thu, 28 Aug 2025 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756403406; x=1787939406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=O8NJwGY5TmlPP3Fwv5BnrJT0OymoUD4Zhj1Mu05YCEg=;
 b=WwvApB+jow+EhJsNGnv9WyU0Vm1ee2hrc8Il07k/97ZaHY+As0+cTOKB
 8Jp2AnJenbpOb5tOiWWBZCypffYavfPjQD/s4MwhDSCeW7sbVNRtRLlsf
 /04Fq9R+lN7mbUxMFPICVaI6cKvVvQva4pGSaFk6tibQPP6zL37Aat0Ha
 zXdfI0TDJ5LmakNYWnUXZ2rWIFq2YFg53zGZYDW1VhTzXuitWhpbXwLov
 5vAd8WP7Vzph85yJEWNGAs2hAuQB0e/dw87gmAm9MdwOfzVtekIPRDY5K
 RI9nxmnvvKH8xh5o2wuxXBOXNRnd9Ds1QCJOLnrN+2qW8SnDjDG0eKpNh g==;
X-CSE-ConnectionGUID: bRomowm7TxOPQh9ex7+Vlg==
X-CSE-MsgGUID: MUJCqJ5OQDu/JaRvKn6lEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="68959883"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="68959883"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:50:05 -0700
X-CSE-ConnectionGUID: EfhsxR92QMamtVvot1DhSw==
X-CSE-MsgGUID: K1Y58AteQFmpWMzdOIM3SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="169696106"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:50:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:50:04 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 10:50:04 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.76) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:50:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOtt0mi95pMJVWFynadgrsqbjr1oDBDlydxxXVI8C8sy8N8gAzQjJ6uqKM8j7L+TNlisk1OKPzUbD18fz7DP6JRXPbkq9i+5HKHsGT0JlqEDUkbB0ZMI4d0DB/kBWCfJyJDqxvtZcUJPMxsCvifz97YjD9+KB8XFlPaQXtyju5XX5VnVaJeJ0zskG5sszkImm999gW7WRwyVOLdgvNWiOa32eFfJr4GuW5yx27ZoD1h6dHSQm1qvGFbCg+nhYyAn8xL48Zdico3sF8ftb8pU722Vf9KOG+SzaNNZVtmCardgSXRogqug7CwlryVHSF4oBrB097T3oShkO/A+JGcrLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9T7D6ePyCiBAzCGRjKGQZiv3K/oIlQOmq/FI9ysQfK0=;
 b=v+ZnFBlzYzkfalbP+aydS7tK8GVKd6thfZ4IjWHCGoY/zMDiB/IxMIV6Daij5xYK6blgErD93EVFw4GVvddHjEK+9DCyTHQYOd9VQX/ruSFyaD7DRyKqcFLL1lF8zIzvGqwk6+STm84TirGEIQrFgYy023dg+Bq/4BIqAotgQNM0v0fQeMu5aA2WbLm1Q33NlS2d+KLriEwS+SuH7Qoya61TFz82tgxcgic9QRiXGs8U7Smy7uVgFEx5ieZJp/3sRMvugBB3Fi5p+n9IfhPctvqLW7mK4xS5Qfiea6uUWuAj7q2RXFCV8an8xDPmuF+ZBm6nZS0bLzHGQJ2MCMxN4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Thu, 28 Aug
 2025 17:49:50 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9052.023; Thu, 28 Aug 2025
 17:49:50 +0000
From: Imre Deak <imre.deak@intel.com>
To: <stable@vger.kernel.org>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.16.y] Revert "drm/dp: Change AUX DPCD probe address from
 DPCD_REV to LANE0_1_STATUS"
Date: Thu, 28 Aug 2025 20:49:32 +0300
Message-ID: <20250828174932.414566-7-imre.deak@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: cb374911-24f6-47d9-59b4-08dde65b4938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dKK9WN3ANG6uUrE+jVMMHq74yvXg9ruCFj+XaDhQ3afLiedLYTVFTWNAZrek?=
 =?us-ascii?Q?ssRgiiaWDnW7y+TXhkN31A/DZF1/PMlXfwkdY1lYeT8I8yjtW93plxLCRNGD?=
 =?us-ascii?Q?bISTb88W7w5WHpZ4ert0t3Xe0eMmctXN98xLQx39/hzoDPdnGpP+53fRwfGV?=
 =?us-ascii?Q?/IyKu1XA/hqEI8LDDP4kGWOxQhMknBxdea++PPo2cswuD3SQm7CJjH4/3454?=
 =?us-ascii?Q?6OMKIJUZ7bWxT/cUqa0auBVQC9jliARKOFb8M+ZHmJkfK9V/xCBoo9jd0JKm?=
 =?us-ascii?Q?izc9mkHhZQ+qek3pW90wiUTExTf00tLQr+otTtYG3RMVV10F8BG3YjWv7fxc?=
 =?us-ascii?Q?1EZvH4njwlfY/7SafUNouezT3txVaVQfCNZN/nS8kRwrHZxpIE2WN3d3xbS+?=
 =?us-ascii?Q?YgLuQBXjXgoEm4kxdTUG+SoQ8SOM/W8ZTkP8UEyg/xmAEReEvHSGJegtdidv?=
 =?us-ascii?Q?a4xALVkkLmAFolUi0sfbxwPffN1Y5vgx2qn4k1zhKfZHHhDrz+qfvZcBsOp9?=
 =?us-ascii?Q?OCXdqkoHSQhMuKzfR7jQW1iB5j26lBxTWYhu8uFSNG6xDC/vC3GpJ5sGXUmQ?=
 =?us-ascii?Q?VEAmMGY6LUoseNUSyXGMraD8ChG+ZiVj59G5lOw6QsbwH87EgN2QAJMjrAAS?=
 =?us-ascii?Q?onRkW15KBAXC4fdtMPVYe2EsjndpdWFsNEt01QYgLsvbn5DQ+nNgLrwPL0/T?=
 =?us-ascii?Q?YmvH1/Has5nkQ+asgFm2GWLDhsFeZfJ+5xT3OXzyAmCglMmencVKlt1yZoeG?=
 =?us-ascii?Q?cbzEH3ErgqrES6EtaGU6TLw+6cNGvCvoWYxsStvGlTVr6R/cOEe+2YnNSveN?=
 =?us-ascii?Q?qmBJdxSb+XMHO5LPEM/Scz7oAXCRtDtnKyYyFm4gBjtAzDyhqyD6MrTcg/aD?=
 =?us-ascii?Q?2yQl9PKXQ5I8xz3LJ3LV2mmjGid2UqqaXO8fZAXNNRtlMOug5oWJkNSYxwfp?=
 =?us-ascii?Q?bFCzBYEUA55M5Xan0PbsEpJOeX83UafUq8BQIVirMPbHZTuHROwEdMiIbKIu?=
 =?us-ascii?Q?kXZH0YRjYdmXNyUZE1WAPHpfPZWltXikdUYN3zEsevgOgkjx/9KdFGW7prZW?=
 =?us-ascii?Q?pKFhSVFskOJJRUXjZaRoHLCyQ3MKjShnx1pybePPJ6qlOxHbUkPB1a3EkjYO?=
 =?us-ascii?Q?8LkPdycuCXcMn72dphsO5Ud/y2Pk5dlXLl4EOPPT3o5fMWQgXhftTrjzRlOW?=
 =?us-ascii?Q?u7fMOfJlqQu0/xYO2nscMfUNWklGk6PSkAhBNV/5k5ds6h/Xd+XllwwEPIkD?=
 =?us-ascii?Q?TwKSfUIhrnTz6qKMMm8/uM6ZD/AOYUwB8HSMS7YbdmIdl4cysxkto1V50W1y?=
 =?us-ascii?Q?nRO1Lu9DmoHVxUdWDLVbEW2RBkzkZW9KX1yM6jaJq6XXgS+XFj18HXU4GX9j?=
 =?us-ascii?Q?EbhKk5Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XZgo0Tk6FVyFMqddoMoCbQMGv7qw64/92xG4ADJmLAAs2ER/m/UONPopzL/D?=
 =?us-ascii?Q?L+Ah7BorAOuDYZktE6f1Pc4kMIVxcvRpzaYAyMFB99/5favk6ghBED2TBjRH?=
 =?us-ascii?Q?iKgWeVk1uOGLMZ8qaYQcbzFrAtaTX++WaBYnGoGWYrNRb/GAjfzvi2pKkaGZ?=
 =?us-ascii?Q?Whz4/kHeJ0P0xtMh+FYClKWVaBZX3YYel0hcNoKBifgil6AM/ZZ63ibV1YwU?=
 =?us-ascii?Q?o5BxSbTY5gaoQia6rSeSY2l0KGVkUNbcrkyjxTLSCqgep5MNUZ7N5CWoU6R4?=
 =?us-ascii?Q?KDCxC3BRA+S0A5ZlunjHt48m4ZJTB4hqsP4DqQgOlujmubN2yP46Ck/4KlaK?=
 =?us-ascii?Q?iZ+s/IXkftKStOKxlXWyUbH8v4BX2WPCdQazFNDnSmwoO9+rD9V68nVa4vXE?=
 =?us-ascii?Q?YQDNX/YgvO6U74u5b6epbybcwpbpfyXFO84dtEHjd5ddrByyYWRrnwSCyTsG?=
 =?us-ascii?Q?1N776z0FXo9fn87S27Tcy2Bi73/YkahIyOhLPuorW8Z1LqIBIiR8Rs2C8Rm9?=
 =?us-ascii?Q?5QKbrYWFeRv5u9rn1fOnhEZDWZhyhHHDVuPi0P7+L27qD+9sOtLYAZ7bRF84?=
 =?us-ascii?Q?DG4wejzE+UtxO8mxDhF2Hneps1K+b9NjELYPlzig7HFi4ON1L4kcdpkgDgrh?=
 =?us-ascii?Q?f7PB5Rh433zbZGHiBHOm5ahnQiXSxpYckFcnYcKAMlfSj9YGAB9prWgTZEp8?=
 =?us-ascii?Q?JgwFS6R3GeVKzoVqz6JQQZC3CcaNb+VUusI7RO7FQWDC8yj0ub4aL2Y05qPn?=
 =?us-ascii?Q?u31iXYRvS087x1FxqON0wKV3TT91GNLpCfc4iLIVMbsZqtY7At2rb3RmdUC/?=
 =?us-ascii?Q?1pSjmSwA2HYDcvAqzG1ZxBJKUUM4fwKeWxOdgLlwsZim6JJaWLrXNeU4f7bk?=
 =?us-ascii?Q?Y96IKGEmQV789V4RhzZ8hca3CXimt8KXOkoyqHukOOCwCSpmt3r+GlnvTsV8?=
 =?us-ascii?Q?EWz1Nyr7bFe2UMX6jdMLBdqfcnAB6Bg8F3sOHiw9t3sFC8yAbAt7FGPMa/Kb?=
 =?us-ascii?Q?/fKyVMxJnMSivt8CrXmUAeklVOjPFVD2QGSE2u0YK+3m31pH14ZQG9IQqzKk?=
 =?us-ascii?Q?kuXfI4F7HSKLtUP+XJ4aGtnimxBKhh2ItyEWWlT7m7W/XZLiYU/GftQIuDaw?=
 =?us-ascii?Q?0oTdwOtAWoE7//GcxHrozUKxqI3LQbsCWYXAN9EgnAQb+AcPj2/t9xoSRHZa?=
 =?us-ascii?Q?wfAtl2D7ZHC8gzRXrWaBWr4X3VGslr/AYR5mqGApd8EnCQqudC1X3mnq4Zzb?=
 =?us-ascii?Q?yjXUxi8BBFrrN+oOsMOtQjCQC4UnL4zfgOHaGghpduIsCsqz01C0Xb68mOt2?=
 =?us-ascii?Q?eEwSh5vmtw4qnNPxilHw+s5O/TGCBrwj6JvWtq3hNfE5zpP+2BJ/zSMXEPjp?=
 =?us-ascii?Q?lI4J3mK5CZ9LRePa2Mb4U67og35/H8Ywf3jWVjj6bO/7R9keJd7ASTnw6KwR?=
 =?us-ascii?Q?kbO+1pIJpBILlfHl4O+Gamtf2SetstqjjjMqwE8r2PiMqq4mczZaCd5cusa3?=
 =?us-ascii?Q?m3vRqoo6IMU/Vd2nfZBpKDtnNjk78NzcT+JK1FfDVlUb5+rz42F54kdESzot?=
 =?us-ascii?Q?BTNC92SIZ2JKiNu/rLH0z9vDYlzonwYcKSMbrVlhtmJkefLqBdh3jfAsgJYj?=
 =?us-ascii?Q?dP6GSzeb8iQdFRVX9/SsgNPZGTVP/tIirIVJ2iNs1cXy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cb374911-24f6-47d9-59b4-08dde65b4938
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:49:50.2842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zhtBIaDqUzGiJSOsH5cQuVhOSdeSVyrPIbbcEL/hIuhSToL5cxwBnPxnjg3ayyFB3HEUCpoBjpLUH/BJfuRnA==
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

This reverts commit 944e732be9c3a33e64e9fb0f5451a37fc252ddfc.

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
index dc622c78db9d..ea78c6c8ca7a 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -725,7 +725,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_probe(aux, DP_LANE0_1_STATUS);
+		ret = drm_dp_dpcd_probe(aux, DP_TRAINING_PATTERN_SET);
 		if (ret < 0)
 			return ret;
 	}
-- 
2.49.1

