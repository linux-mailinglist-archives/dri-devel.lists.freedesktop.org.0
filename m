Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F02EAD0392
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 15:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EE910E107;
	Fri,  6 Jun 2025 13:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCzaWwqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3847410E107;
 Fri,  6 Jun 2025 13:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749218195; x=1780754195;
 h=date:from:to:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5qE7Lcqox1Ot7wT2L3LUvzDeZ0uhg1KaUqIPqVnWsvY=;
 b=TCzaWwqhuGd77WOGVmac5GVLZGQIcduKFl2dIWZwePvXfpm+L3qLJJv6
 VjwLKmIdnW4ona452snLtSOCBXR0fa8nSwrOQoaz+w2qb2CA09xrnGdTM
 GQMOy9OKo0SuBj2vsdHixXdUHQilCGygDaYqhy4Ka8C2Bz/fYI9buYMgk
 cRovPcLeK1gcbfoGw9l/9w92T6NSe/hWo7tt4QKgyzLLCPNWdWMG87Ua4
 edliCkmCx9mRWLgJZsYba2wZ8lMXiGk9tgwbFov9OfGS7LxwtZNFfxeZF
 UUwtKuF6ojCrKMh26N245zoMryGfu43aaCokbOAM/kiouFltqYZ2LSGjb w==;
X-CSE-ConnectionGUID: D9rBhc36TBacawpTqoncVQ==
X-CSE-MsgGUID: ilMRwrBWQauEfAdfFGvidg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="55159655"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="55159655"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:56:35 -0700
X-CSE-ConnectionGUID: tcJWI1lnTYiIJcuZfBQ7cg==
X-CSE-MsgGUID: nTVU/6XqQemqasqjkZiPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="151091310"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 06:56:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 06:56:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 06:56:33 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.72)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 06:56:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHLsVzJEd7YaJXgo/G6/tnWPDXkekz7Q92x9KfxVz+khHEyTeD6TO7whKHy+NyUscVDvjHiLy3j9MsLhmZ+UgtKTtS7qFiMadck/QIQfRzeIKI0j//yXiV1cP4mXeyDi862Z7HR5YqE0GnD202O9y+BOJc9jdlyUsk/0HFPZJDAwvlQCEdH3eEd2Ih160MP1lXRuarRYKnB4mBfDus2Ns/CfZbkgeMKLLs90YNhiXRUSck2NSGqapk/OQj2xkkcSg1/obH2iuFhUjxwWWfxmrM7t/Ux18wbSXCvEKMt4rojoD6Qq0hN6ml2+YfgBCYoYhP5NXwnA8vafUL+AsnzZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzvOsAOXuUvmmHvUFJFe7ZR+x6EKvFWMBbTZKpaBhcI=;
 b=i6BvPEZYjHRT1+S3TgYpanqmk7YAlKNnV9QcVJSyyqdvwhNnN61Xjv2WGXLaJsud/qDIV9Oa+xD+uT0uZnezC6RbfHMIdiJ7pRgLsPLzIoy2rf1rTNGztHO1uTurQPKsHHo2weeEysSUSRvHeAIb9iSXPm4AxC8n1zcBggWbpjuYGh7Hw1s3D/z9dBHcq0Hqd4yQCqcwiXBAICR8kVtHiT7r+BHZFf1sAcPK+VySksfimaaJ9V85O+bGolaTZiptN6Lh3tu3i1DudTODJKkV2MWItHa6nWcZjb0q0p5J4lwVqg+ZGbx7m6zMaSsTppLEwutgsHmABkXi8Z8GJPX6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CH3PR11MB7940.namprd11.prod.outlook.com (2603:10b6:610:130::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Fri, 6 Jun
 2025 13:56:02 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%2]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 13:56:01 +0000
Date: Fri, 6 Jun 2025 16:55:55 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3 5/5] drm/i915/dp: Disable the AUX DPCD probe quirk if
 it's not required
