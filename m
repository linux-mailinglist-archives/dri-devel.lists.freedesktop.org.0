Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF47BA8D30
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 12:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5ADF10E3E9;
	Mon, 29 Sep 2025 10:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZOEDPno";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F35310E151;
 Mon, 29 Sep 2025 10:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759140658; x=1790676658;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zr64vMi9KSOjAKuoShhFovJhL5zru0ER1ZQ3VqOiZ8w=;
 b=cZOEDPnoSlEwS6OfHLJJyjqEDxKpovG3qbd/C07IKwYqWHUiyKkyn+Lv
 4H6tFG8nkA8bJ6FAo1xLti85GBfsSVvoInJsMtAwnjv3zUAsfesBrfePI
 s06bH2+lAO5VMOTcObjGDDEtbF82vngPIlX8RhIGjDPdHJgkmYhtrnEUj
 vOGxWP2iP2uFS3VRMPP+uKqsfzQZAqNWvyjPqlXnbQ0CRa45S7A7T2e6O
 Gzx7NcNPmxsV/Cwh9CJrw723Skoigvpncc8Mp/Drj0OF46/D6G9qoEr4g
 RYhFDiOLCudmhKoMKEhq5JtYnxGMt9KDd+SjHwaa7/dv9IS+qVto4GbJQ w==;
