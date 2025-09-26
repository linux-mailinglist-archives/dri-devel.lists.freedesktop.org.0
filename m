Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA80BA52D4
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 23:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290D010EAE5;
	Fri, 26 Sep 2025 21:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nh9Ra7dV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBD510E167;
 Fri, 26 Sep 2025 21:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758921199; x=1790457199;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aggC5aj1tNLp5CEAhi0E0+kEswR+nZdk4EYpDmZ7BfA=;
 b=Nh9Ra7dVFNMi0DCT4darim/Ur6Gf7eT7gFrHSlVHfLZ5doPu1aS0bTWj
 wSgZ1o05cwONPVCmvYVvqAfW4GJ0Kkoud5Wvqw1WT09TxRwLmAW3Q2cPN
 YUT2SxV2mDLcrTDjoaaqUiasfNzrNI+HPP2/uVC1BhRxMXfNfEKqnyAmB
 jD6j2Snm4DY2g/WKDsLx7UCx9yEY60dPeZ8OV5Y9g+qxUAkin76B5i+DI
 Io68UHgvQWgBkw8Cx3cTbXwG9uvX7trfP/YmYfHxU3Synb6cyIsNzAeuO
 pyCxj9ZIMcsWvxzJMRndgCcF4GsobOMUE+iBcd06qiJsx/vZqDnAJO3CN w==;
X-CSE-ConnectionGUID: Qq24T4LlQm6Y80x9e+02bQ==
X-CSE-MsgGUID: J58kkqvEShyt8MlDwBSPng==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61310394"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61310394"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 14:13:19 -0700
X-CSE-ConnectionGUID: Rq8r9YgnSby5UNPjDU6XRA==
X-CSE-MsgGUID: 0sBUxO6CR2aR3FEnpZk34Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; d="scan'208";a="177763705"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 14:13:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 14:13:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 14:13:17 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 14:13:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBbeGbG09+50ZMERS5d/CnwKAADIcKQBQQ9Etd5NOZ6z53g+eJBJy6DAkc8UqGE9Oqc9Q2k8F2Nc8ZrGlieCZ9u6APk05WC6qiIOclRxYXJhONPBQB4gAE3wBNusezuPy/k9+CKKCrqPpWbPuOgkyULxyPSfZ6h6yCJW24vokIwit+bb7aP/eVlEN05JwYM863UDBWEc/fnzvdTZTKMaJQqeEcnx7QxJzcKIBPLi5kXcClmiFR4Jfstj+5xgTylmN1BFBJ51pdDyWseWjSi8w61KYbqSM06ju0NHqx+5reUN9Tb+aBLGqlLcXpbGHu5cEuHxQFZlkLGotP4sOPAg2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6+f/eUqG3A6R47hq2VmtQZzEPAIxmFS+HY8K72FY8U=;
 b=URIJhIHbM5XBfXB9+F52LAWe7ZhkdzMhxVBAPT5BAaqGsQoY3IecUCv2a7LJ7B79qVelTQPKD3824DKZPSOM/kx5vcdE+ppBPtFCrPerSW1CF86TRk+MlKCOhfasOl7D3yduPvivbeYU/MH4Xkot/8bJxG3ABxpFliS43CchkvLZqWoxHo96tGSdf7lrRG7eoul6XLIAp9wtYb+M1GSFYJm9hetYW3jVumMj+2hrsYkgirAro69YPwJTmi+UJ6SdbGeRDWBrUglwZO1WEWIOGD94ge8bbvpskqf9eMaAES80ZV2LKlGDoD16hWweeSIesAhLqVzn0nLC6JHxgfn+7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH3PR11MB7392.namprd11.prod.outlook.com (2603:10b6:610:145::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 21:13:10 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 21:13:10 +0000
From: Imre Deak <imre.deak@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Vidya Srinivas
 <vidya.srinivas@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH v4 1/6] drm/dp: Add quirk for Synaptics DSC throughput
 link-bpp limit
