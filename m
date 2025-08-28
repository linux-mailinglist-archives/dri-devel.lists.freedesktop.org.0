Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A00B3A8B1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 19:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6234F10EA6F;
	Thu, 28 Aug 2025 17:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1G6I/kz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C80A10EA6D;
 Thu, 28 Aug 2025 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756403399; x=1787939399;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/P+d/c3eFg1kHIhBrdOK2/PPZtzzu2AkWzm8u0qmx0o=;
 b=M1G6I/kzoeoJ8UNlAnG2dF2ESxQKPuCABhtplEdbgouOFbzEpYUH5iZn
 7KQ8BoxVnlKeHuUDhRueweMDPp0WKmiuWksVl/ePwBbSNOVaBFcUUWsPH
 j3D8+CaNNq/22rlVUBg8FU/6WrCWCwjUdyApd6ue23aMvkNK8giIEcFpt
 7cPPLxJVTiVCx/Lxl1O9hGZN+laIBqcLt3IMW5B4zNzJwjWWgsEYRykx+
 qZEj5TMUZsE/FlnFEtzlWUtBQyKYkNM5/RElDhiKYcuOE3vO0F+IUVSQW
 nfM9x04ikI/hjHQeYsw5PXDPzJvSGhpLtm0fU8setC4akcjytXbI5f1TA w==;
X-CSE-ConnectionGUID: WmbQY4CDRN+TL/hxSE9Xaw==
X-CSE-MsgGUID: 7VoMaYMJRsmUxMRP9KpKOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61318934"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="61318934"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:49:58 -0700
X-CSE-ConnectionGUID: EZVECuq8SeOaDD3TGo/a7w==
X-CSE-MsgGUID: 0RkT4mjZQkmscKRZoODOLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="174520137"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:49:55 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:49:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 10:49:54 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.57)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:49:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXhW6BsM+QR4pYi/Z3Tsp8/ie+AP+hf9Xn627Gv93/9zMq3Pk02rDWEFiZgzo45FetfnzPM8AmFQTxY/4QK2fIElgbnhQtZZoFOAN8H9HYz5VKxDwqzUgFGmMwa8ygYo1ilPmQed5swMNYq7qumVQTXYyRwE8gcnHaeB43abJxkoUPZIGMVXMG99Yd7S/jbOhb5+5EEbGsObhj1h2ZoLHYxT7iBwmZzPWX6miPBvJ2qdZLWpmCr8GFwusghFKCwjC/0ZBwpsE09KwQOpMGUl3EigYWhWF2juqsbB8rZhkmns7A7f3B/5QYKeErr8gCozooRG+13zeJ2LH18U9+fusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM3gn3WXDaGZvRMe8Uf+YxMGNfaGc4pFGM00XxvukYg=;
 b=KuwloGy8Cj01n2/ha94YGluY5UZuwrgjoy0uSaFMOj1je4bBaffDBGtAjPaEQj8XngeFwSPPsHaGQsoPuhvbbXMPuHYqWNe8OCF65LikbrArwxFvMAzUsQAfCda4mI3n54yPhOcMbZ1zA/inHe89m0XfVRQtXkhW/I7YTE4oBUcfTy2BzUNDndUPvKMDQgMw2+2vMeJMzFPuGdMCFORpUkAX6TkJ1QHE+s+K2J/dFBFzKucK9/peRR0cXqexz18oAj2FjjxZAv4knAJJTne+QyPWV4EjFm09FpngdPRp19jMn+8UE0uHj6rjUz9cIEkEWBt8oEY11d/H7hmlO7o8uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Thu, 28 Aug
 2025 17:49:47 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9052.023; Thu, 28 Aug 2025
 17:49:47 +0000
From: Imre Deak <imre.deak@intel.com>
To: <stable@vger.kernel.org>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6.y] Revert "drm/dp: Change AUX DPCD probe address from
 DPCD_REV to LANE0_1_STATUS"