X-CSE-ConnectionGUID: ckGxJ2beTGaEw17c0oVPEQ==
X-CSE-MsgGUID: DyVBbAEaSpyFjfmrt3cp2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="60590653"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="60590653"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:10:58 -0700
X-CSE-ConnectionGUID: Sxb29bDjRlKFpS39g+ysrA==
X-CSE-MsgGUID: qyAT263VQfG4PCAxTdLo7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="182613705"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 03:10:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:10:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 03:10:53 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 03:10:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSEAoKUmaFZURYr+ASzFMb3fKTxmh6rzPRPLyvfO3xdHaDl8eTW0w3TH+MkSztzMJA5sfGnnSqes8GTxfnNqA01ZtTezE2r+71FbL/A0MI5S6yDxY89i9gD61Rqk9QMW6YxsOJPCDdF+aF/mc9KHoeS60JUMxkbGzfmPLcTI9v/z5WkaaqbTX5er6xaXXOIeAASbGeh2OqKSqqZfX7vc1DrQNCv0BQPOY96M0suehue3wmabm+tMXf2t/nsFtlcS+lu5i53aLojZmdvmeWxYd1eoQjm0fAzkBij9Lp7Gf28Y8kEWVHXGCNUnTBjQ+N7YwZ/QBfuFeCTOnD1R3KBUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRI7oRZ4U8MC9btIjD+OXQFMtGcRCPr2HgGRvk1ErPI=;
 b=iij13pXYgHj/sma1AMm3Q978zEQwQ0hKnlsIVRorAGssnAdLRa15e0d+PclKlM9/Ed0ARHWcHwf0XRNcZJXcB0aXNTu8oX/w6L6WxEozn7yoBflrDBJ/8XycDFq/tKBp5tkwptestHjPHblBfjyuAKrti2RzV16MfcW/8N+kx6FGMmlpC/uuIdtDxwek7xwlKC4pHAm462wL7lilyFQDBpU3I5Dhr6a2A5HEEDEcxSW0Up8WldxO7YAjQLQZQUs1QrOVVHs7ytBcC6f9hRX0NwRGNe0UFw2JMOdFgOMpMB2TmFH021WILl4zkRA1p+FrCCKm3dL4SUNepqQMjA+flg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by BL3PR11MB6412.namprd11.prod.outlook.com (2603:10b6:208:3bb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 10:10:51 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 10:10:51 +0000
Date: Mon, 29 Sep 2025 13:10:17 +0300
From: Imre Deak <imre.deak@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <aNpbCWlluJfsjSE6@ideak-desk>
References: <20250926211236.474043-3-imre.deak@intel.com>
 <20250929063644.533890-1-imre.deak@intel.com>
 <agzmuyty22gxtm7cwpdl7ynmrubot45e65tfavbq5muamn6qnj@2wsbjqlc3pye>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agzmuyty22gxtm7cwpdl7ynmrubot45e65tfavbq5muamn6qnj@2wsbjqlc3pye>
X-ClientProxiedBy: LO2P265CA0245.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::17) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|BL3PR11MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eebd712-00fb-4327-0c18-08ddff4077d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tbfa7lp8QvMYrtVoxOEb4Crou1Kj+QxJLhOqTbQG+7yC15aegW8WM2Ng7U?=
 =?iso-8859-1?Q?BWwUy/gwGFfc58E4Py0kZeMPBEobowGPcAmawj7xnlchJamjXvqooIu7GD?=
 =?iso-8859-1?Q?fs3luSm8e9fTZN84xVi6Oew20hMzZHNRmYqRZwRSa78tPpJSPjiw7Xo5ZV?=
 =?iso-8859-1?Q?4PtLZzdx70b+J4r0FlLCU3+6VkU4NYeJx5DE86CB70u4DgntboIgDa6RRJ?=
 =?iso-8859-1?Q?GI+jQOzu1YiyVZpDI2tlHvuouh4xV59VCD1tBflWtfsx7PMC9u63aKnJ00?=
 =?iso-8859-1?Q?AIe6brDE9dsWJ7q8Hq606xECHrWhUaUIOEyC8mz8f31xeoGEk5iSzx4W+N?=
 =?iso-8859-1?Q?ABCyKJCN8tKdn5/9YGHWX5QuxYXVYWa2paLLu7fVwjrthokCd3YOGQO//D?=
 =?iso-8859-1?Q?LQ/VWch/cSj3Wq5VvbzON/YiXV9oWks5b8VckWoSntjoaS3VO1MtUaiDWe?=
 =?iso-8859-1?Q?PNMC014DGUGM+F5QAMHu+CcjQLOBHhMLBzDQcTuCbdhy4fcRXk+2V7d/W8?=
 =?iso-8859-1?Q?RM1CWDIPGcho8tNUZ1dOUm2yXCuYJ5CGroeBf/Tzip3tEpD+JCS+rs+LeI?=
 =?iso-8859-1?Q?jZVguiz9KqO5zknnaplYtTxQWONuRBpcQiN/eZynqsD1vUGwqxDTZf2xtf?=
 =?iso-8859-1?Q?yk4AiB6DFC5k0qAV6ooC/RFESWYbaDOpm0etu7VLSq9OOsn8YI7MZHkwhT?=
 =?iso-8859-1?Q?5mg1E5XoYBOxIRvYgOSUy/fQm+C+JJqy9xGXUfPJQH9kKlQHixfkAyHel5?=
 =?iso-8859-1?Q?K8YoxSgLJdUXQ76qS4FzIRoUbMTACxlQtfoS7u8y+H4nVo3DRIW4nQswB7?=
 =?iso-8859-1?Q?rbrlTI8VNYo/4BUD7DnMR+T9dbvjUgc0d/dC5zGH+4YfBTLdb/PvMpz1X6?=
 =?iso-8859-1?Q?qAMw5HnUBRIjciwpKCkIZ5uyEeMhVEj5zNFFpIiyAlljy/ewzJ2JgpEiZx?=
 =?iso-8859-1?Q?XhW0//0+nu9S2ti9IxnvLQupAUU52aKcTf6uL2PBHPGHgZoIbTTGz+IzqB?=
 =?iso-8859-1?Q?M+zrfrDFK72VTCaDG4C0wAoT5TlDpyVB6t7NlDfNssW0pAxX6fiWvfk2PC?=
 =?iso-8859-1?Q?cw/XSMDoT88B1g35L01O0ZfQvE36UD+LcQQaFY5cP5rRT2IKR1fahecVv2?=
 =?iso-8859-1?Q?TcvfAuOuYYho+qm+6Cf/f7Et/KwlZ2U+0Ws64BrPRoSFcKw8/Bj91l0uqE?=
 =?iso-8859-1?Q?rduc7IlkEY6+k+KSQvtEvPPEyrghWLrFRPYTFwPTzFf/IuE+fOreJZ5vqO?=
 =?iso-8859-1?Q?NNksUNHlDu9tcK5V+QN6b77qN1ikt++KgxWBP8enHqOPVJBog0CjncwhPs?=
 =?iso-8859-1?Q?rMe4Hy9I00IKc5o+GD68wb0VU+soV6Yl8oPZQMhDVo+U0wI041bsQ9DhHO?=
 =?iso-8859-1?Q?xTGA4UWHKyhgBDbAXrp3qjBubi5E+zudcZfQQ7/FVLy/EobhurvYPJvkJx?=
 =?iso-8859-1?Q?FW03AEVfTW3HpPYAWPOaUct4pneI/V0NfyARK1cNIZ5vuXnZ0MHi8QywTF?=
 =?iso-8859-1?Q?GLgKqS5YYjQ6seSpP44L2a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pN0zY/48cXSlLWBEly6EN8biQBI8gN8qu0FQWh1+MAgun3VRGlAXzIMQs5?=
 =?iso-8859-1?Q?MKyXYvLMq1oCR2/YTd6YsLYcEw+T4BqBGKbtZ+6Mt6wqjKafdRmPKg/mRl?=
 =?iso-8859-1?Q?KzcSoBP05Pqb2J00Be2/C5QLIXZhil3E6+ZmVGhm2sHgtCTrStahRnbk7O?=
 =?iso-8859-1?Q?EkAP7gUXmGMAsjK5bSi3RpFP0/FIhvousC4Md3ludOghnphHPMviDyONGx?=
 =?iso-8859-1?Q?feNAJjNXqTjx6hLNEgVUrxUrnyDL7sXlS54MPH/zXt1f46LR9A+1sdvlkO?=
 =?iso-8859-1?Q?Lc2AEOBHyCvfH988f5+I8UYghaCqnGMBW2hd6sLNpmx6KlUKq6nhcG1JHo?=
 =?iso-8859-1?Q?PjTCucIyv889WRwHMpsiQV6ExY0onJUesXRZSOpC8EvXGcs1GzuAPr3dcW?=
 =?iso-8859-1?Q?T/w52LYfKs1DtOj24GjKju/UcyIyEdcOE+fWUFmKQDJ0rw5bjpud1c84sR?=
 =?iso-8859-1?Q?GgtKcFyALiH2s/uBJHSvNWlkr7SbaIG3nRSYIPzLCpcHGVhDWv3S5o+eVg?=
 =?iso-8859-1?Q?8/m2yZPmIl7SdYwmAiwyPXNXEOKVGVU0TutMWbTuUPtQ3IhQAgfW3JPyA/?=
 =?iso-8859-1?Q?CJnOTx4Gmaw2H7AmJuCxfR8Ng1gSoPbqMD28GglQINWatPTmAHFUPBgGnq?=
 =?iso-8859-1?Q?ciluVce/wbe78f5UP5s3xSo/MDmICDIBySk6/82mFHJtOw5+mi9vd+1s2x?=
 =?iso-8859-1?Q?P51/xkF7MBNPkrcdZBGDQuUoZep7ADoCIv7o31D/gCjT7zMMkz9frWKDiK?=
 =?iso-8859-1?Q?E8elOk4Y5hFreVegqNk2kGw/wt71To0BM9mLF3wPgU/rPKUUNC4fEUeNyV?=
 =?iso-8859-1?Q?dpkHcCHO1snWlgHgxpplrszOt8tFercF/RBT83WpnfW82aFHRIkXJAs2wl?=
 =?iso-8859-1?Q?pWQEJTZg68MWflDGECDcHblBKVA67+14xMIM9y5WA2hFqgJnJbvCqrZ/hB?=
 =?iso-8859-1?Q?mHs1Cuy6Co8c/Gwhqw/OzJATlLGdIn9XKNPxQS1IfGG9ccGayQJLqsYu7k?=
 =?iso-8859-1?Q?t8jCZXO3mbxDJEt+G0AkYdiVxjuzywTNH4qWh3D9qOZtv7xRSo4QYO0Ih5?=
 =?iso-8859-1?Q?MX6rBX6ltA4nTql3jx+73UpF8C1D1nqPryRSpIXvtnLn9s6qFgXFVREzjn?=
 =?iso-8859-1?Q?hq/a3o/1JV2zT0+pcOT5OYaQ82YWH/qMx484SSINr7cvNuU+O5NwvfN7/u?=
 =?iso-8859-1?Q?usvplapLL+XTOXJdm941w33vQDFCQaC1uf1UnOflVMrVF4gI2XzE9LAFFy?=
 =?iso-8859-1?Q?sdvBFjUP3ACVFnL0uteBVb7Po8Ejs7V5wJpbDR03wwl3qQgdL0LRbEOKYP?=
 =?iso-8859-1?Q?CoLNra9vY2u0t8OF3Iu1VSFzq6qoIxAit7MPOpAbWgvfchC8Z2Tre0rKZE?=
 =?iso-8859-1?Q?czQaw0H7sza2BrGjtBpZLd7zgmWxb8mYVsoKByMH/424sOEXTD2MwAOdtp?=
 =?iso-8859-1?Q?4x4sLLaw47UzROCqqzzX0V1EQwJiC0gUhUs1Ye4JqXU0s9LE/I5saI6c6B?=
 =?iso-8859-1?Q?VgvIFF61EjpAX8ZzsKy1Lmtps8xN8dhl4XxxBD4aCKa2LLdwwAHFu0L8lh?=
 =?iso-8859-1?Q?4isxrGCIazeEzjiuYgd74J/9bCWiFCn5hPrkUgdDG+n/2qgByj5CfrIfdh?=
 =?iso-8859-1?Q?f1Ry9ewB2i0Zio9nqi6+yX11xVdollUfXf2pTQkE0gl0n107MZy2w3in/A?=
 =?iso-8859-1?Q?crw1W2WuPYzE17IDZL0nFoPTTU/0Ij5XryEm4I53?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eebd712-00fb-4327-0c18-08ddff4077d4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 10:10:51.1561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2L8FEbmvifnj4sXn3GN+/xBqhsG2vajlzhrCyBi6YN3HtVFznDQYUrCGu5pHyzMspSCAGbDP/W8RK0nR5aFY9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6412
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 29, 2025 at 12:00:03PM +0300, Dmitry Baryshkov wrote:
> On Mon, Sep 29, 2025 at 09:36:44AM +0300, Imre Deak wrote:
> > Add helpers to query the DP DSC sink device's per-slice throughput as
> > well as a DSC branch device's overall throughput and line-width
> > capabilities.
> > 
> > v2 (Ville):
> > - Rename pixel_clock to peak_pixel_rate, document what the value means
> >   in case of MST tiled displays.
> > - Fix name of drm_dp_dsc_branch_max_slice_throughput() to
> >   drm_dp_dsc_sink_max_slice_throughput().
> > v3:
> > - Fix the DSC branch device minimum valid line width value from 2560
> >   to 5120 pixels.
> > - Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
> >   name to peak_pixel_rate in header file.
> > - Add handling for throughput mode 0 granular delta, defined by DP
> >   Standard v2.1a.
> 
> This one got sent as a separate V5, without a proper changelog. What has
> changed?

This is v3 of the patch, the changes are listed under v3. The patchset's
version is v5.

> > Cc: dri-devel@lists.freedesktop.org
> > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 156 ++++++++++++++++++++++++
> >  include/drm/display/drm_dp.h            |   3 +
> >  include/drm/display/drm_dp_helper.h     |   5 +
> >  3 files changed, 164 insertions(+)
> > 
> 
> -- 
> With best wishes
> Dmitry