Date: Sat, 27 Sep 2025 00:12:31 +0300
Message-ID: <20250926211236.474043-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250926211236.474043-1-imre.deak@intel.com>
References: <20250926211236.474043-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0119.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::6) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH3PR11MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b8ef5a1-bdac-4d1e-0a4b-08ddfd417f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D9/AsXmmYxsTqwJcrK6hrpOjFCr6laNlj03p0Xs2efhsedNwSUTadCp0pw+T?=
 =?us-ascii?Q?3KGIUcY8lKwGMGoU6NAf6/N7u33LxfqW90g017veAnGmt4Xb10px8cH5hasj?=
 =?us-ascii?Q?5a5bvQHLgZffIDJpsJGRLE6fGRRlqATs5qYuihpBRzAyTPEdCnQ5iRtSutbn?=
 =?us-ascii?Q?7l0MBeTm2J3tt+sm/xEent+iwla3ZtlEf/z411fjijzn+tMOkZPq8o6o5at6?=
 =?us-ascii?Q?tB5x+IxvRU1cekmVEP1XQ9TlPl52yHo40d1xswlAGH4OcS5rjjTVs/3vtaRb?=
 =?us-ascii?Q?lB6183vudbNPN3ySVOjMbduRwNLLunHIMMcfxM0gwQeUyLL6DBUOmNy+BH6X?=
 =?us-ascii?Q?kxjA4aqSArgtxwoYzh5kB3AHYvFFyNFtRnwTDh2Hy2bAUtYF2Uag8zJrX78M?=
 =?us-ascii?Q?Ljfp+GoXOvcCrxtIHeDRKh1oEIRcRcMWguTleRE/g1C3I2hcdzb+SNO1GPmg?=
 =?us-ascii?Q?8IfCLe0yq/IadzZkHqRvH6Hyee/mEZFGotHfAHMhNn2t8mmOqsQ6d+lC/1jh?=
 =?us-ascii?Q?4jcGwD2phBWTpPwIJIodg7sB8WpE5LI5M4R1bmscqJcU4p5Pz7DLNHhA0REL?=
 =?us-ascii?Q?GuIGcbQNG6lpqZFKMmpHaNbACfC0/c44r3qskXAlTRsDsHbf0fPT5lrxAZro?=
 =?us-ascii?Q?r5U+hoft9QSlj96UJg4RaKiSHAxS3xNScXdfm+U6qHWL4PJ5BR3V2LvhtFMZ?=
 =?us-ascii?Q?TeWAlTnTWlBbBXqn0WBUHPOrdO1YNv+MWd/g9LyiHlCkAaeADx74j520ZVaz?=
 =?us-ascii?Q?grkVvVOAT+PiyM4rFZtlc2etyOFPzpQCzvN5Pkfvs7ojFTFWKdPvYXadOZgb?=
 =?us-ascii?Q?Vy2rOdRNKke8YUVLEa/rzo7cnOHD+wsGFxvYITspbIi8GxBOUan8gNc0vX/d?=
 =?us-ascii?Q?VBaXCNKqRpC7BYXsWusKYMtO+U/f62oX18H8+s+Pp939NO+uagirkxSfM84R?=
 =?us-ascii?Q?OrPhORWoBiAbTPztNtzGaoPK/v1wp4y0oAaoyJzENZMMyreGbyNBtlkM8M12?=
 =?us-ascii?Q?ANPFl8H+wlmMVnUI6TUsEGCZ+4N23oAy7gr+UR2BcWyaaFoNyQoWtGBZ6p0M?=
 =?us-ascii?Q?RTg1WNRUhVml9BbjUd4Lh4Sfi2AXhuFH8xJhSjo7+y0aj9goZFbxXV9AjNrQ?=
 =?us-ascii?Q?OZwTmcdK/x0Mx1kibtfn4Y8Dr1pcJ3hYkANLqZuI1vsjPa390YxWLgRM9TQ7?=
 =?us-ascii?Q?7PU+eWs5n2lmO9fB++Mnev3c23Rm4MsUiMGZK+xba0Vs1zM6q0K7m7PaOMdW?=
 =?us-ascii?Q?eX0qcHSlW4AwCHb2lNweAdws3CfiwOylzoGl4+eq9h3+Vre5t8u1y74ogqDf?=
 =?us-ascii?Q?yYG0ZMwtg1KoPIa3CDcsbysct7X/ph3Ay2Kj6e5rNsKRtZswdN6qcCRcJLRg?=
 =?us-ascii?Q?SCfDQE2cto/sVVnQTg73ZNcWLF85H6PlYEzL3FIMwvHN69BMpGpG31ckopgN?=
 =?us-ascii?Q?IEkuVWmSaZegumshaCYamqI0aLqMf/1V?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DuDCejbFsh3bVT4RaakybUJJ2fOffJkMA3vM4wj6rrod+9guF/VwLiKGAF3y?=
 =?us-ascii?Q?VlELR4L+sChrnfmRUQ+wN8SMPyWP/GHldgvkmFJ93Lfs1vDaoH9oGE2Rfqcp?=
 =?us-ascii?Q?dULWESICUp1Jdhf1BDWLWNV7JwHAYPFRxYo9VtgwFaaowUH15Ww+iZbCnZzl?=
 =?us-ascii?Q?L/M4v+O7oT6QJ+ZqQNtuL+JKRcEqNvxG5ZXh9idtqSd/4b0VYIdnXbdVwbt4?=
 =?us-ascii?Q?yErgoi1GAPTDgT2vZkCvHMKjtgjOdn2gvpUW5BjgDaT9oQyCURdsVnnZSJhC?=
 =?us-ascii?Q?5RlLzQ9k6hBdzdnWkz6OnuVQwus+LmD0A7stBgQARdos81mg0fcrR+T5vfvP?=
 =?us-ascii?Q?+l9HaA1+1HsB1/9r2GMTOLlsoJpqGKTLaQg5Vv6fXmOGmVcteS2mJYOyJWl1?=
 =?us-ascii?Q?5Q5/8TC0IGsIOeTqZ0KrMZqhP6sMePOTYUG4m8FvGUmrdwUyfBvxie0UHtd3?=
 =?us-ascii?Q?QUj5ZP2Rx0QYZcMJ4Dx6aUMrUyNhqCVstcTJyftPRuiEmgP/XgNCaMyh5MCD?=
 =?us-ascii?Q?FVFST0mLEsaCPeq3aTFjmk6ic9R4eJpef5y2HNpYHOfHe8NjCFSqUUD+Aar6?=
 =?us-ascii?Q?fKNUVq9nAgSn9hnyRYoBxKykxRW3ukHjjDRaHW8F9mZu3TT8YgdEpDgr67pv?=
 =?us-ascii?Q?S6fIp9SBus7RfJQhNwAE106AMAIaJEPh+cIz4lNKnylR3JfNkXRJlYphbG5n?=
 =?us-ascii?Q?sR8cXc5q/ilt59dZkxm3SslasF411tjoz0yQj9rAp5o64Z34iOwAawNcv/9G?=
 =?us-ascii?Q?yzE5JrksdMrlORt3TtkUsDVBLbTKvkZqe4mSzRapv1HsrptO4y+TLJpJmUbe?=
 =?us-ascii?Q?xFECn6/gAaVbpFiIO0hkMmdhmN1vlRfOtJ4DwTRDZeIaGf90fwX/keSrTsqS?=
 =?us-ascii?Q?X58CHAXR5KiCzW0U+MemMwTeCTo13xB+J8Ckf5seQKnAeqlIN3DcF/8sWXKj?=
 =?us-ascii?Q?izl48CkXA6sujLXj4sQaPHFzmaWE2iWhmHpyl69ceHjX/s2WclqJirtlJzcG?=
 =?us-ascii?Q?Jsw8eC36SYMbz8tV2jr6qLcAPrVFXEF9VWQXjm/HZzq2adxrCoko/IO50pGy?=
 =?us-ascii?Q?RMvX35Dka60LqzLrMVUhPYA/eD2/evKLVYRu36xJHDYYBRuTqHFox89Ged3/?=
 =?us-ascii?Q?sNiTcCW9pCN7XNyNKUhAUiAp+D+VfZxIy6xuMIRVhHKsobVmXURuBassQdB4?=
 =?us-ascii?Q?dMcOs3yrF1kBZaNRjvgHXRRvXNbvds1QbFC8J69bChn1xsvVhpZpES6yZ9S3?=
 =?us-ascii?Q?MG5MeeSEpT7ocOjPLm77chwGTGaAO9GHhIpzt51GFVeI9vPLlj235gKF4nIX?=
 =?us-ascii?Q?kPIjfIplbayn07nZ2X/UDjg4Qfz6GhjPCOZ2zaJaXFtqlYa6Li4fOSwJFPdt?=
 =?us-ascii?Q?dWdW/3oBQm3tVHtR5NDvMfj9N0PU2h024OB1n9GTgZSUAYT/VbZNUoJA1pow?=
 =?us-ascii?Q?8tWSRZRpvdstpNIy/YEcS6NNclCQR25HA2OS3n1ZDHCzZZyDq3grI7eo6xoZ?=
 =?us-ascii?Q?s+ea8yFXYA3y068eohqSNYcOgYPHIBUury+MfM4uCU6uIKV9fYgy9a5AETsd?=
 =?us-ascii?Q?7ia8sqcZbZ8C2UwevdDkdT/EMevYG3h4UiIv0m2risUZjeT11F0o+okWQ0BR?=
 =?us-ascii?Q?FsJplGp/j1zqHz903U22LmGn9rzxcyA65qTlFi+Mqql1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8ef5a1-bdac-4d1e-0a4b-08ddfd417f15
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 21:13:10.6154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/yiRghM3VqNB9lgyrJdRX6wlertTi+lqxh4FFHVwiE1fS5bCj0K/fw2vi7YVw7P0cW7oW9oe5uXzPH0/VWPdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7392
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