Date: Thu, 28 Aug 2025 20:49:30 +0300
Message-ID: <20250828174932.414566-5-imre.deak@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: bea2fc4f-f2ee-4a01-6726-08dde65b474c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZUnfj30SvlZhVHApEzMfYqj833D3DI9xZ9Wro1xJbPa1hvnHXtEY43If9jSx?=
 =?us-ascii?Q?54UfB0k0ZtyweTKFBZkxYWCy5ZsvAVcSjJ8MOOMsPiqX2252cUzDUIfh2itH?=
 =?us-ascii?Q?OAdC6YMqKFmMYImZQmNxgpEUwEcjorBIeDUAEezGJXNZDvYfKnQ7chJkct1W?=
 =?us-ascii?Q?tQ3V8ZLDnsBNr0rVMlN82gM6PtNf/TVlXE++9rZf/l1ihD7W2Z4rO6AaPEyK?=
 =?us-ascii?Q?c3AGkCDRN2uDQCeyIJ0SwnKCO5JyJNIvZCV56z67dp9ts9cLveMlkV46I0Sc?=
 =?us-ascii?Q?CwMd21xNBqeyfhtT6mF69g8z4F639wbYHFVEULjgVfr7IEm+0TaY8EO8PsaC?=
 =?us-ascii?Q?z4LjQxtIOBxzO7th5XlfCgGQfotrVGD5LvV/KH2zV3weTr4yvsjf/62Ke4sL?=
 =?us-ascii?Q?4gCqaK/h3gIN+1NaX6CsD2r1LpKshwbFLWpdg/w21su2O9xddd+kPGAqeYkz?=
 =?us-ascii?Q?iHDJq7D9LdXeXXgMgex+on2IIciVUbMVKISgy03CXRCdiR6wgkd+Kn1lQs7J?=
 =?us-ascii?Q?VVkKHFuGNfayOTRIzYDIVnhJiJgyhMeX9/BbRTfU8AE6y3KEJJ/KOn/LsHuq?=
 =?us-ascii?Q?eGxJYt1NFRSX0kLJkqrmome3Ii23RSZW2qMudHEUNeBoWi8KgJTFup+xsqRd?=
 =?us-ascii?Q?3G6TE/AuJLsTBmjdldeSc32IohAm97rq4zslMrWUaj1EJcKY9LlAgVR9cs5f?=
 =?us-ascii?Q?sWn5S3ro9uwznzT7hGPQ4HDaiv8Z95/n4U10PissM5AlMpLQTtidip8mzp3i?=
 =?us-ascii?Q?iUhbiwNYXHQ8mY0vKyy375zyh8yLsj2pwIXGVCghgIp02oPAGN8BDhI+DkYf?=
 =?us-ascii?Q?jFS2A3UxlzSyYjxuG3eUbVSRUodoUEpBwR8SFzycLkgz+pThxyKd+yLu92b6?=
 =?us-ascii?Q?L1TLEdoNUxBOloQvph9loXNVmeLzt9hT9CvMZO43zUclJ4n0I7sgW8Fm+54p?=
 =?us-ascii?Q?YIMWfRqmKehAzeqYpRk4+sVvpgWP1aXy/QPE94IH4nYO3fabkqZD+369VGc5?=
 =?us-ascii?Q?gH4noYliIhI6tqiSjJovNggrSfQQbQqj0iQpTfgXe7zarWjAYYzAG7IKS/nR?=
 =?us-ascii?Q?kFnWbpkZAUo1Ta3czbIWLa6WpLg3u4/xagYcRa8FX/77F1kvBaM5a96NZyte?=
 =?us-ascii?Q?ySPTein1Rey/q8WD00g2yXF3pTJy1HSeB8Bh03Lhw0q9nlMawZCsZ5u3jEGc?=
 =?us-ascii?Q?iu3TT0/E80x8YXDnoPU+hbb0lbjAmxLvs7nyASY0SZVgaeAKcyXtHUMnMyAE?=
 =?us-ascii?Q?idA1b6j2KV4O6Q3SdVTed1Ga17z676Jc3xp/xwJ4qlBQGhec7eymkNAbT46E?=
 =?us-ascii?Q?K1Q0MjYngtH7oZuCGfRl5n4HlOQw1A0cSOY7IQCgG3dQOGumZ77ptAyIBkws?=
 =?us-ascii?Q?Bw1VeTA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c7H+QcO9cwHU2Uer+eG5NH6xqkyMiihnEFnx7Eb18JM6c4X6k8uF0nf1cziq?=
 =?us-ascii?Q?0ufbRt/vKCWk7LBZl3HbeSA5V+zY1ZSTQWnc+uXWkoJfZ+k7lpvF7LLsXGNO?=
 =?us-ascii?Q?GIjQYt8B0oAqZG1GL8NSDOgnabAvKqcgVPNrWWozfiTrjsmB9K3R6x2yAA5H?=
 =?us-ascii?Q?IVvE0NrKuUXxiGdd7Ze2SNLqCYnVqLqMVIKsm9MAofRvSMLS9CBUXwMu93vD?=
 =?us-ascii?Q?7TSF7nk66E2QfCqCCmole8ncrLBXcJnhh2nNjHxJmXXABhIM/9DL8c4XUyVy?=
 =?us-ascii?Q?rW8NsniubVJLoOMWAhS65lqIWLFBrb/8YRlA+0E4XV6KFN7vhNKM/II7kP+l?=
 =?us-ascii?Q?EVezrgK7NQ7KcKMXypIgq9ACzaN+xe7HvFdo4JhNOPTuOEtUTtcOQ0pd/6FJ?=
 =?us-ascii?Q?b++XYjf9Yy2drxuMoFhIKl6VWE1hIHAsK0Lq3tRBQ2pkwEwyWYOOX4jO1fAJ?=
 =?us-ascii?Q?5gqAQVJy9zZ7gY3mk8YivTdOXfT7jPm0XrVdT4h2I2u9l7eSAmsxdZxpSDfC?=
 =?us-ascii?Q?386q1zeWfi0Up6O+Uz3L25VHSe0gaSBqn0F1117117yg1GEXrm42QmgwajY1?=
 =?us-ascii?Q?UgKI+wS5zP0PzbBeh3cFT9x4MFFCj1+1KonnjwJHeRqWbX+OhUofMMF9pWoH?=
 =?us-ascii?Q?Fp251cKL0t7Zil4AkZqhOpry60b01RRu1aRU0RXETJO74SE9KiNatOLXlybT?=
 =?us-ascii?Q?7f4YgiJexpG4KZzrcgAfqLY1HNIe58P4yLwQrmPEg+IDNLmkEGVT5AB3A3PK?=
 =?us-ascii?Q?blNh3Ftl630Un7/hyQ67KA2deaGFhIzQlirlSiYCVcP9hRZIVVpU7CHt2h1Y?=
 =?us-ascii?Q?H/kGg/VceEYdzGP6IsH60Pi5IQg8U1jq24qwgAt55VHdaLaXdVVJzkE8jCHr?=
 =?us-ascii?Q?zHr6mLiZhRVIHxp4xCH+s7jhOuUfKU8WAYT+cWoe6jZegSungkvcYlJU95Iz?=
 =?us-ascii?Q?x3igFsaxoQld9KpvffZfDdEgesz2alOUzJmfxcYyi9opQgC9TeFQfdZrSEvN?=
 =?us-ascii?Q?5+UoR4DGBvkUIL37aqz/ZdUuA84tQpleHg04Evf9LfsD0kIeeBMcn69+qpXl?=
 =?us-ascii?Q?L3Qi6g6njLc1e9ruyUpyfds0sNzi/jXnXeqCgs7xpLEJeb0z2cW3RvM+w663?=
 =?us-ascii?Q?njwq05Jy9PWhzqYOK8U8TUQtdQ20W2vk5ttJknlYq++FB50mT7dk/Qh/olNV?=
 =?us-ascii?Q?t7wWFYMP0ulzRi+xB0VpCte5fJjHQ1bDGqyVRB1mEn0fI+KCbBTo+CQJKlTf?=
 =?us-ascii?Q?LCLcvYBaAoS/K7Na1CtHy3LpVA9pCYrCdJGoWkV9JneH++w7tdg1uHktInoZ?=
 =?us-ascii?Q?VA+RlQ0+CAAVg+3aDS/X2jlL5wkxM9YqFNDTAFAwFE36QGTDQAl2Jl1SgJur?=
 =?us-ascii?Q?92ftRLFsH4MM94oKp2npj8obCCdLCrpG+Zvw8Leq6hSLsZkBBvMxQDTGSURM?=
 =?us-ascii?Q?RTMCOW5KYmFQU8ZY+kP/0PUoCF3ysZ7kNh4XWrJv+Xw23vtNkqhbetcE+cgW?=
 =?us-ascii?Q?kdnsttVh44L6k96T/Jtk941EsHe1FNcO0J4wWLLbb0yvboi9bSXau9uWqBnr?=
 =?us-ascii?Q?2EsoO+bqq1xzG2xnWekQVPK+Nvbok8NoCEoI3T4+MeqstMs9z5BSHo9hK7n2?=
 =?us-ascii?Q?Pm7wvRSsOrLOpVAKe1T+fyjtUaMv+CsTplQkp0DWZ+Rh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bea2fc4f-f2ee-4a01-6726-08dde65b474c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:49:47.1894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzvyivT0d9AvnrtV63DUDX+8hU9Wv3YwV1oP3ADiHSN1ji6DFPDwtj+bw3p1wNks5wviBRiy42dQXyMoLqHjmg==
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

This reverts commit 65e46aeaf84aa88539bcff6b8077e05fbd0700da.

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
index 772d8e662278..851f0baf9460 100644
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