Message-ID: <aELzaxIUjxANMLH9@ideak-desk>
References: <20250605082850.65136-1-imre.deak@intel.com>
 <20250605082850.65136-6-imre.deak@intel.com>
 <99b831c92a446eb5e33d8d9536f6750d4a6e3ae8@intel.com>
 <aELyC0YxLiIgxIj5@ideak-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aELyC0YxLiIgxIj5@ideak-desk>
X-ClientProxiedBy: VI1PR06CA0188.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::45) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CH3PR11MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2c78ae-37ff-42f0-fab6-08dda501df28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ErvM2z0NUUlCGMm8sxdLf93lxrvjxjkeLsPTxklQi2XPC4ezfLhaYBcBm0?=
 =?iso-8859-1?Q?7WgcyPBUBg880vB34dAo8AJ/CbyA7QMTGwG07HXbHwDLdHTeD+P5Leqx34?=
 =?iso-8859-1?Q?EFaaRync3v3f7APdgZxA6wLr7HdRTIKNICgTiypkY45lG2xwTiOiLSYGts?=
 =?iso-8859-1?Q?BgQ6lMEpN0NZd7Zc7PHqpoxVQjdE6PeSlku0twz4s+/ttHKswkOQ6jmN2R?=
 =?iso-8859-1?Q?1Zxwt/PjfyYFSJZvlst1CX23CkYpzru0xKHlFjqu1EyW7E00kb1Ib+v2ko?=
 =?iso-8859-1?Q?KgCGcRGvvBcwkQSnZfrDhfvsTdqZD58g5AIzfG6b95XZ+zKP4VkAiakmXI?=
 =?iso-8859-1?Q?04PMnwfcR4u+QKTFxz4TF+JwWk4HtaWV3Fxdq1QfY+/4LlgA4Y/d2no7G6?=
 =?iso-8859-1?Q?4D3GJ6B66qTZYLWdIXKfUtaqNONqlobMfqO3KUFzrUp9eEuQpnrerC3MiS?=
 =?iso-8859-1?Q?pXkRgkCPnCgWhzz87Zt8S1217Z/YwdKVPZAo6bn3Jrjl3t6fPvdECErrAz?=
 =?iso-8859-1?Q?C3m6hymcJOHZKgij2DMHmQ0UCngbrOARSyhCOnVs33qVUcguSaahKLkADR?=
 =?iso-8859-1?Q?Iyon+gQJGjsjQ1KjW7QOqgHZhoFhE7/JSA3qL0G9R9u7Bs4Ws5vWvZpOzI?=
 =?iso-8859-1?Q?3dnT2qCvwLGz2eEmOhB+huXo55gMme16Zcx/McNAXAxRfdmk9AaH+TP4fg?=
 =?iso-8859-1?Q?81q8MYA7y0FFve6BE20RiqoCiyYFU/5+qSvf5WpxftPXJ+yfeap02/kcTS?=
 =?iso-8859-1?Q?aOdWti+E+isL4E01xRmBESUZNUb3Rn+Ief+hWiNaeXa5mAbfOLv8+qvhEQ?=
 =?iso-8859-1?Q?ety42J+P/CDCzPxwVMCAuOKB6me2CNei14Hrbf7RtOrG6ZjG7wIN4SvxLm?=
 =?iso-8859-1?Q?qUDUZOLSlEIkaEbyTi3M3e7+azpCc+GOcX4dP0k+OXxRL5/4Y3Pczq1uWG?=
 =?iso-8859-1?Q?JWtbbLi94/YwOkbcWuCd2Mw5LppsnI3IgjYuDuQQj0TJrJm8qKyY2EfhLv?=
 =?iso-8859-1?Q?tNMDdUoS4x24UsAc7Fc2UoQWSahy3dzgPC0i3IyXCidh25zSc3DIfomJx5?=
 =?iso-8859-1?Q?T1Rj8JLuA32k884/fwxN/sZSiTk04CHKhPKjoV3kTNT+N7gOS4wzZAvWIZ?=
 =?iso-8859-1?Q?WwxCeHb6YbE5FK+2scfP0kLawjKgCycqzHpn7sP0irM1tjKHYT7A3C3Ynb?=
 =?iso-8859-1?Q?lPzBP1bayPTK2XarENZioLnmbrBE/73coxzifYIo3lbI7YDDP58NZnpzk+?=
 =?iso-8859-1?Q?jjSGHbdQ4NBnPPymWj75hVIQTcVTk9zsZlBoOmZvyI21y4eBYuIYg3OAR9?=
 =?iso-8859-1?Q?ByJn0F1hOhFVZxtk3MYfOaYGaaUZ6n9kscjp44sTJIHJV6MgFr1fEMNQK2?=
 =?iso-8859-1?Q?AZH5mXjCNf+MtvPJbK+csIPCo/FCRhppbQv69Go9EST24gys90ELA2CQH3?=
 =?iso-8859-1?Q?ka0uNpLJlEFnP8ovoS9oJpAm0pMa6DrgoCVG2RMQqprfjyuvIU3mgKEVTZ?=
 =?iso-8859-1?Q?g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5LIYvEIi4HVxiQgkeJOY0MfgFD111Wx06vAxzsAFn9pft4p5Ufsgw/n8/+?=
 =?iso-8859-1?Q?TS/QA8Yw5bRLIGu3pIXJYEzdD2oj6wt11dKT0XUhydZ9zlAZFRo32+rBIh?=
 =?iso-8859-1?Q?AWavXGBEx2aCYJnhvm87+OUevrEOCiVrtd0pNr3DD0xLfM6vlO2kwiJ6c3?=
 =?iso-8859-1?Q?imnFvBd82iS15ePjzCngjUf18PJ+xsO3EB6rJuVltdVE3hdVhCtTC8vdjH?=
 =?iso-8859-1?Q?TAS87LEvfs61+sKi0N6cmnK4Eou4BUwZ1AKtMCws9BPZ9mcvLAwfMqy9Jx?=
 =?iso-8859-1?Q?sz67caaPJu0V8HlK/4qhQmwUiPGD+qm66GYigi36XDVMs3jbFjdh+wwqzz?=
 =?iso-8859-1?Q?SJFyEFM0RhQz69a256WuA37S6yacnxuHTb9D1S3brVRc32E9pLV6ekxhkW?=
 =?iso-8859-1?Q?wz4rVO9YLCXBok9a49fm6YdkHCC20empw3+Pl66emBsfZDyWC0xvf0rv/K?=
 =?iso-8859-1?Q?HQG8vdDT47sxC7rlD5KqO7Hk/jxUeTPsL48R8QyXNHoeDzjdB/ZwSHAaTF?=
 =?iso-8859-1?Q?GqnIc1tc4YfB1FsU8tvLjb+LnHkJCIZJRuoCFblE8mS+k2z8dBtrxXOM/D?=
 =?iso-8859-1?Q?7sXRAA9b5dCFQwFPpH5+ZWnkOmVkRyMUntlAhYWz7SrOggnp8fE6vJ9Wzp?=
 =?iso-8859-1?Q?BavHyXScnSkklaHwkSBEzdUJiKCuN04yfiCvJ5POfixjnnHnqxXKfcpmXQ?=
 =?iso-8859-1?Q?UU6w2frK43u2baKKeCcS6uHAtdcSj7ynGLmjyZbO2OwEMP9hDEDjPZPPDn?=
 =?iso-8859-1?Q?FsvZE11t4X/AIfGGwVhn00oantuXisHtCPcRvtmQYqDagbhYRDo6CzDAZm?=
 =?iso-8859-1?Q?lycgtWg+g+UAght2Ixwh80ryk4rnda15ZVjDXi67cylAcxFBewO2LN208g?=
 =?iso-8859-1?Q?1Y9l9c0Qxv509vkzyLoDVDgWN2EYvFRbhkz9kXPlHUpoeA9uLXzto+l7i4?=
 =?iso-8859-1?Q?FhNgUKPzumMAvVTk8M0MkgKSPfyuQXa+gHEoZjapwd0r5Oyzc7wbdoObdK?=
 =?iso-8859-1?Q?TvokRat0SsnaxarHe7dGzrYSawQMca/b8c4T1YG82msJK9sfxGtEkeHaO5?=
 =?iso-8859-1?Q?Uz3OAVyHyz4Qt5N2KGqhlRyXQnUl+BKbGvcdoOh2vOyRSCs+Fya1kMORVT?=
 =?iso-8859-1?Q?Z7BGPSYY5oiLOm6suUB493v6jCEONPoXLANK105byzV66FQ/qJ+fdxvqjm?=
 =?iso-8859-1?Q?/WysAFRt5moAQsIdceSSgjzboynKe/RAOSmioAyKFzaezcexHCKn5yQmgt?=
 =?iso-8859-1?Q?LDelRBi9tKP+6QxWeW4nfLDeOh6mRYGzB3SiPFp/Q0cBqN4qeGpUbAo+WE?=
 =?iso-8859-1?Q?oi+wfFOgiWhnfPegw5R/nZxW/aA3Hb47Sv8qhDFnjxHruThrD5O2WEbbjS?=
 =?iso-8859-1?Q?eKy4YAesaoJssdJNO+I9012I0F0TFfcT47nTWg5U23yMcgghourwqQa3nb?=
 =?iso-8859-1?Q?ilY5zKNjtOMYcghyJaNiHy2QUbE6bHZEX5qCYbQvO4888vO9Q+Oez9forc?=
 =?iso-8859-1?Q?gxyv3bQJ2PT2PjnPVE4317DOZ4jYUIkIamoij0apsJpjMXiKMRJ6lcRTut?=
 =?iso-8859-1?Q?sKBpF+mIevqTOAJntiF9kL4AakqdMtERu2i/B81TcdknDYVRuNWZwEvOtN?=
 =?iso-8859-1?Q?q2rKiH6w9IGdpLLJZGY3IFXjw2q3DuhGRh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2c78ae-37ff-42f0-fab6-08dda501df28
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 13:56:01.5684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aw3BSObROLcavVj2Ww1vzmmp3N75BDZRUvtOkx9xON08eluZMNbJQewdd3zMG5Gz6C2r8mO1XcX2B+n/jr98A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7940
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