Some Synaptics MST branch devices have a problem decompressing a stream
with a compressed link-bpp higher than 12, if the pixel clock is higher
than ~50 % of the maximum throughput capability reported by the branch
device. The screen remains blank, or for some - mostly black content -
gets enabled, but may stil have jitter artifacts.

At least the following docking stations are affected, based on testing
both with any Intel devices or the UCD-500 reference device as a source:

- DELL WD19DCS, DELL WD19TB3, DELL WD22TB4
- ThinkPad 40AN
- HP G2

At least the following docking stations are free from this problem,
based on tests with a source/sink/mode etc. configuration matching the
test cases used above:

- DELL Dual Charge HD22Q, DELL WD25TB5
- ThinkPad 40B0
- Anker 565

All the affected devices have an older version of the Synaptics MST
branch device (Panamera), whereas all the non-affected docking stations
have a newer branch device (at least Synaptics Panamera with a higher HW
revision number and Synaptics Cayenne models). Add the required quirk
entries accordingly. The quirk will be handled by the i915/xe drivers in
a follow-up change.

The latest firmware version of the Synaptics branch device for all the
affected devices tested above is 5.7 (as reported at DPCD address
0x50a/0x50b). For the DELL devices this corresponds to the latest
01.00.14.01.A03 firmware package version of the docking station.

