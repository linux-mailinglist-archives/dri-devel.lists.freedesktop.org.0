Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELeID1pWqWli5gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:09:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76220F6DF
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63E910EBEE;
	Thu,  5 Mar 2026 10:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K6gHhqjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9A210EBED;
 Thu,  5 Mar 2026 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772705365; x=1804241365;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FRNPJDTkoWrXVh/nut8dBZKWYoUwg5KQgZtzit88ivQ=;
 b=K6gHhqjoiWPT53mTc6vwK8CD1AfE+N56PxXDQWGeFQJ44/zqBg3hNmH2
 Awr+mBVLnC7Cg2356ZxMsmATuLnNsffAU9UjWFJtqEbnFCip1XtrgauZF
 pjpDFZFxKtoylWT2u/0YAMlsx0vmxXrP9gaJufP/50upFo1Bu/+cPfe+i
 8EO5iT5Ue1StriYg8mTJpJMNhndq7YT31N4panc0eRnT52Ytkq/F735LW
 gHmfU3fDrbQS/JZcfroK+IN+aFnQfOgxQ5oSxm8kvX89KLNT+xjPD/nl8
 LjDTENGvpayPr1jDPb5wESPdR1FKIIxNCK2q0Ogv2IVdD6DrGIHNcNVW9 w==;
