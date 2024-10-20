Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE749A55EC
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 20:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D98210E09B;
	Sun, 20 Oct 2024 18:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UjA69Xe2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F5210E09B;
 Sun, 20 Oct 2024 18:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729450698; x=1760986698;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wkYFJ1uqelB+NQ2wbusK6T2w62DeFliP3BhmVikW1IU=;
 b=UjA69Xe2PGntsYz7xHIh0V8aq4w9nHSR0BOx8K6HetoZdp3s1odSULY6
 H913VWsFX6ZXksTwUQKoXs8O/qm4u60C59z/0bobM7wm619sLFXzBwnGk
 FgYTJ9tnxUtUo9p94WfvDapBXj13PjmvNhFOlGbO1Jp+5OAHYIUzGHJgM
 fSNOgesJUBW+yGSrEm2l37cjVSNonVtu/F3w5W6eZdjjO6jWvyCNYRMTy
 aeh63ORJ0ExTJ6+si6Und6ZIzi/qNVgj16IA2ZQAEw1TNAKLVbm0WZnbs
 1RHXqyYYQAL1YLny4zVCJRSIE5/to/m19SHI0G/9OjvDXsV8FSp7gqPZT g==;
X-CSE-ConnectionGUID: Mty24sBAQcWhRZ/u3Ws50A==
X-CSE-MsgGUID: zcEEi8ZHTDeTfGm5kwhhqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="28808123"
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; d="scan'208";a="28808123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2024 11:58:17 -0700
X-CSE-ConnectionGUID: ga0NnBZQTWSNgcagnPhjQQ==
X-CSE-MsgGUID: 8JdBUdwVQb2R+cOis8Ag1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; d="scan'208";a="84117888"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2024 11:58:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:58:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 20 Oct 2024 11:58:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 20 Oct 2024 11:58:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 20 Oct 2024 11:58:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3H1h0TseTp8TzTmr1zfNsVn4Fe7/D72jHjtVIfqmd7eu/4awHniKqinzp70MvgAclQT9fXZBLeHVNXHKgnKcHDgE9dl7rPmPXlfor3vVHtkkbxyFiqlzmrVRbRZ626LRCb9EjwO6YQ6Rl+yCrs/ePKemvcAJjIYpqg+Fq2TFWPoR/0LxqVsIimJ4pI1Lt1nkqQcGTrI3iAZ1qkKK9rCzmtj9tIdNMkaSFM2kztB4IE6zqVnBF1XaZxY80ewHN7tEcUtT9NhTPdF0OBsQddjJcx3nh2OgGbo+fvZ7jC6Ylxoo/yfHR+W/ukSSyfQRly3zz8jmrPECLODr7NJKzWY5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwRYVTSL3w63xZGyjvVtNpWC755t3RphknzqmblgJgE=;
 b=m7FQ1OHwFAkFmrD1jtNRv2ARU8JMLS6mFu5kUf8xUagJUflmhuwNGMdMV5fenlwAXwDeTdrf/BsUQcU3XUQPwLYN1Xgg1gcIjPh1xnNWSlnF49v9kwByn0wcGtGKAxWCyK7udF9Jg4LDYjWVqSjloYxVQ9nqCqpX8uu+9huvl14WcoEowpPpwew4TcV6sn24mEr+e19NaXHmEfyhQ1crnTY0ezNQ1HJOWyzSYzFxBKXbNR1Xtzqn/aVCGLt2v5tt/EB/+N0MboI7rCLnSCEbnuu+sPrhdFMcl2YMBSgTw23lKsj98IhNFA2qzkiDgVaHoi0KH+mIW5G/2CwcjmZXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7454.namprd11.prod.outlook.com (2603:10b6:a03:4cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Sun, 20 Oct
 2024 18:58:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.024; Sun, 20 Oct 2024
 18:58:08 +0000
Date: Sun, 20 Oct 2024 18:57:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Paulo Zanoni <paulo.r.zanoni@intel.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v11 5/8] drm/ttm: Add a macro to perform LRU iteration
Message-ID: <ZxVShUFo9PnyWzae@DUT025-TGLU.fm.intel.com>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
 <20241016085559.11840-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241016085559.11840-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0119.namprd05.prod.outlook.com
 (2603:10b6:a03:334::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be34a39-6007-4dca-9a2c-08dcf1392336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?FXq6KCVtRoRMDmZE3CVinVq81wZpS+7xx4HO12496kHp/c1f45F0Kb/H0n?=
 =?iso-8859-1?Q?VONhWVZ71zs3MzzokqT1kcOzfNoe0a4oSOPdmdVLVPvCJV5kHU+oamnQHs?=
 =?iso-8859-1?Q?Qi8aeHtm2qCT6vBYajyjbenU7AFjAmjsWTwJZumkw9xyJwee/+Dr3wQ+uR?=
 =?iso-8859-1?Q?nr3SZV64BYzvxPvr0xLvgnQ7bh2k6iw/OwSWOSHOODkrpkupJm/sQnMqIO?=
 =?iso-8859-1?Q?9wAQALZzCaa8Bz4VkFp1ZU8WgLGlyrOoCOtpdKzhYxxrQZDM3aRxHHzbE1?=
 =?iso-8859-1?Q?fmcJ93hDhr28xO6et9U8r1/w91SctA4cpAYK/3acJHyzUWQiGU+qEzmaXq?=
 =?iso-8859-1?Q?u9yyAtH2iuJG1F/tzpoDQyXMufD6J3OuWNa8d0wICfPskNAN1LUSBal336?=
 =?iso-8859-1?Q?8wi3hsomNb9ySN5axWfV+WGTxbV5YTLrg3f63ekKdxU54z7BhtSNOGCYQQ?=
 =?iso-8859-1?Q?gaayZ3BOFESTiZQTmPJd+25Ikl/LHbFR5bHvlqy/jrEiVXSlhkZqFG4R5o?=
 =?iso-8859-1?Q?DCdrDJprJGqo5GwuSqxh0YDvAsw5ynhP2fjZmrM5n+C8pOjBwloblPt0KS?=
 =?iso-8859-1?Q?J8oismd8AJ8/lw6sPW2I6IvJpLyZZw4aPodYB02XAwAmEYbd62bGrEGjZD?=
 =?iso-8859-1?Q?ukO8VumuAa7C8um8NzV/tuN6cyfxdaaYW9nbv/LpVHjukI1A6VHCe40HvH?=
 =?iso-8859-1?Q?miIOzDMNdeajumTU2O64HVvr0noEVhlRvhjWZKAa1PXScaIUPdR7mqcNqv?=
 =?iso-8859-1?Q?hH8ddtn3u/hQXhRRNw/mF/MPIJzz9oMYKuXpcRRR/9mGluOweCB/PL1ZQX?=
 =?iso-8859-1?Q?M2iDl9he4VsZV+4Awly/igvtHgCHjlPSJgktsvFEL0sl0qkeIpayNWrYcu?=
 =?iso-8859-1?Q?AqMjHU5RqCpxNUhKofYWlo5JTXyyFy3d8y97oCc+9BkTADGc2rfNXOeG5e?=
 =?iso-8859-1?Q?g24KVWcgwe01ZOhJ1i7jD5z0eavdYm8bnSky+iQOmGqZgwQE+tJX+0qfLZ?=
 =?iso-8859-1?Q?S9Zsosf93DVEYYuH8DNQgtc92h/14DQv71NpDKk2oolhTTLakmr/Wz+u4B?=
 =?iso-8859-1?Q?QfvKcXMnjrlup0nUBaH12g4Vbh2o0QQTLOGkF3aIJNdSmZiMLt+BpeN74k?=
 =?iso-8859-1?Q?PApORYNTX6Aa97vQjsjUY4sr3hWhPpnltRox14tEqKUc75Wm234lJ/npEx?=
 =?iso-8859-1?Q?DNzfNfxZHN2ni7kZKxe69EMzeDH4Nvnl6E1zBtqcN0R6dMvVUsz2e0cVDr?=
 =?iso-8859-1?Q?I2p0CzTux5oWCRYetIc4oofebxzcTetnnHUU2fCvOj4YbBzXz8oZfZlixE?=
 =?iso-8859-1?Q?ecEg9HmhdoMCG49gK2hC0KL/ifNTFpE3xKhnlAA8TuaSxFVPGENoS5dIr9?=
 =?iso-8859-1?Q?RtDTK/eFL1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PjrM1YH88gsB+r1ZjPA0KD4rNs4SucO4n0unQRgBoehkRKl6YgVS/ChJCQ?=
 =?iso-8859-1?Q?CDpSI61kesjrL74HqtRNBCDmyoqWujfqG21BNPmbiIxFaBabP82Hmztx0j?=
 =?iso-8859-1?Q?/+LwRkZUZ7F9Dw4j1izrdrEYXWBpm7Bzr0BW9Lf4UsuR4kzx2Bc7sVxPXl?=
 =?iso-8859-1?Q?UQa9fQ5zH9+5kOqyUW5dLVdk3n2OfYIuuNykkLnnQW44rz/gIhADHSjyBC?=
 =?iso-8859-1?Q?qGCpQvIz7qm5kyPBnzGSeSN5qG8KzvnzbeQ7NsG0kNuy9LUkmX6hmCWhR5?=
 =?iso-8859-1?Q?gF6EAHUfFibNPN+D2796Rj88pcvSNGOFM32JsEHLrQjMnyZx2uQmjqo+vg?=
 =?iso-8859-1?Q?HqPOrZ3S9iljlA8WoMe3eKBjdWI8gKs3377qN6XpOOwlqyGI3AYYtl2cVz?=
 =?iso-8859-1?Q?f/RQa4RV/7XkioNjlrWk+8YDvfFpSebH2mqw/o7i9/aB/w6OjxQX+P6lca?=
 =?iso-8859-1?Q?16g+PUzSa6WX20vi7FhnXRvTgccqn3JG9zpXfvZwIH8mDahj+hDetM9CQc?=
 =?iso-8859-1?Q?KXS1+g8+Xswgw+ypZTt8LeHZ3Z1ZO0zypH/e3LFCWIhI/YyZNiEGxWnCSX?=
 =?iso-8859-1?Q?o/mNhQaZnGpKN+IOBdaFzm9DJkX20n8dFTFZe+lacvzCKrfDPdS7yVYF+y?=
 =?iso-8859-1?Q?TQ/MbuIvyxunW/lrM6XO8GpSbbhTt7kqHr7VHue+3obw4bsWoq9wllnZCm?=
 =?iso-8859-1?Q?jxZ6wXCFuxdtcyUJvnyFd2uYIjK39VHxhEwbGt19WtFUW0rU9ZVTQBtQc8?=
 =?iso-8859-1?Q?aDsCNLBN7m9f1yQeYgUOh4G0OAUWF1v8PPuPpYUdNtUkGfit98ulU9Evir?=
 =?iso-8859-1?Q?j/vLX2RoBr8hEgyhOEYJHkYoSwciCLACvYEUE+4AqqGKWVbNy/a1IsJ1f6?=
 =?iso-8859-1?Q?Pv3jjnLBKMEMKuykMsOPtS0mMj4KF3FT6e/Ep1ufE/nAeUS8w88bzAYBwM?=
 =?iso-8859-1?Q?F2dXZl3N1l64RJ4sH45/mcHhysagAzrK5veajnIpUDudKfvoJ/Oa2STjPY?=
 =?iso-8859-1?Q?UfcAzzvIqLHCKX2oJqMt/MbqUTfwSsvdl6xruZhNfb5H4pkpGpSKkCpWwF?=
 =?iso-8859-1?Q?cMXqDENfXGM3ctUtfrIPf2BBROf4CBnbhR2WyuG2nS34nktpdoetzOPPUo?=
 =?iso-8859-1?Q?Nt24teCIFiEmGsoKK5E4LPTLBOBwSq6zwB1+dm7ito7fEIXn/E0hm9FLjT?=
 =?iso-8859-1?Q?uzPbSIISlUffrsFmxZ65Vw8fegdJ0flIuPourPu+koZgX9ErLytKJTBtXI?=
 =?iso-8859-1?Q?xJIS0/QYFlSO2H4E79fnCI0jerIPF7If0YFiNYs8UvBie7oUodEKjTouL+?=
 =?iso-8859-1?Q?3o6KZlVcPgeieo6KRdkrIYocVgcsY+284l6CnKwfKnpQShnMAyUQifEF5v?=
 =?iso-8859-1?Q?gluQqYsfUnug1U4K/8iHU5t3/6xe1qlXp6KcmEqUx4O5twi0HAsNFQUTk9?=
 =?iso-8859-1?Q?WPsSC+yxrnBrgP7tgsA3gn+JRZ7estcOy4H8y+PfS4qZA7afdnuMskVpxj?=
 =?iso-8859-1?Q?rKiBwiNs/QhcyeZRojPF5OuBMSyekfIwtoLwm5qbsKgOog19YV7sn8Es8o?=
 =?iso-8859-1?Q?tcqrzyfcmN++2dyjB5b25ezrb6juR1SaeyWpLwXFLHrrUmUSbhr7K23enr?=
 =?iso-8859-1?Q?RRKRHqtfJ4SCq0YV0TChy9fQCPkyEH1dtm1SDnl8Hpc1DGX1miUUfZFg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be34a39-6007-4dca-9a2c-08dcf1392336
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 18:58:08.7020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYwjninVHdI1KkGvBGEXjrgkLXB0PhPyuNXI1IUD1Q4OIV3CFh8XKq0L8ibR3Ab6uPbghyYsDVKVJVGxm6jxsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7454
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

On Wed, Oct 16, 2024 at 10:55:56AM +0200, Thomas Hellström wrote:
> Following the design direction communicated here:
> 
> https://lore.kernel.org/linux-mm/b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com/T/#ma918844aa8a6efe8768fdcda0c6590d5c93850c9
> 
> Export a LRU walker for driver shrinker use. The walker
> initially supports only trylocking, since that's the
> method used by shrinkes. The walker makes use of
> scoped_guard() to allow exiting from the LRU walk loop
> without performing any explicit unlocking or
> cleanup.
> 
> v8:
> - Split out from another patch.
> - Use a struct for bool arguments to increase readability (Matt Brost).
> - Unmap user-space cpu-mappings before shrinking pages.
> - Explain non-fatal error codes (Matt Brost)
> 
> v10:
> - Instead of using the existing helper, Wrap the interface inside out and
>   provide a loop to de-midlayer things the LRU iteration (Christian König).
> - Removing the R-B by Matt Brost since the patch was significantly changed.
> 
> v11:
> - Split the patch up to include just the LRU walk helper.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 140 +++++++++++++++++++++++++++++-
>  include/drm/ttm/ttm_bo.h          |  71 +++++++++++++++
>  2 files changed, 207 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 917096bd5f68..0cac02a9764c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -769,12 +769,10 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>  	return ret;
>  }
>  
> -static bool ttm_lru_walk_trylock(struct ttm_lru_walk *walk,
> +static bool ttm_lru_walk_trylock(struct ttm_operation_ctx *ctx,
>  				 struct ttm_buffer_object *bo,
>  				 bool *needs_unlock)
>  {
> -	struct ttm_operation_ctx *ctx = walk->ctx;
> -
>  	*needs_unlock = false;
>  
>  	if (dma_resv_trylock(bo->base.resv)) {
> @@ -877,7 +875,7 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  		 * since if we do it the other way around, and the trylock fails,
>  		 * we need to drop the lru lock to put the bo.
>  		 */
> -		if (ttm_lru_walk_trylock(walk, bo, &bo_needs_unlock))
> +		if (ttm_lru_walk_trylock(walk->ctx, bo, &bo_needs_unlock))
>  			bo_locked = true;
>  		else if (!walk->ticket || walk->ctx->no_wait_gpu ||
>  			 walk->trylock_only)
> @@ -920,3 +918,137 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  
>  	return progress;
>  }
> +EXPORT_SYMBOL(ttm_lru_walk_for_evict);
> +
> +static void ttm_bo_lru_cursor_cleanup_bo(struct ttm_bo_lru_cursor *curs)
> +{
> +	struct ttm_buffer_object *bo = curs->bo;
> +
> +	if (bo) {
> +		if (curs->needs_unlock)
> +			dma_resv_unlock(bo->base.resv);
> +		ttm_bo_put(bo);
> +		curs->bo = NULL;
> +	}
> +}
> +
> +/**
> + * ttm_bo_lru_cursor_fini() - Stop using a struct ttm_bo_lru_cursor
> + * and clean up any iteration it was used for.
> + * @curs: The cursor.
> + */
> +void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs)
> +{
> +	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
> +
> +	ttm_bo_lru_cursor_cleanup_bo(curs);
> +	spin_lock(lru_lock);
> +	ttm_resource_cursor_fini(&curs->res_curs);
> +	spin_unlock(lru_lock);
> +}
> +EXPORT_SYMBOL(ttm_bo_lru_cursor_fini);
> +
> +/**
> + * ttm_bo_lru_cursor_init() - Initialize a struct ttm_bo_lru_cursor
> + * @curs: The ttm_bo_lru_cursor to initialize.
> + * @man: The ttm resource_manager whose LRU lists to iterate over.
> + * @ctx: The ttm_operation_ctx to govern the locking.
> + *
> + * Initialize a struct ttm_bo_lru_cursor. Currently only trylocking
> + * or prelocked buffer objects are available as detailed by
> + * @ctx::resv and @ctx::allow_res_evict. Ticketlocking is not
> + * supported.
> + *
> + * Return: Pointer to @curs. The function does not fail.
> + */
> +struct ttm_bo_lru_cursor *
> +ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
> +		       struct ttm_resource_manager *man,
> +		       struct ttm_operation_ctx *ctx)
> +{
> +	memset(curs, 0, sizeof(*curs));
> +	ttm_resource_cursor_init(&curs->res_curs, man);
> +	curs->ctx = ctx;
> +
> +	return curs;
> +}
> +EXPORT_SYMBOL(ttm_bo_lru_cursor_init);
> +
> +static struct ttm_buffer_object *
> +ttm_bo_from_res_reserved(struct ttm_resource *res, struct ttm_bo_lru_cursor *curs)
> +{
> +	struct ttm_buffer_object *bo = res->bo;
> +
> +	if (!ttm_lru_walk_trylock(curs->ctx, bo, &curs->needs_unlock))
> +		return NULL;
> +
> +	if (!ttm_bo_get_unless_zero(bo)) {
> +		if (curs->needs_unlock)
> +			dma_resv_unlock(bo->base.resv);
> +		return NULL;
> +	}
> +
> +	curs->bo = bo;
> +	return bo;
> +}
> +
> +/**
> + * ttm_bo_lru_cursor_next() - Continue iterating a manager's LRU lists
> + * to find and lock buffer object.
> + * @curs: The cursor initialized using ttm_bo_lru_cursor_init() and
> + * ttm_bo_lru_cursor_first().
> + *
> + * Return: A pointer to a locked and reference-counted buffer object,
> + * or NULL if none could be found and looping should be terminated.
> + */
> +struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs)
> +{
> +	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
> +	struct ttm_resource *res = NULL;
> +	struct ttm_buffer_object *bo;
> +
> +	ttm_bo_lru_cursor_cleanup_bo(curs);
> +
> +	spin_lock(lru_lock);
> +	for (;;) {
> +		res = ttm_resource_manager_next(&curs->res_curs);
> +		if (!res)
> +			break;
> +
> +		bo = ttm_bo_from_res_reserved(res, curs);
> +		if (bo)
> +			break;
> +	}
> +
> +	spin_unlock(lru_lock);
> +	return res ? bo : NULL;
> +}
> +EXPORT_SYMBOL(ttm_bo_lru_cursor_next);
> +
> +/**
> + * ttm_bo_lru_cursor_first() - Start iterating a manager's LRU lists
> + * to find and lock buffer object.
> + * @curs: The cursor initialized using ttm_bo_lru_cursor_init().
> + *
> + * Return: A pointer to a locked and reference-counted buffer object,
> + * or NULL if none could be found and looping should be terminated.
> + */
> +struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs)
> +{
> +	spinlock_t *lru_lock = &curs->res_curs.man->bdev->lru_lock;
> +	struct ttm_buffer_object *bo;
> +	struct ttm_resource *res;
> +
> +	spin_lock(lru_lock);
> +	res = ttm_resource_manager_first(&curs->res_curs);
> +	if (!res) {
> +		spin_unlock(lru_lock);
> +		return NULL;
> +	}
> +
> +	bo = ttm_bo_from_res_reserved(res, curs);
> +	spin_unlock(lru_lock);
> +
> +	return bo ? bo : ttm_bo_lru_cursor_next(curs);
> +}
> +EXPORT_SYMBOL(ttm_bo_lru_cursor_first);
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 5804408815be..91ecbb64f6c8 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -465,4 +465,75 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>  int ttm_bo_populate(struct ttm_buffer_object *bo,
>  		    struct ttm_operation_ctx *ctx);
>  
> +/* Driver LRU walk helpers initially targeted for shrinking. */
> +
> +/**
> + * struct ttm_bo_lru_cursor - Iterator cursor for TTM LRU list looping
> + */
> +struct ttm_bo_lru_cursor {
> +	/** @res_curs: Embedded struct ttm_resource_cursor. */
> +	struct ttm_resource_cursor res_curs;
> +	/**
> +	 * @ctx: The struct ttm_operation_ctx used while looping.
> +	 * governs the locking mode.
> +	 */
> +	struct ttm_operation_ctx *ctx;
> +	/**
> +	 * @bo: Buffer object pointer if a buffer object is refcounted,
> +	 * NULL otherwise.
> +	 */
> +	struct ttm_buffer_object *bo;
> +	/**
> +	 * @needs_unlock: Valid iff @bo != NULL. The bo resv needs
> +	 * unlock before the next iteration or after loop exit.
> +	 */
> +	bool needs_unlock;
> +};
> +
> +void ttm_bo_lru_cursor_fini(struct ttm_bo_lru_cursor *curs);
> +
> +struct ttm_bo_lru_cursor *
> +ttm_bo_lru_cursor_init(struct ttm_bo_lru_cursor *curs,
> +		       struct ttm_resource_manager *man,
> +		       struct ttm_operation_ctx *ctx);
> +
> +struct ttm_buffer_object *ttm_bo_lru_cursor_first(struct ttm_bo_lru_cursor *curs);
> +
> +struct ttm_buffer_object *ttm_bo_lru_cursor_next(struct ttm_bo_lru_cursor *curs);
> +
> +/*
> + * Defines needed to use autocleanup (linux/cleanup.h) with struct ttm_bo_lru_cursor.
> + */
> +DEFINE_CLASS(ttm_bo_lru_cursor, struct ttm_bo_lru_cursor *,
> +	     if (_T) {ttm_bo_lru_cursor_fini(_T); },
> +	     ttm_bo_lru_cursor_init(curs, man, ctx),
> +	     struct ttm_bo_lru_cursor *curs, struct ttm_resource_manager *man,
> +	     struct ttm_operation_ctx *ctx);
> +static inline void *
> +class_ttm_bo_lru_cursor_lock_ptr(class_ttm_bo_lru_cursor_t *_T)
> +{ return *_T; }
> +
> +/**
> + * ttm_bo_lru_for_each_reserved_guarded() - Iterate over buffer objects owning
> + * resources on LRU lists.
> + * @_cursor: struct ttm_bo_lru_cursor to use for the iteration.
> + * @_man: The resource manager whose LRU lists to iterate over.
> + * @_ctx: The struct ttm_operation_context to govern the @_bo locking.
> + * @_bo: The struct ttm_buffer_object pointer pointing to the buffer object
> + * for the current iteration.
> + *
> + * Iterate over all resources of @_man and for each resource, attempt to
> + * reference and lock (using the locking mode detailed in @_ctx) the buffer
> + * object it points to. If successful, assign @_bo to the address of the
> + * buffer object and update @_cursor. The iteration is guarded in the
> + * sense that @_cursor will be initialized before looping start and cleaned
> + * up at looping termination, even if terminated prematurely by, for
> + * example a return or break statement. Exiting the loop will also unlock
> + * (if needed) and unreference @_bo.
> + */
> +#define ttm_bo_lru_for_each_reserved_guarded(_cursor, _man, _ctx, _bo)	\
> +	scoped_guard(ttm_bo_lru_cursor, _cursor, _man, _ctx)		\
> +	for ((_bo) = ttm_bo_lru_cursor_first(_cursor); (_bo);		\

Actually 1 nit.

scoped_guard()
	for()

To show the scope of the guard. RB holds though.

Matt

> +	     (_bo) = ttm_bo_lru_cursor_next(_cursor))
> +
>  #endif
> -- 
> 2.46.0
> 