v2:
- Document the DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT enum.
- Describe the quirk in more detail in the dpcd_quirk_list.
v3:
- s/Panarema/Panamera in the commit log.

Cc: dri-devel@lists.freedesktop.org
Reported-by: Vidya Srinivas <vidya.srinivas@intel.com>
Reported-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 4 ++++
 include/drm/display/drm_dp_helper.h     | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 5426db21e53f7..1c74fe9459ad9 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2551,6 +2551,10 @@ static const struct dpcd_quirk dpcd_quirk_list[] = {
 	{ OUI(0x00, 0x0C, 0xE7), DEVICE_ID_ANY, false, BIT(DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC) },
 	/* Apple MacBookPro 2017 15 inch eDP Retina panel reports too low DP_MAX_LINK_RATE */
 	{ OUI(0x00, 0x10, 0xfa), DEVICE_ID(101, 68, 21, 101, 98, 97), false, BIT(DP_DPCD_QUIRK_CAN_DO_MAX_LINK_RATE_3_24_GBPS) },
+	/* Synaptics Panamera supports only a compressed bpp of 12 above 50% of its max DSC pixel throughput */
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x22), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x31), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
+	{ OUI(0x90, 0xCC, 0x24), DEVICE_ID('S', 'Y', 'N', 'A', 0x53, 0x33), true, BIT(DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT) },
 };
 
 #undef OUI
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 52ce280970151..e438c44409952 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -828,6 +828,15 @@ enum drm_dp_quirk {
 	 * requires enabling DSC.
 	 */
 	DP_DPCD_QUIRK_HBLANK_EXPANSION_REQUIRES_DSC,
+	/**
+	 * @DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT:
+	 *
+	 * The device doesn't support DSC decompression at the maximum DSC
+	 * pixel throughput and compressed bpp it indicates via its DPCD DSC
+	 * capabilities. The compressed bpp must be limited above a device
+	 * specific DSC pixel throughput.
+	 */
+	DP_DPCD_QUIRK_DSC_THROUGHPUT_BPP_LIMIT,
 };
 
 /**
-- 
2.49.1