X-CSE-ConnectionGUID: IXLeLIoJQaC38TB8lgYhGg==
X-CSE-MsgGUID: xB7NJIeYRj6sUjIEE9Ov+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77633351"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="77633351"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:09:24 -0800
X-CSE-ConnectionGUID: WUFyZFX8QLeHF71zMMnpTQ==
X-CSE-MsgGUID: 4CZ2CSn4T66eDztlLN59qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="218640397"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:09:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 02:09:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 02:09:22 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 02:09:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BV0UMrBTbhRsenf3VquxdWMGiDm+JzdfaObsR9L8mzOCH6QS2vBBue6bEoizkUjnH68QbEQYhg9IftukAgE3RNLrjCxhua3R4r//+Arr1xEl1U5qOl8xINFuSjxPzRwdRBOUAFuz2xZzX/AJqYpZ9vWcTl0ugLHH3Z3YpFDx0cpGZqnDg9tNl5dj6cFbwyGJsn2+J8i4Z20RCDvyAFXJOVta5cX9+9DVXb3x4oomBkkDytQzh84oLFVu2A6Xa41j64XT4ObPn8l5fH0dQnl+4stkaq2XxOFDwrYHks2zzsUqRwq4FpkcxbS51SE/O88BjIHxSHxkD5h92tiNogdVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpbTldBJl5aq8/DM5/ZEETSjCFKAp4D9+uy/4/7b5X4=;
 b=VVu/LPRtqpxhy4lKCzAkBnJ67LJ+6bUjSJ559ests+1olsUbdsB3dsKKNUwpVOoEZs7SN74i6FajnK1/n0d4zR5/KIRFoqzyxbGNZc8DH+RR6mB9ZhsV+dNt2usRgC9ZqVrFf/FBE3r6rbRxASkWrAb8Pv4FjVeXwnfxoCVpjBDd10WJWhW487ppoJPQR5ZiVkJKicX1SXr6C9NhJh6SXRkW2aNMS90kNr9V1rY/Rfz3fJAUce7nLqRFULjChIAvLOl+fBSLADqwHjvsUjXYTb/OpxuvQ026jaBc412JxRfROodEZIrcl+tgzmVzEVLVfo4rJJ4mBLZ4qo084xFhFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7466.namprd11.prod.outlook.com (2603:10b6:806:34c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 10:09:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 10:09:19 +0000
Date: Thu, 5 Mar 2026 02:09:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Chia-I Wu <olvaffe@gmail.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Steven
 Price" <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, Christian
 =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>,
 <tj@kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Message-ID: <aalWTOZSNYcKpvdd@lstrano-desk.jf.intel.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
 <aajkqXZDGUFPlq1o@lstrano-desk.jf.intel.com>
 <20260305092711.20069ca1@fedora>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305092711.20069ca1@fedora>
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 760a7b2a-743f-415c-b853-08de7a9f440a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: GRdjmZ0s/WtS62Rfr8LBfZFNXqNvPlS7PSDhSW22v1gKTPa+pditWUNXFpIVVzqQ6iYf3gv5qwvyBkK/aiHg+AY8anGyt017erVxLFW5pX+K8NrhY9q00c4WFIUZKKxdrCB9DLb/P6Nmk8bL3oRWr2VnXYcvjAGhxEcC3TZJk+yNHteUOvYmAQuJZiXYtDCiT6iJrjJpt/b4dL8qj2MwkvoFnr18hM3oBWOJPJkMIeflTE7xL6m6Ri6G8HPwL0BFAgC7VApUJOUOsBitULQu1NiAylw7e8Z7HP/t4gX1QVuR5Wub/F/eCAu3kuPWdmWT2UNJ5M+hffw1sBHsOSv//4w6p+EB+SlGubqKp72xo9pv5G/vOGohOV54jHwsN9KINtk9spqziUHxAUsS2lWdHuR1sVg0J6miAw0b8CP5pUwL1HV93u45qrmgElWAqiXwEV57t6HIO4nyPJBH/seSWjSJ8GdcxMogdZ03Oev1n7ass+Ioa5Gp3SdrcVkUJWZgZG7y2Lfd1NRYZ+9RKjAzaPtjTwSiU/2Anj3LJLvc2iAUKmcTcP2wXEiH3WYb3U8XA6rcTDEBk2QmQ/d4ksab7hiz6eQJshbkXT9J6ZkJyAMuBwnH7UWynEQ7DZmnfp7H54lFBTwfOZla1i31iP6foFScxFlmFMpMXHCJO3SSaAR/H5mvYnWRCE+wSM6cWdWPFeSKCCDlmsZG/6MRRcr0DgWX7XQBbxr6VCJ616SC4js=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDdBbDdyamM1Wnh2UE1tM0tPb3VjKzJQREl6WmhOWnlVQXVEMzk5N29OM2JO?=
 =?utf-8?B?eUFjSExYSlZNWlNzTDV6N3FFVEppSnZRSllrVHlSVXJvS0JJdEw1SDZGOTE5?=
 =?utf-8?B?Vk1jck1rTnZPTHFjRGhsVXgzdElQdkVjTHUrVGxWaTBZLzh0aDFrOTl5MG5n?=
 =?utf-8?B?WWxBQXVYelBBNEZuSlVObTMvV2lnWW1FQmtiSmw3UjJ3SGwrWTN1QnNScWhj?=
 =?utf-8?B?MGNGN1k1aEFNcTZiSW16cDRjU3h6SHhEbmZ5MkJKN2hyVk9RWjYrNzUzcUlJ?=
 =?utf-8?B?cjYrdGdUSnJRVDBMVHpTcm1qYk1YZTZPNFpPOFFheXZSTXphQ3dPdVZBWkN4?=
 =?utf-8?B?dUxFY2dXSHFIVVRpRkZ5Wm9XQmlOREVLQ2ZhVm1KUW1zY1grQ3pzaUExVTUx?=
 =?utf-8?B?dzhlWlF6OEpJODNuVm5lajA1SEtjZU55UGdLdlFoNVdzRGE0WEx3QkcwdmZ0?=
 =?utf-8?B?em05U3g1WU1DcTVxTEtNVm1GQVRCaVlvMC9kbDFuYVdGemZBc1lHZThYUW0y?=
 =?utf-8?B?L0srQlJtOG9yS3B5dlpraUphVTZRbk9vRjMrMDE0K3ljYk40bjZwVDNCdGxt?=
 =?utf-8?B?K3JLYlZSenNlNy9ndWorQTgydFVRVkluK2NrdjNnSlJyTzBQem03S0U4eGNW?=
 =?utf-8?B?dXQrRUQxeDFaYkNZRmZIaG53cVRNa3hzM3IwSDBtRG4wVlNzWmp0ZElsa0hB?=
 =?utf-8?B?Rjl3V2Q3WjBMK0lRUGROdVRBanlyZkg3TTN2K2J0S201WWFCbTVHcXRUWExR?=
 =?utf-8?B?YXVtQWdNbmFRWW1aWFdEUGJYeEluOVZoM2N0RmcrcWI5czRwMXBGRnVCTGxo?=
 =?utf-8?B?OWJySkg5U0toMHB6ZzFtN2NCQnl5aENtSURFcU1oT2dMbnZjZjN3dFpRcmFR?=
 =?utf-8?B?UEtrVDg3Tms4bnYyaUduZThvSDIxWGF0ZmlOb2pvUVFacW5vcm0zbENHQnc3?=
 =?utf-8?B?M2Z5Y2JGcldPelBzSFJRa3h5YjdwNUJaNnl0YlRmNU45UVpEdmVuYnFiY016?=
 =?utf-8?B?WFMzTmlZVkhSQ1haTDVOVjZRb0hGanZvUW8xUGJaT3AvUHIzN1g5TUQrS1dh?=
 =?utf-8?B?a29zVmE0dnNWM1JENkZ0aVRDRzhUSGgrc1lvb3crQ2RIb015c3BQcWl6U3Ry?=
 =?utf-8?B?eG1wdFhZWnZsYklmbU9OOVhKN1dkaHVIdU5HSVJodis3WUxUUDRwM21sMm04?=
 =?utf-8?B?bTJJcmw2T0pNWmZGbThOdFREZjNYdW44Z3BJVFRmT1lRcW1pY08vT2ZzOFFM?=
 =?utf-8?B?eUpQZFlTNVBGaXpBcmN4WHFsckYzc1ZtWExSbmg5ZWQ2ZWRZT0YzNFdhNGZv?=
 =?utf-8?B?VkdET3AxWDdEVTBiQzVtcllkUGVYRVdDMkV6eXRjRGF6TVg5WTczT2JFYVh6?=
 =?utf-8?B?ajlVYXlSVGNveVE4ajcwcStxQVNqblJqTEJtMXZ1YXNZTEFzSllCQlo4MXRh?=
 =?utf-8?B?VkduWll2QURyamE5MHpZdmxzNFZ2M29HbjdlZnQwN1JTK2lta21teG5VUnFq?=
 =?utf-8?B?SW5aVnhtYTBITWlkTzhibHVucEt6VE9LWW5YM1NLaTlIb2oyd0tZTlpZSFlu?=
 =?utf-8?B?RFBRaXVneWNnRkpEMFZyRHhSUmI2SG5CM3VkSzZRaFNlQUhqK282YkpxZUNW?=
 =?utf-8?B?OHpWUmR6UzhoK3cvWFdWb24rc2Nzb1ZtQXloOWJZODNITlJyRUM5UnJoWE5Z?=
 =?utf-8?B?dkNoNjNoUnhNTXVRNnBMT0NwcWFzNmdzbWM4SHdiSnJrZUxnNUZZT24rRnNN?=
 =?utf-8?B?SURUQ0RvaDA3bkhxT05nSXpZSG5rU05kL0drenFWek9SN1lvajRiZitLTFRr?=
 =?utf-8?B?d1MwZE4xZTNQVW9NL1NlcGNkbmcxZXIrVzYxSzdkTTQyL3ZBdlR3bHI2ejRq?=
 =?utf-8?B?YXV0NFo3SkF3QUtHSktvQlU0SzlRaUN3b3Q5TjhlRDhuSVJBSWlIZGF2cnpZ?=
 =?utf-8?B?MjZPWVp0QlFkdlpOemh3enUrenF2TW83aXR4cnplZDNQZDBLVnhIbFBQZnRC?=
 =?utf-8?B?NEZXZkxJSlJ5ZkF3bGMxaHdaRWRWR01oSGJhUlBNL2JLZzhzTXo0WWdLek90?=
 =?utf-8?B?YVBtZDRJL3A1eE53SVFKYTdFa0dLSWpFRi9maytMa1BBOE5Kek03TlF0R3JY?=
 =?utf-8?B?L2k3UlZ0Vzd0M3BTRC90cXZLMi9UMzBRS1BTUDA4SkxJVHY0UjQ3SjdEUXFy?=
 =?utf-8?B?YlRRWllCNlcrRnV6NFB2WGpkT3JUTVBtdEJWYmp0ZEpsVlVJZHlwaUpjTm1R?=
 =?utf-8?B?bjlkN0JWM2RSTnZEQ2pnTXRlZkkxWFhqMWhGNEhFLzVqMGd0aXRCbnR1aUJ3?=
 =?utf-8?B?RVN1RUxHZkFndXFxMjkxS0Zld0lTcGpRYklaS3pNK3dFYi9zc0RDTlluNENp?=
 =?utf-8?Q?vRzbzHwd1smA6Je8=3D?=
X-Exchange-RoutingPolicyChecked: ii4R+sG4pdH5++p7Uitk8iJe5t92usXxjPdFpoldzv2IiDYgcKJ6Ac4h4OThj57T5G2X/NUnTAaC54UqFPfFThNRbfZ7TLgSRQHnqQlbPjdJd093dQlt73IYKd4FCPA9hKJmLFta5qAEXC442NmBjk8DzmqEdyLGqfcsfQ5tzz84XCT97lvLhEuk0o5To0w0dl8HiwlNJWrwpDyxmz0VJ4jSI0/9tAxGPCxNxnLwc0oT+D9WJxrTAdQ1xPRJMPsHE6TT92WMEr69sEi/w7b/Fh2ofU58E2bWgYjxF3nfwbRlx7U56ezzKME2guKWCiOAi5QYKRSoDsRkdlrx7IWGNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 760a7b2a-743f-415c-b853-08de7a9f440a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 10:09:19.4404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7lDsv/3Jd8y8NLLHSztnr7p2BuMuB2SIpJFHz9+NUrzwFN0xaAAErGnivksy9FEA8BWM1f9Fh/nMCPUru+h+hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7466
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
X-Rspamd-Queue-Id: 8A76220F6DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,arm.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,intel.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 09:27:11AM +0100, Boris Brezillon wrote:

I addressed most of your comments in a chained reply to Phillip, but I
guess he dropped some of your email and thus missed those. Responding
below.

> Hi Matthew,
> 
> On Wed, 4 Mar 2026 18:04:25 -0800
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> > > Hi,
> > > 
> > > Our system compositor (surfaceflinger on android) submits gpu jobs
> > > from a SCHED_FIFO thread to an RT gpu queue. However, because
> > > workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> > > to run_job can sometimes cause frame misses. We are seeing this on
> > > panthor and xe, but the issue should be common to all drm_sched users.
> > >   
> > 
> > I'm going to assume that since this is a compositor, you do not pass
> > input dependencies to the page-flip job. Is that correct?
> > 
> > If so, I believe we could fairly easily build an opt-in DRM sched path
> > that directly calls run_job in the exec IOCTL context (I assume this is
> > SCHED_FIFO) if the job has no dependencies.
> 
> I guess by ::run_job() you mean something slightly more involved that
> checks if:
> 
> - other jobs are pending
> - enough credits (AKA ringbuf space) is available
> - and probably other stuff I forgot about
> 
> > 
> > This would likely break some of Xe’s submission-backend assumptions
> > around mutual exclusion and ordering based on the workqueue, but that
> > seems workable. I don’t know how the Panthor code is structured or
> > whether they have similar issues.
> 
> Honestly, I'm not thrilled by this fast-path/call-run_job-directly idea
> you're describing. There's just so many things we can forget that would
> lead to races/ordering issues that will end up being hard to trigger and
> debug. Besides, it doesn't solve the problem where your gfx pipeline is
> fully stuffed and the kernel has to dequeue things asynchronously. I do
> believe we want RT-prio support in that case too.
> 

My understanding of SurfaceFlinger is that it never waits on input
dependencies from rendering applications, since those may not signal in
time for a page flip. Because of that, you can’t have the job(s) that
draw to the screen accept input dependencies. Maybe I have that
wrong—but I've spoken to the Google team several times about issues with
SurfaceFlinger, and that was my takeaway.

So I don't think the kernel should ever have to dequeue things
asynchronously, at least for SurfaceFlinger. If there is another RT use
case that requires input dependencies plus the kernel dequeuing things
asynchronously, I agree this wouldn’t help—but my suggestion also isn’t
mutually exclusive with other RT rework either.

> > 
> > I can try to hack together a quick PoC to see what this would look like
> > and give you something to test.
> > 
> > > Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> > > meet future android requirements). It seems either workqueue needs to
> > > gain RT support, or drm_sched needs to support kthread_worker.  
> > 
> > +Tejun to see if RT workqueue is in the plans.
> 
> Dunno how feasible that is, but that would be my preferred option.
> 
> > 
> > > 
> > > I know drm_sched switched from kthread_worker to workqueue for better
> > > scaling when xe was introduced. But if drm_sched can support either
> > > workqueue or kthread_worker during drm_sched_init, drivers can
> > > selectively use kthread_worker only for RT gpu queues. And because
> > > drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
> > > scaling issues.
> > >   
> > 
> > I don’t think having two paths will ever be acceptable, nor do I think
> > supporting a kthread would be all that easy. For example, in Xe we queue
> > additional work items outside of the scheduler on the queue for ordering
> > reasons — we’d have to move all of that code down into DRM sched or
> > completely redesign our submission model to avoid this. I’m not sure if
> > other drivers also do this, but it is allowed.
> 
> Panthor doesn't rely on the serialization provided by the single-thread
> workqueue, Panfrost might rely on it though (I don't remember). I agree
> that maintaining a thread and workqueue based scheduling is not ideal
> though.
> 
> > 
> > > Thoughts? Or perhaps this becomes less of an issue if all drm_sched
> > > users have concrete plans for userspace submissions..  
> > 
> > Maybe some day....
> 
> I've yet to see a solution where no dma_fence-based signalization is
> involved in graphics workloads though (IIRC, Arm's solution still
> needs the kernel for that). Until that happens, we'll still need the
> kernel to signal fences asynchronously when the job is done, which I
> suspect will cause the same kind of latency issue...
> 

I don't think that is the problem here. Doesn’t the job that draws the
frame actually draw it, or does the display wait on the draw job’s fence
to signal and then do something else? (Sorry—I know next to nothing
about display.) Either way, fences should be signaled in IRQ handlers,
which presumably don’t have the same latency issues as workqueues, but I
could be mistaken.

Matt

> Regards,
> 
> Boris
