Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768BAC8B7AA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 19:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB3810E6DB;
	Wed, 26 Nov 2025 18:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFh988Kx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E127010E677;
 Wed, 26 Nov 2025 18:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764183016; x=1795719016;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=U3gb35IbVMYRr+VgFSkrG2K/Cb4CFpXIwWkRlPOy+ac=;
 b=CFh988KxO6K8k3BRBJwa8iXv5VNpFwH99PF/R+jyQSg6tDyIXdJlmIFc
 PmHHTSFFVvACBUZr9TjjjLIV9iXSpULvn/NB64lhMgoM+6U0HMct46ps9
 JjcMvIKpoDq8QeCswaD7fGUUTGPRz+QN2ffMcfELQNm92yZKZocry3ZY0
 c8kbfWi2lLicS5Ivr8f4XjGa1rBp5Qa8kXUpd4HFCbHsI9M0/4lPTg4NB
 gx7EzD6P5iAaa/GF+LlyGqXYX68nL4DZH3yx+YPYM5vd1DoQUbhWh9StX
 kCtUwJZ/SU2hGW6mA7NnxjAMIwJNbeDFg1Bsva+UqyQEOSBh1+BqOq83T w==;
X-CSE-ConnectionGUID: RfkrkpYvQi2X+ER1veT6EA==
X-CSE-MsgGUID: I2/TDgA4QVKQMzFkY6hj7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76915948"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="76915948"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:50:16 -0800
X-CSE-ConnectionGUID: ynyV7BY0SzyerKw+7KKCtA==
X-CSE-MsgGUID: b4Ks0R3FQ6yOSTT7B+VTEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; d="scan'208";a="223725773"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 10:50:15 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 10:50:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 10:50:14 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 10:50:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhFJZpgBo1ELNPQ6K13sgC43vS8j2OJCiQAY64UMiMvmfMaa9BSlYWg6vbiyVWtkGlTRbzBMGlKYMi0/0jnCeHw75THa0dRUY3Eo/4hG8buGA+9ongYnohDMSneAU0pYej3D1PiUq4V0vXBdCvEBwlmfR5gpshMmRA42BRCwoIF2X8VH85DDdBwaD7UJX5TLoazBv+90EbNklEC3cb41YzqpAl7taYcM28sSnZZaC4bUNPaoO/FiYH5vBZASM0gbmtuU9X3SPqtlCVo976/arTK5tSPaUsjncZKzwdKhIA8rrVe53uj6hv4UUwSFD9um2EDTuiKUp2C473V5Svg9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+7VouzhyVyXnC2mZm606YWhOEZ6+EhtqJeN5H6oTQg=;
 b=YFExZSETRWXvQ1cKMS9pki1hDK5BGa+QP/lbtDYxR1VHICPKRT92xGZoeduVIU82bk085/XIvZUtpFxQR/bslD/JkT4zZQsYCDGVT8qEShJN3msoeU/G3MyQfAq8RdCTZdY7Ywa2TLkG+YWgKFoajx5ejO9ShzB9vFVLpuU8xUmFq4x9uraxgM5tTmgIFc/b8c7VMnWD6FdxX5vIFrudNYiiYW3u1ZNa0yi5dH/m23gu2bd6VFySnvAckPKilRQA310EP/azYsoIjwPEMN+NfS8PnvVRdDWzt8ITrlTUn/Tg5keht++/bVWOpZQtL2H28qVRhGpJuH9Ct89HfTPb6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS4PPFBA72E12AE.namprd11.prod.outlook.com (2603:10b6:f:fc02::48)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 18:50:13 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 18:50:12 +0000
Date: Wed, 26 Nov 2025 13:50:04 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Iddamsetty Aravind <aravind.iddamsetty@intel.com>, Tauro Riana
 <riana.tauro@intel.com>, Gupta Anshuman <anshuman.gupta@intel.com>
Subject: Re: [PATCH v3] tools/drm_ras: tool to communicate with DRM Netlink
 Subsystem
