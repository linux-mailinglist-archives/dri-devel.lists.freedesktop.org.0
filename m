Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BCBB3A8AC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 19:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786BD10EA6B;
	Thu, 28 Aug 2025 17:50:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zlhj5Y3W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F6710EA67;
 Thu, 28 Aug 2025 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756403400; x=1787939400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=T+rm4WSRYjz207jerTWxfRxYrWUMgBhbpGHELw55kVg=;
 b=Zlhj5Y3W5jJpwA5b4tIfyMGuCP8RMBKROPRFse11SC3d5/+PmB0GXeCw
 XHoQlKu2UBnbtAigRy8HpCH+PHWzF5WNhnsOsiuKwcXr+Zi3Gjwc6B1Nk
 zylH33Is7iqqqdnxmbDEET5F1/5Ma6vOrWI1Rj7QRERF2C28A1VUUhsXz
 0Ncfk1FSxHDqLJGaCTZRdeeN2FOUXUmoXbZv/bNIivhvtTAeLbbES3BFV
 CnX93bhiP7Xrq9OoHa+OYxiXDmD617tsGmztRdOy9kAufDZVrqP43ax4g
 h+D2mq1rbAi5YSZznn8tB0g7//SHVUHWsA+LAd6UFOrp2YuHu7zeXReRy w==;
X-CSE-ConnectionGUID: xMHSOyWRTKG9qySZEYC2FQ==
X-CSE-MsgGUID: vFR6YrurQK2mvrjWz6MDkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="61318949"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="61318949"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:49:58 -0700
X-CSE-ConnectionGUID: k/jc1qeAS7qmGfuF22KKnA==
X-CSE-MsgGUID: 0zoK6JwcTRCIXhvXH8MaeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="174520150"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:49:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:49:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 10:49:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.87)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:49:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKRM9/HzLHe5GPjFccHkxJYWrK6x2GKBe9ryrP0ZQthT2Lg3W4Ci+suOje7yEXvNznv+IYlHNwjIbj4jIeunpZLi1DCzA5Lrk5mAvEukNoWDhDM0mMgBjb2TmWEhtnDusWlWCLZ+k3Vop/ER0cHsMd80tqMuJgZ5oQ6C8Yi2C0/KCuZVgAUa1qNsuOxmGToYPWBn26OM1r3LqMMFd+nuhHEj5pV3h3blMGLHXgfZXRd0qc2tVMgqN9pczDXp14tXY/tHwmEdgkYOI5CXbL5j0T+ktaz5LswfvCPaYZc2hGKwSwaM68igB4t5Q2mCLFjFOXd744XGlhygo7HPuJW5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NlNoUzJIajZC1X9FY5wLfEuVY0dEgkr+4aB5qYvSDBw=;
 b=FB5oxnq44Ty1S3/4sJRB1R5kOJC9YR/MdB3XFpzNWnR0Z20IpvdpKBdtoQcTd4oUX4WQ/LeZeSslH8Iyhe+BN/O0jcsmA5nXwZV+F41K1iRIWZOtRcvsEZp1/8JjQ9ETg/2iE0kM55Rz/fBW7RzL2Ekfwk6eKF4st8pdccRgnVoejWrf8ASW1WOKNqBfwA/6aL4VCk0H/eHHLUFlDnUlDsOWj9wXJw51Uyb55w2AHXl7SoDBsYr3lJnOF3XaAXYjGijEK0Cgl+lj4POOrzTkbmtW7oIWl+Zhbecucxy0n08Hm0VQhdz/a450QMdZGWqI/sb/QKnFhDWbrS9stmUq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Thu, 28 Aug
 2025 17:49:48 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9052.023; Thu, 28 Aug 2025
 17:49:48 +0000
From: Imre Deak <imre.deak@intel.com>
To: <stable@vger.kernel.org>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.12.y] Revert "drm/dp: Change AUX DPCD probe address from
 DPCD_REV to LANE0_1_STATUS"