On Fri, Jun 06, 2025 at 04:50:03PM +0300, Imre Deak wrote:
> On Fri, Jun 06, 2025 at 04:44:37PM +0300, Jani Nikula wrote:
> > On Thu, 05 Jun 2025, Imre Deak <imre.deak@intel.com> wrote:
> > > Reading DPCD registers has side-effects and some of these can cause a
> > > problem for instance during link training. Based on this it's better to
> > > avoid the probing quirk done before each DPCD register read, limiting
> > > this to the monitor which requires it. The only known problematic
> > > monitor is an external SST sink, so keep the quirk disabled always for
> > > eDP and MST sinks. Reenable the quirk after a hotplug event and after
> > > resuming from a power state without hotplug support, until the
> > > subsequent EDID based detection.
> > >
> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/display/intel_dp.c      | 11 +++++++++--
> > >  drivers/gpu/drm/i915/display/intel_dp_aux.c  |  2 ++
> > >  drivers/gpu/drm/i915/display/intel_hotplug.c | 10 ++++++++++
> > >  3 files changed, 21 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> > > index 208a953b04a2f..d65a18fc1aeb9 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > > @@ -5747,6 +5747,11 @@ intel_dp_set_edid(struct intel_dp *intel_dp)
> > >  	/* Below we depend on display info having been updated */
> > >  	drm_edid_connector_update(&connector->base, drm_edid);
> > >  
> > > +	if (!intel_dp_is_edp(intel_dp))
> > 
> > Why does this depend on !edp?
> > 
> > Feels like unnecessary optimization based on your knowledge of that one
> > specific display.
> 
> The detection itself requires probing before each DPCD access. I want to
> avoid it whenever possible and since the quirk is relevant only the
> particular HP external display, we can avoid the probing on eDP
> completely.