Message-ID: <aSdL3D8o3GnjOzSt@intel.com>
References: <20251121064851.537365-1-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251121064851.537365-1-ravi.kishore.koppuravuri@intel.com>
X-ClientProxiedBy: BYAPR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:a03:80::14) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS4PPFBA72E12AE:EE_
X-MS-Office365-Filtering-Correlation-Id: f347a688-10b5-44a1-c92d-08de2d1ca178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GTvysofXcA+2oynWHAvOCg1KW8WkpEaZTLiUnJm4j7vTbDUC67lzo11rns?=
 =?iso-8859-1?Q?qT8pOmDR+5BWt/xgkar+DvH6tGQeI1EdauLVAsDiYFumMrUb1Bd5eZxOjV?=
 =?iso-8859-1?Q?wiHAgE5hD5Y03EQjl2ccvw2O1C0rF6x21p+g4c0MqfsDanP/sQnfZTmpd1?=
 =?iso-8859-1?Q?WLsx/d0pffnDyW7sQA+bjG288jSpg+vhKL/UryFum4RDeyddbze8JNnnDc?=
 =?iso-8859-1?Q?hYEwbu/mHUh6ufoUsGSFho32i4x7I9ehMZCkLi04uQFdsXzNeNT5JG1FEN?=
 =?iso-8859-1?Q?3GoqAlHm40QTXB5nijdIT3YgMjL4KFvbFChDFL7+CGVAdeAj7XfTAkk3QM?=
 =?iso-8859-1?Q?IzeIj3c9I+JSSow2MB81XPoxp8XX23aO8eFxGH8vYfpzwIdU8JI4VbB2jF?=
 =?iso-8859-1?Q?9D3oiwHIr8i3Y88PF8mmcI7XtEJiWB05l9BOC7Y4CCaFe5EK3xrcwv/rzj?=
 =?iso-8859-1?Q?1v4jRsP+QdXpY87Lpm/2YSnDj4yVzps3g1t2tpEQQQ4MRoLNGF+UctccWl?=
 =?iso-8859-1?Q?2on4p/AKEGtdh3Oy4uJNZaQL3AmJsmzA//xj8y82PNe6KcC9YsEmEEvVPf?=
 =?iso-8859-1?Q?FATFiI8cCgRbma7K5mHLDkMcpZK82mwe7q2hW9oRNfMtPcn+V/GBKpK8sB?=
 =?iso-8859-1?Q?wf+n9tHwIWEYyMqgpoLhiskO+t1+YRUfmaDAMu0ZdkRAbnh3TIzXcOmvoA?=
 =?iso-8859-1?Q?5RE6nN9FMvliEiYQlt2dDYPNqA2zNpHAdytkbRLXWNln7CvvUTUy8FM0rj?=
 =?iso-8859-1?Q?ygMmD6HekIimPmlI8QiqgIHhBPrw8kDIw9ov30lPBSZvV4yBAHZeN7OzyH?=
 =?iso-8859-1?Q?0mc+UzrRDl3XVyjhG55xuokXAdxWLtmchcquj5eoJqnrxuSJ47u5wIVM1c?=
 =?iso-8859-1?Q?m8btPjquIcz4Aqzs/VZ5C6ULMbcOR6mKCYbMEaUvsjpA+zBjvQ8mmhU5QM?=
 =?iso-8859-1?Q?P4IGWVHQdpXi2cXk7O2vOC/J1MCfb6Gfka+dvklaGHEXFOZwajppvG2O/h?=
 =?iso-8859-1?Q?skJGfo8Lms6NWz0wUWCghmjHXRBL3qFE0VSkI1RR6Q7cSgDUa0/uTrELxt?=
 =?iso-8859-1?Q?/MFMDl/srZ2dB2OZFobw2+gKlr5d8SAXZzaaN31NXz5RQfs9BMBtMVzRFE?=
 =?iso-8859-1?Q?VoWuYFqt60Kk7l8czzVvZeLmLRg4tC/cFnDD9RlmkIjiyw+8RNlbOIsl/i?=
 =?iso-8859-1?Q?6/bOJyQnEClZBNUvxASQNOBKLtX1TtyI1/P4epG2G48GaBzPTh5IvXoNmZ?=
 =?iso-8859-1?Q?NFP2TEhhdVZklFeYbqIEn+I6e6lxnPQR6T3gNrNuRQUgeXxYMo+4hmvIGI?=
 =?iso-8859-1?Q?kJ+U6xTe5iUcZ3Fnn8y3S5bt2oq2ZNxQq7ceaZAPenAjfFKLIO1VHJUDfe?=
 =?iso-8859-1?Q?848JvU6aBeHRiOXadu8tVL0BHSTdJHDueLDVwPlxVn/67dcRQkdeTbFBjr?=
 =?iso-8859-1?Q?QTvgyyIAL/mHUKZluJlo5pk2ymHWGxI5iSJQyH0h9hH/NVTmHt7M9kgxC2?=
 =?iso-8859-1?Q?hKBSppkMFh05mSlt6sJoqK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QIw53vT5T1ygz2nZVqFkMSE0Ude4Z/48I0NYLs6c0E+xacR6q/8Fvyo4a7?=
 =?iso-8859-1?Q?nCrMciZKOcMmb+l4FwybNbIvdr7e8KRxSqDeMqvW8kneISSwe1wIAjVmhu?=
 =?iso-8859-1?Q?wehtM51MiWRqvuEsg/4cM1qjKkb05hf20cGE0Z0fKSr9nWs6iPAar/Df9o?=
 =?iso-8859-1?Q?iU1HsZuRznAnxblnLANmXgPpJzL/bgL4tjqIcekeOBdJD5xoSSmZvRFutb?=
 =?iso-8859-1?Q?1eHd1v98OPBEuSjd/MFYu6EJP75ZTWVhBMZLUn0A9dMtAKyASBBICUykqy?=
 =?iso-8859-1?Q?qkJmare7I4IIqqc+knhmDaC5FgU4sjOz6qVc0Oh4NOVuR62tFEdQp3hxEA?=
 =?iso-8859-1?Q?bv9SH7uLHNCCSJKI7dPX8zIQOmwjlX4Ym208qtrzHL4fW7yB+tiaPdR0XR?=
 =?iso-8859-1?Q?ew6TiMl5bd1Q6cI9T7QVdiO8i5m1fT/o8ywpKwQvg0zMKmrak0+KXZD6P6?=
 =?iso-8859-1?Q?zFBVVYO+xEU2xvQOfeeKujIyagVERLE6KMBmomA/LeIlMoyhmDW3olAGwu?=
 =?iso-8859-1?Q?PdYA9H3jpv8ektaAyXxlXgzgfnSerYGwzvv2Bbmi6UtlGN5Gm+jJgsljKi?=
 =?iso-8859-1?Q?IRCb/PIhEeptHszTFoD5ITRqKyssWiCNRW8Iksy6erNir54FaqdZkz8lht?=
 =?iso-8859-1?Q?wC94jvk5dHLHtNht/ggb7il2OUPzuMghKsjw/Z5m09auYsGmDKmpEp0mH3?=
 =?iso-8859-1?Q?qLSEjpCxjflrZVSEEowfLNrew4GCnH9UO8ykl/9KXUsDhpuiUE+44EgO3H?=
 =?iso-8859-1?Q?TiFbwoZuVaZ7+t+G2PFFJc3hi1dJe8zkjnb9eZXe4e+o7MiUIpm7LByAIr?=
 =?iso-8859-1?Q?b4GWg/OL1J2ZZOH7kqxEwSmXrCJQTggg8QU6D/61JWt2U8l/TNLxMxLSHc?=
 =?iso-8859-1?Q?ld6zM+kislOPWj2oyXw3Y+tEa6iId5IF7j1wOqxhBjrFzRvJuThJBtLKWf?=
 =?iso-8859-1?Q?kez7X7432Mtm+Tjx8eLRNB9AEKoIOQCqUP5v7ffZoE3wB3Ng7Haau4NOS3?=
 =?iso-8859-1?Q?b3sGItXKBiO7szWjSnqUctH44VKkxFKVXYqPCwuLrgjKI8ZaZttzIb7iH0?=
 =?iso-8859-1?Q?WHxxmjOyRnTnfHntFKT3s+aBgaldHRCIdIS2EutIxvj6kjT4TlT7jB64K1?=
 =?iso-8859-1?Q?gYUnOAno1axqEeyyx/zuM26mO+CZMwuRVYCq8adpxcZJkmVq+HzjS2cXaU?=
 =?iso-8859-1?Q?QQVKv3HUjgGeTCURB1MQfsJ0KrqYE9r7b+luCR94CrCTYrGrfqPqOKDWtd?=
 =?iso-8859-1?Q?YuQI3y2BgafA53mci713Q4GrCwBqaWN8BSWrG5LNpeU+klyBCfjH9+fbpu?=
 =?iso-8859-1?Q?E8OhLP1OnhPtI4/wXLdNeId/Sc8kDDUNsu/hNL5Onzy4TfIU43WmhZJ8c8?=
 =?iso-8859-1?Q?kAqZgdloY2HmszKl78Zgzjrvcgm/J2uqOBF5KbVHUzad7o0raVdgQmmlu2?=
 =?iso-8859-1?Q?UpM0v5PFPBchWLO/0VMwwHiXU0wTzN/Wjs/+p9nn/97SIXFLz7iSDtW1rH?=
 =?iso-8859-1?Q?Meg61O7hv4Lo3KbzZHPNlSwm4ZHMmYr1HEBxuKGYOkzMBgU7hydhzfcy38?=
 =?iso-8859-1?Q?pLgln+2++Hcm9ThsiApDgIb/BnkD7SfZISoQNiyAwk+3KtW0/EWbx45hz9?=
 =?iso-8859-1?Q?7oE84Ej4KTCt/653YFOApFwgas/Yg7jjhQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f347a688-10b5-44a1-c92d-08de2d1ca178
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 18:50:12.8469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZpMlXx96Oa+s7x7LkqNRCQ6KCR3/I7c2BcojqHxp0R0BCyShk3CnJZcKF9SEDCSmRUdFkkFNJkqfG1KdEgaDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBA72E12AE
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