Date: Thu, 28 Aug 2025 20:49:31 +0300
Message-ID: <20250828174932.414566-6-imre.deak@intel.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7e91d16b-0a90-4eb2-0186-08dde65b483e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n0HtaPbHeQEmwbsdyjw9oHIXQRu5rE8XmJ7DhWu4EjR5TP0IYIlvIBauqTX4?=
 =?us-ascii?Q?8oVJyM3i1DPqjRvUcgzkfx+ySURspJRm6JbqsXZjbcedfGKi7eUXQ0bpfLn2?=
 =?us-ascii?Q?WFByncw/v9jRMwGAs6UJDHlrw2aj/0TVnylOEFoHgAMR5l7kSHX6q/wuKs4+?=
 =?us-ascii?Q?81aZ01tiFHXUYtr86j5mTQlHMSV5xOal+8X1Ix9HbF2z6eSocLO/C6iWBjeW?=
 =?us-ascii?Q?XVgDubnJIQeNs1/JSF8GEJ/TlGUf8tiwYaB5UjUMuK21rersfVv/32S1K2gB?=
 =?us-ascii?Q?HTubMF8WyKQfZNMBF9ZYWwE2WoDaQEZcZtkk2/tfUWcRa1QQwDzJ+AnZrKcG?=
 =?us-ascii?Q?p3r0QhgU4eakWQye7o0KNHOWyfXhlQP9vi1l/MvttLAWrfWOl0puAl59XPhV?=
 =?us-ascii?Q?tt9DN2GaWAdxSwfDaAK5cyrzRy3U/fvPWN0ZpgqLCbc4wA6OYzLEdlq5XI8Q?=
 =?us-ascii?Q?XiMZvxQLLJmuLK5AdlkIvcY5KN/W/n3TJhxaNLxOSmdPu00MtSN1mC7R2Qfl?=
 =?us-ascii?Q?YDColDSieqiVsn4GG2w73a//RdBgu1KghRWwGre7Ew1sN3oX/8Po5KFOaLPI?=
 =?us-ascii?Q?chHay6tLX+daD5gv07PbblUdxDvTa5/ggrv7d9/bZKRQpeLiUmEaj6Nvxxak?=
 =?us-ascii?Q?rivWAd6FwQ8eu1kUQuu8J+4E4IDrkrmZ8f3JmLixiYjrXBPe9tk63yQlU2/3?=
 =?us-ascii?Q?/QqVTtipVQqAiVqmiYzTTl/3bRIEJSXbuQ6jdlEkaKo3P4qwCvKug0zZ7HxN?=
 =?us-ascii?Q?ToIC8n1dLj9YrWk7lugcVrwkERi2Cg7tn9YsEHefgRUF+lI2uDrQDL+GCxvu?=
 =?us-ascii?Q?5OdBYG0W30PbuWeNuiie2uUSMs8SJyYBiaLdrsxEqVnhAGsecyw+E89pFza9?=
 =?us-ascii?Q?aaXJHIjuA1ErspYmqW/PT02wYD0SacU58jTb3/9B33e9I26JtKQcl9Pb8/oH?=
 =?us-ascii?Q?Xcy4/G7M7QtmHCS7HOGlOeX1UskyrlggUzCjrEX3DXsaAjO5EFtBZqgorF5B?=
 =?us-ascii?Q?BmlAAjnUfpQQ1rY6910tfaf7SApQcrNNQpmKqOFGxf+aJtQku48KkF1mMhJ0?=
 =?us-ascii?Q?LaTlGcu1a87L6RrTUtSgPq1rjQ0JdNLGz3cKzEBFqrV2zEcTFfBbPlu0bpzy?=
 =?us-ascii?Q?UoIhX9rqvy1YUtNMfyvpA+Vd+MxAZBk+RKhSbZrw9x+7omLjXQuOa/LIEjbh?=
 =?us-ascii?Q?ty3SSNh92alxywwrvr4mh3/WiHrbbvgPiATOi9DMTG1EIQPYqBKshJbzV5qw?=
 =?us-ascii?Q?htQ4bx5LRhnT7k99ugFVYV2Zm3YvwvOs0OyPN1GpR1uw0wYWv4FfsEzkasuI?=
 =?us-ascii?Q?N8YeLJMUMJWnhgr0oHPOkQxFuSy8tHU2voLU7lrzjEDlISrZom6MfKfI5wUi?=
 =?us-ascii?Q?CyMpAOA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d8E5Cp9n+xnL/5ZwLU4iMDdTbG+A7UVRgUVEnBDk8WZ2MhyUje+lpQgPX+xg?=
 =?us-ascii?Q?aBe54wXLBnPtQX7//VtwAKrezehfCaFZRAEm+oH6YHtmFh+oXRlyTfOr6Ubr?=
 =?us-ascii?Q?6AsIkR/5GW3/kwNQcpUy4WFWddNStFihfJL3Vc7WAPKfcp5owsWQ1cyIPXVR?=
 =?us-ascii?Q?KhHfuaFwIi3y0xULClDTPYyVpWB/31SMjyuIS5hI/n1eiS+tbAM3xUuogf1s?=
 =?us-ascii?Q?Gr4BlLLBYRNbJLoW7iw5FVwkhA5vGxuuPlRP/JqV5vq0ccp4sy7t7/XFosS9?=
 =?us-ascii?Q?QN0vv9GUINRB9/Qvzc7thIg3GTKJb5bgUnwnH5X+1hQvs7rjGjz6QJEMpvE6?=
 =?us-ascii?Q?cVrKinIEd+kTmPeq+aoYidwFfEQi87XZaVqi3MVFufahMEWZqV4tpDJ3TLrY?=
 =?us-ascii?Q?CCSG3jSJwRy0rbeRuXYFfZVa/VotLs3nsYfho0dg0j2OE34CX4YwosBQDV//?=
 =?us-ascii?Q?dJi0uxZ//X8yQ2WIoCa57dpWKu6VgccHEwSdCL+/apggnRJxjQWoKHyUyBIn?=
 =?us-ascii?Q?o1KN/DHIp5w37W7OwsGOyVhTJIUzFonnhPXwbdj92eIQK4VDKZzLqULokbd+?=
 =?us-ascii?Q?qROP4JAUkcgFMx0snxbZZDfSltBN9sDdCmPTk1OtUESS2v/QperF6rOsy/P7?=
 =?us-ascii?Q?sna3Oy3T/FCyv/a1BBgYNwo83ruUyvmRMMWZWtSdBTopdNlsgfGohQKBMKs/?=
 =?us-ascii?Q?9U4NAiloncv9uP/3KEkj/PRgukT9yiJ8Mb/M7iRKwxr/PZNS+Oss9bo4WhHw?=
 =?us-ascii?Q?0CLLQJgOrURtmLfW3JRv3NaCeqlSqaUhCPKQ/LecT6pxqUbYW1wCNXwVzsAA?=
 =?us-ascii?Q?6NIvxcOFF4UPCmtgyXNK9qkZrGJ3f51YK0SRG8OEyYOMwXbSgwmFYCcSFlY8?=
 =?us-ascii?Q?6Gvf28+F5H13bSwIlh5JrpOYcw31LBeUs5X+Zr16f/rbElQhXodOWOxbhYKO?=
 =?us-ascii?Q?AE/2SNYwtmflERDM/LzVneBivR2KDpJfTH0FthiOicSR4BPQZ855WCioCGL3?=
 =?us-ascii?Q?OS5Eup/sC1Zvc/eFv/o78bFUQlmSZeinPacXBx3St27efvNXdMI2sWAn0gSN?=
 =?us-ascii?Q?R0v5tvEeQtHYxfDKuaX/obZcDfLMB5+RXUlJbtXzIw+yMoTGST/g/Y0vmmGY?=
 =?us-ascii?Q?jmsXjXGGDIDl/ZTeM7v3/52uzSGS7qjfxgMQfKmrbYFF5nT83K4hSNHewIGT?=
 =?us-ascii?Q?z+BexLYD0l9E3dDYCkqOAUeEX8NPrIsSyZh+KxCsTzpWcq8O+ToCBeRmhprm?=
 =?us-ascii?Q?OTH03GvYuXox/Mxi6K5cRvqdMKmRYWiXsEDGq5FA33gwxYbnx5hvgMUANoGg?=
 =?us-ascii?Q?cllLdsWx4ggn3NXAJRgVitBjCbbuo7gWU3gWavh/2c3bMJmqIDGRDCyK0crz?=
 =?us-ascii?Q?iyY+GHr+svicm4nvSqlR5r5kh2Ks5inJN3w0mZp3hiEVCrHkk2OVPcUc4CLv?=
 =?us-ascii?Q?9tiFoQT2S8c7pKtrmT14fb+bKBurYhDpE5e3mVaS9GyHs3NXslud0rQca/FA?=
 =?us-ascii?Q?urON/O7TwSkMoNMUe8RfQp2bo0WBpRzrF1h7Dp+h0iXqN+DHZHNAB8IFBQKN?=
 =?us-ascii?Q?0JYpf5JckNiqWIyOi1k/jZaUVErHEL0gyJeCK31ByvM0WR8759j4HeMMTRvS?=
 =?us-ascii?Q?/8xzrg5TKMhOoE6lb0CnF6lgCa5u5xxWYYEPOeCt6SrJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e91d16b-0a90-4eb2-0186-08dde65b483e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:49:48.7744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njIY34vdxfK6EXBBvjnKKj8Xv2RlQP68wi3KfcM65AS1Uco8sv+yjn1eUjBrpcTVmNGBSm47ufozoQRBWdtpag==
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

This reverts commit 3c778a98bee16b4c7ba364a0101ee3c399a95b85.

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
index bb61bbdcce5b..9fa13da513d2 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -664,7 +664,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
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