Ok, the eDP check here can be removed, as the panel's EDID panel ID
should not match the quirk's panel ID. Will remove it.

> > > +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux,
> > > +					    drm_edid_has_quirk(&connector->base,
> > > +							       DRM_EDID_QUIRK_DP_DPCD_PROBE));
> > > +
> > >  	vrr_capable = intel_vrr_is_capable(connector);
> > >  	drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] VRR capable: %s\n",
> > >  		    connector->base.base.id, connector->base.name, str_yes_no(vrr_capable));
> > > @@ -5881,6 +5886,7 @@ intel_dp_detect(struct drm_connector *_connector,
> > >  	intel_dp_print_rates(intel_dp);
> > >  
> > >  	if (intel_dp->is_mst) {
> > > +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, false);
> > 
> > Isn't this excessive? Haven't we already set the quirk state?
> 
> No, this is the MST root connector's detection and we don't read the EDID
> for it (we read it for MST non-root connectors, but those are not
> relavant in any case). So this should be set here explicitly, with the
> same justification as above for eDP (on MST the probing is never needed,
> so we can avoid it on such links completely).
> 
> > 
> > >  		/*
> > >  		 * If we are in MST mode then this connector
> > >  		 * won't appear connected or have anything
> > > @@ -6321,10 +6327,11 @@ intel_dp_hpd_pulse(struct intel_digital_port *dig_port, bool long_hpd)
> > >  	 * complete the DP tunnel BW request for the latter connector/encoder
> > >  	 * waiting for this encoder's DPRX read, perform a dummy read here.
> > >  	 */
> > > -	if (long_hpd)
> > > +	if (long_hpd) {
> > > +		drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
> > > +
> > >  		intel_dp_read_dprx_caps(intel_dp, dpcd);
> > >  
> > > -	if (long_hpd) {
> > >  		intel_dp->reset_link_params = true;
> > >  		intel_dp_invalidate_source_oui(intel_dp);
> > >  
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > > index bf8e8e0cc19c9..410252ba6fd16 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
> > > @@ -835,6 +835,8 @@ void intel_dp_aux_init(struct intel_dp *intel_dp)
> > >  
> > >  	intel_dp->aux.transfer = intel_dp_aux_transfer;
> > >  	cpu_latency_qos_add_request(&intel_dp->pm_qos, PM_QOS_DEFAULT_VALUE);
> > > +
> > > +	drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, !intel_dp_is_edp(intel_dp));
> > >  }
> > >  
> > >  static enum aux_ch default_aux_ch(struct intel_encoder *encoder)
> > > diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
> > > index 74fe398663d63..1093c6c3714c0 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_hotplug.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
> > > @@ -33,6 +33,7 @@
> > >  #include "intel_display_core.h"
> > >  #include "intel_display_rpm.h"
> > >  #include "intel_display_types.h"
> > > +#include "intel_dp.h"
> > >  #include "intel_hdcp.h"
> > >  #include "intel_hotplug.h"
> > >  #include "intel_hotplug_irq.h"
> > > @@ -906,9 +907,18 @@ void intel_hpd_poll_enable(struct intel_display *display)
> > >   */
> > >  void intel_hpd_poll_disable(struct intel_display *display)
> > >  {
> > > +	struct intel_encoder *encoder;
> > > +
> > >  	if (!HAS_DISPLAY(display))
> > >  		return;
> > >  
> > > +	for_each_intel_dp(display->drm, encoder) {
> > > +		struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
> > > +
> > > +		if (!intel_dp_is_edp(intel_dp))
> > > +			drm_dp_dpcd_set_probe_quirk(&intel_dp->aux, true);
> > > +	}
> > > +
> > >  	WRITE_ONCE(display->hotplug.poll_enabled, false);
> > >  
> > >  	spin_lock_irq(&display->irq.lock);
> > 
> > -- 
> > Jani Nikula, Intel