On Fri, Nov 21, 2025 at 12:18:51PM +0530, Ravi Kishore Koppuravuri wrote:
> User space tool for querying GPU health monitoring RAS events via
> Generic Netlink Socket interface from Kernel's DRM Netlink Subsystem.
> Available Commands are
> 	- List Nodes
> 	- Get Error Counters
> 	- Query Error Counter
> 
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> Co-authored-by: Iddamsetty Aravind <aravind.iddamsetty@intel.com>
> Cc: Tauro Riana <riana.tauro@intel.com>
> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
> Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>
> 
> ---
> V2 -> V3:
> 	- Created handle_err() function to remove redundant code
> 	- Handled more error scenarios while passing command line arguments
> 	- Resolved formatting issues (Rodrigo)
> 
> V1 -> V2:
> 	- Removed device_id from the input parameters
> 	- Updated help() function
> 	- Incorporated error handling logic
> ---
> ---
>  include/drm-uapi/drm_ras.h |  79 +++++++

Please sync up with Riana and make this work with her updated series.
But ensuring you have both error id and error string coming from the uapi
header.

Thanks,
Rodrigo.

>  meson.build                |   5 +-
>  tools/drm_ras.c            | 425 +++++++++++++++++++++++++++++++++++++
>  tools/meson.build          |   5 +
>  4 files changed, 513 insertions(+), 1 deletion(-)
>  create mode 100644 include/drm-uapi/drm_ras.h
>  create mode 100644 tools/drm_ras.c
> 
> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
> new file mode 100644
> index 000000000..af893aa36
> --- /dev/null
> +++ b/include/drm-uapi/drm_ras.h
> @@ -0,0 +1,79 @@
> +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> +/* Do not edit directly, auto-generated from: */
> +/*	Documentation/netlink/specs/drm_ras.yaml */
> +/* YNL-GEN uapi header */
> +
> +#ifndef _LINUX_DRM_RAS_H
> +#define _LINUX_DRM_RAS_H
> +
> +#define DRM_RAS_GENL_NAME "drm-ras"
> +#define DRM_RAS_FAMILY_VERSION	1
> +
> +/*
> + * Type of the node. Currently, only error-counter nodes are supported, which
> + * expose reliability counters for a hardware/software component.
> + */
> +enum drm_ras_node_type {
> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
> +};
> +
> +enum {
> +	/* Unique identifier for the node*/
> +	DRM_RAS_NODE_ATTR_NODE_ID = 1,
> +
> +	/* Device name chosen by the driver at the time of registration */
> +	DRM_RAS_NODE_ATTR_DEVICE_NAME,
> +
> +	/* Node name chosen by the driver at registration to identify RAS node inside the device */
> +	DRM_RAS_NODE_ATTR_NODE_NAME,
> +
> +	/* Type of the node, identifying its function */
> +	DRM_RAS_NODE_ATTR_NODE_TYPE,
> +
> +	__DRM_RAS_NODE_ATTR_MAX,
> +	DRM_RAS_NODE_ATTR_MAX = (__DRM_RAS_NODE_ATTR_MAX - 1)
> +};
> +
> +enum {
> +	/* Node ID targeted by this error counter operation */
> +	DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID = 1,
> +
> +	/* Unique identifier for a specific error counter within an node */
> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID,
> +
> +	/* Name of the requested error counter */
> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME,
> +
> +	/* Current value of the requested error counter */
> +	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE,
> +
> +	__DRM_RAS_ERROR_COUNTER_ATTR_MAX,
> +	DRM_RAS_ERROR_COUNTER_ATTR_MAX = (__DRM_RAS_ERROR_COUNTER_ATTR_MAX - 1)
> +};
> +
> +enum drm_genl_error_cmds {
> +	/**
> +	 * @DRM_RAS_CMD_LIST_NODES: Command to Retrieve the full list of currently registered
> +	 * DRM RAS nodes.Each node includes its dynamically assigned ID, name, and type.
> +	 * Obtain the Node IDs by calling this command and use it in the subsequent operations
> +	 * on the nodes.
> +	 */
> +	DRM_RAS_CMD_LIST_NODES = 1,
> +
> +	/**
> +	 * @DRM_RAS_CMD_GET_ERROR_COUNTERS: Retrieve the full list of error counters for a given
> +	 * node. The response include id, name, and current value of each counter.
> +	 */
> +	DRM_RAS_CMD_GET_ERROR_COUNTERS,
> +
> +	/**
> +	 * @DRM_RAS_CMD_QUERY_ERROR_COUNTER: Query the information of a specific error counter
> +	 * for a given node. Response contains id, name, and current value of the counter.
> +	 */
> +	DRM_RAS_CMD_QUERY_ERROR_COUNTER,
> +
> +	__DRM_RAS_CMD_MAX,
> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
> +};
> +
> +#endif /* _LINUX_DRM_RAS_H */
> diff --git a/meson.build b/meson.build
> index db6e09a94..f7807660e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -165,10 +165,13 @@ cairo = dependency('cairo', version : '>1.12.0', required : true)
>  libudev = dependency('libudev', required : true)
>  glib = dependency('glib-2.0', required : true)
>  
> +libnl = dependency('libnl-3.0', required: false)
> +libnl_genl = dependency('libnl-genl-3.0', required: false)
> +libnl_cli = dependency('libnl-cli-3.0', required:false)
> +
>  xmlrpc = dependency('xmlrpc', required : false)
>  xmlrpc_util = dependency('xmlrpc_util', required : false)
>  xmlrpc_client = dependency('xmlrpc_client', required : false)
> -
>  xmlrpc_cmd = find_program('xmlrpc-c-config', required : false)
>  if not xmlrpc.found() and xmlrpc_cmd.found()
>  	libs_cmd = run_command(xmlrpc_cmd, 'client', '--libs', check: false)
> diff --git a/tools/drm_ras.c b/tools/drm_ras.c
> new file mode 100644
> index 000000000..9bb58bc5e
> --- /dev/null
> +++ b/tools/drm_ras.c
> @@ -0,0 +1,425 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +#include <ctype.h>
> +#include <getopt.h>
> +#include <linux/genetlink.h>
> +#include <netlink/netlink.h>
> +#include <netlink/cache.h>
> +#include <netlink/genl/genl.h>
> +#include <netlink/genl/ctrl.h>
> +#include <netlink/cli/utils.h>
> +#include <netlink/cli/link.h>
> +#include "../include/drm-uapi/drm_ras.h"
> +#include "igt_device_scan.h"
> +
> +#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
> +
> +struct nl_sock *mcsock;
> +
> +enum opt_val {
> +	OPT_UNKNOWN = '?',
> +	OPT_END = -1,
> +	OPT_NODEID,
> +	OPT_ERRORID,
> +	OPT_HELP,
> +};
> +
> +enum cmd_ids {
> +	INVALID_CMD = -1,
> +	LIST_NODES = 0,
> +	GET_ERROR_COUNTERS,
> +	QUERY_ERROR_COUNTER,
> +
> +	__MAX_CMDS,
> +};
> +
> +static const char * const cmd_names[] = {
> +	"list_nodes",
> +	"get_error_counters",
> +	"query_error_counter",
> +};
> +
> +struct app_context {
> +	enum drm_genl_error_cmds command;
> +	struct nl_sock *sock;
> +	struct nl_cb *cb;
> +	uint32_t node_id;
> +	uint32_t error_id;
> +	int error_id_set;
> +	int node_id_set;
> +	int error;
> +	int family_id;
> +};
> +
> +static void help(char **argv)
> +{
> +	int i;
> +
> +	printf("Usage: %s command [<command options>]\n", argv[0]);
> +	printf("commands:\n");
> +
> +	for (i = 0; i < __MAX_CMDS; i++) {
> +		switch (i) {
> +		case LIST_NODES:
> +			printf("%s %s\n",
> +			       argv[0],
> +			       cmd_names[i]);
> +			break;
> +		case GET_ERROR_COUNTERS:
> +			printf("%s %s "
> +				"--node-id=<node-id>\n",
> +				argv[0],
> +				cmd_names[i]);
> +			break;
> +		case QUERY_ERROR_COUNTER:
> +			printf("%s %s "
> +				"--node-id=<node-id> "
> +				"--error-id=<error-id>\n",
> +				argv[0],
> +				cmd_names[i]);
> +			break;
> +		default:
> +			printf("%s is Unknown Command\n",
> +			       (i < __MAX_CMDS && cmd_names[i]) ? cmd_names[i] : "Unknown");
> +		}
> +	}
> +}
> +
> +static int list_nodes_handler(struct nl_msg *msg, void *arg)
> +{
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct nlattr *nla;
> +	int len, remain;
> +
> +	len = GENL_HDRLEN;
> +	nlmsg_for_each_attr(nla, nlh, len, remain) {
> +		if (nla_type(nla) > DRM_RAS_NODE_ATTR_MAX) {
> +			printf("Unknown Node attribute type: %d\n", nla_type(nla));
> +			return NL_SKIP;
> +		}
> +
> +		switch (nla_type(nla)) {
> +		case DRM_RAS_NODE_ATTR_NODE_ID:
> +			printf("%-18u\t", nla_get_u32(nla));
> +			break;
> +		case DRM_RAS_NODE_ATTR_DEVICE_NAME:
> +			printf("%-30s\t", nla_get_string(nla));
> +			break;
> +		case DRM_RAS_NODE_ATTR_NODE_NAME:
> +			printf("%-30s\t", nla_get_string(nla));
> +			break;
> +		case DRM_RAS_NODE_ATTR_NODE_TYPE:
> +			printf("%-18u\n", nla_get_u32(nla));
> +			break;
> +		default:
> +			printf("Unknown attribute type: %d\n", nla_type(nla));
> +			break;
> +		}
> +	}
> +	return NL_OK;
> +}
> +
> +static int query_error_counter(struct nl_msg *msg, void *arg)
> +{
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct nlattr *attrs[256];
> +	int ret;
> +
> +	ret = genlmsg_parse(nlh, 0, attrs, 256, NULL);
> +	if (ret < 0) {
> +		fprintf(stderr, "Failed to parse attributes: %s\n", nl_geterror(ret));
> +		return NL_SKIP;
> +	}
> +
> +	if (!attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE]) {
> +		nl_cli_fatal(NLE_FAILURE, "DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE attribute is missing");
> +		return NL_SKIP;
> +	}
> +
> +	printf("counter value %u\n", nla_get_u32(attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE]));
> +
> +	return NL_OK;
> +}
> +
> +static int get_error_counters(struct nl_msg *msg, void *arg)
> +{
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct nlattr *nla;
> +	int len, remain;
> +
> +	len = GENL_HDRLEN;
> +
> +	nlmsg_for_each_attr(nla, nlh, len, remain) {
> +		if (nla_type(nla) > DRM_RAS_ERROR_COUNTER_ATTR_MAX) {
> +			printf("Unknown error counter attribute type: %d\n", nla_type(nla));
> +			return NL_SKIP;
> +		}
> +
> +		switch (nla_type(nla)) {
> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID:
> +			printf("%-18u\t", nla_get_u32(nla));
> +			break;
> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME:
> +			printf("%-30s\t", nla_get_string(nla));
> +			break;
> +		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE:
> +			printf("%-18u\n", nla_get_u32(nla));
> +			break;
> +		default:
> +			printf("Unknown attribute type: %d\n", nla_type(nla));
> +			break;
> +		}
> +	}
> +	return NL_OK;
> +}
> +
> +static int drm_genl_handle_msg(struct nl_msg *msg, void *arg)
> +{
> +	struct app_context *ctx = (struct app_context *)arg;
> +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> +	struct genlmsghdr *gnlh = genlmsg_hdr(nlh);
> +
> +	if (gnlh->cmd != ctx->command) {
> +		fprintf(stderr,
> +			"Unexpected command response: got %d, expected %d\n",
> +			gnlh->cmd,
> +			ctx->command);
> +		return NL_SKIP;
> +	}
> +
> +	switch (ctx->command) {
> +	case DRM_RAS_CMD_LIST_NODES:
> +		return list_nodes_handler(msg, arg);
> +	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
> +		return get_error_counters(msg, arg);
> +	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
> +		return query_error_counter(msg, arg);
> +	default:
> +		fprintf(stderr, "Unknown command: %d\n", ctx->command);
> +		ctx->error = -EOPNOTSUPP;
> +		return NL_SKIP;
> +	}
> +}
> +
> +static void handle_err(struct nl_sock *sock, int ret, const char *err_msg)
> +{
> +	nl_close(sock);
> +	nl_socket_free(sock);
> +	nl_cli_fatal(ret, err_msg);
> +}
> +
> +static void send_cmd(int cmd, void *arg)
> +{
> +	struct app_context *ctx = (struct app_context *)arg;
> +	struct nl_msg *msg;
> +	void *msg_head;
> +	int ret;
> +
> +	msg = nlmsg_alloc();
> +	if (!msg)
> +		handle_err(ctx->sock, NLE_INVAL, "nlmsg_alloc failed\n");
> +
> +	switch (cmd) {
> +	case DRM_RAS_CMD_LIST_NODES:
> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
> +				       ctx->family_id, 0,
> +				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
> +				       cmd, 1);
> +		if (!msg_head)
> +			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
> +
> +		printf("%-18s\t%-30s\t%-30s\t%-18s\n",
> +		       "node-id", "device-name", "node-name", "node-type");
> +		break;
> +	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
> +		if (ctx->node_id == -1) {
> +			fprintf(stderr, "Error: --node-id is required for %s command\n",
> +				cmd_names[ctx->command - 1]);
> +			exit(EXIT_FAILURE);
> +		}
> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
> +				       ctx->family_id, 0,
> +				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
> +				       cmd, 1);
> +
> +		if (!msg_head)
> +			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
> +
> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
> +		printf("%-18s\t%-30s\t%-18s\n",
> +		       "error-id", "error-name", "error-value");
> +		break;
> +	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
> +		if (ctx->node_id == -1 || ctx->error_id == -1) {
> +			fprintf(stderr,
> +				"Error: --node-id and --error-id are required "
> +				"for %s command\n",
> +				cmd_names[ctx->command - 1]);
> +			exit(EXIT_FAILURE);
> +		}
> +		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
> +				       ctx->family_id, 0,
> +				       NLM_F_REQUEST | NLM_F_ACK,
> +				       cmd, 1);
> +
> +		if (!msg_head)
> +			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
> +
> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
> +		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID, ctx->error_id);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	ret = nl_send_auto(ctx->sock, msg);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
> +
> +	ret = nl_recvmsgs_default(ctx->sock);
> +	if (ret < 0)
> +		nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
> +
> +	nlmsg_free(msg);
> +}
> +
> +static int get_cmd(char *cmd_name)
> +{
> +	int i;
> +
> +	if (!cmd_name)
> +		return -1;
> +
> +	for (i = 0; i < __DRM_RAS_CMD_MAX; i++) {
> +		if (strcasecmp(cmd_name, cmd_names[i]) == 0)
> +			return i + 1;
> +	}
> +	return -1;
> +}
> +
> +static int check_for_help(int argc, char **argv)
> +{
> +	for (int i = 1; i < argc; i++) {
> +		if (strcmp(argv[i], "--help") == 0 || strcmp(argv[i], "-h") == 0)
> +			return 1;
> +	}
> +	return 0;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	char *endptr;
> +	int ret, opt, option_index = 0;
> +	struct app_context ctx = {0};
> +
> +	ctx.error_id = -1;
> +	ctx.node_id = -1;
> +
> +	if (argc < 2) {
> +		fprintf(stderr, "\nNo Arguments were passed.\n\n"
> +			"Use --help to see the correct usage.\n\n");
> +		exit(EXIT_FAILURE);
> +	}
> +	if (check_for_help(argc, argv)) {
> +		help(argv);
> +		exit(EXIT_SUCCESS);
> +	}
> +
> +	ctx.command = get_cmd(argv[1]);
> +	if (ctx.command < 0) {
> +		fprintf(stderr, "invalid command\n");
> +		help(argv);
> +		exit(EXIT_FAILURE);
> +	}
> +
> +	static struct option options[] = {
> +		{"error-id", optional_argument, NULL, OPT_ERRORID},
> +		{"node-id",  optional_argument, NULL, OPT_NODEID},
> +		{"help",     no_argument,       NULL, OPT_HELP},
> +		{0, 0, 0, 0}
> +	};
> +
> +	optind = 2;
> +	while ((opt = getopt_long(argc, argv, "h", options, &option_index)) != -1) {
> +		switch (opt) {
> +		case OPT_ERRORID:
> +			if (optarg) {
> +				ctx.error_id = strtoul(optarg, &endptr, 10);
> +				if (*endptr != '\0' || !ctx.error_id) {
> +					fprintf(stderr,
> +						"\ninvalid error-id %s\n\n"
> +						"Enter a valid error-id received "
> +						"from get_error_counters command\n\n",
> +						optarg);
> +					exit(EXIT_FAILURE);
> +				}
> +			} else {
> +				printf("error-id not specified. check --help  for correct usage\n");
> +				exit(EXIT_FAILURE);
> +			}
> +			break;
> +		case OPT_NODEID:
> +			if (optarg) {
> +				ctx.node_id = strtoul(optarg, &endptr, 10);
> +				if (*endptr != '\0' || !ctx.node_id) {
> +					fprintf(stderr,
> +						"\ninvalid node id %s\n\n"
> +						"Enter a valid node-id received "
> +						"from list_nodes command\n\n",
> +						optarg);
> +					exit(EXIT_FAILURE);
> +				}
> +			} else {
> +				printf("node-id not specified. Check --help for correct usage\n");
> +				exit(EXIT_FAILURE);
> +			}
> +			break;
> +		case OPT_HELP:
> +		case 'h':
> +			help(argv);
> +			exit(EXIT_SUCCESS);
> +			break;
> +		case '?':
> +			fprintf(stderr,
> +				"Unknown argument passed\n"
> +				"Check --help for the correct usage\n\n");
> +			exit(EXIT_FAILURE);
> +			break;
> +		default:
> +			fprintf(stderr, "Unexpected option: %c\n", opt);
> +			exit(EXIT_FAILURE);
> +			break;
> +		}
> +	}
> +
> +	ctx.sock = nl_cli_alloc_socket();
> +	if (!ctx.sock)
> +		nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");
> +
> +	ret = nl_cli_connect(ctx.sock, NETLINK_GENERIC);
> +	if (ret < 0)
> +		handle_err(ctx.sock, ret, "Cannot connect handle\n");
> +
> +	ctx.family_id = genl_ctrl_resolve(ctx.sock, DRM_RAS_GENL_NAME);
> +	if (ctx.family_id < 0)
> +		handle_err(ctx.sock, NLE_INVAL, "Resolving of family name failed\n");
> +
> +	ret = nl_socket_modify_cb(ctx.sock, NL_CB_VALID, NL_CB_CUSTOM, drm_genl_handle_msg, &ctx);
> +	if (ret < 0)
> +		handle_err(ctx.sock, ret, "Unable to modify valid message callback\n");
> +
> +	send_cmd(ctx.command, &ctx);
> +
> +	nl_close(ctx.sock);
> +	nl_socket_free(ctx.sock);
> +
> +	return 0;
> +}
> diff --git a/tools/meson.build b/tools/meson.build
> index 8185ba160..74ff97713 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -70,6 +70,11 @@ if libudev.found()
>  		   install : true)
>  endif
>  
> +executable('drm_ras', 'drm_ras.c',
> +			dependencies : [tool_deps, libnl, libnl_cli, libnl_genl],
> +			install_rpath : bindir_rpathdir,
> +			install : true)
> +
>  executable('gputop', 'gputop.c',
>             install : true,
>             install_rpath : bindir_rpathdir,
> -- 
> 2.34.1
> 
