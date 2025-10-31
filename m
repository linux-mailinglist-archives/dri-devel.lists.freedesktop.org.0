Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE40C26345
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:48:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1574110E274;
	Fri, 31 Oct 2025 16:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1hlb4+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2223A10EB52;
 Fri, 31 Oct 2025 16:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761929300; x=1793465300;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QJztFBehMANDG2JRpk432BdNROOiJdw4J60XDWmyq1E=;
 b=P1hlb4+NkmzBe1NX8UxwqSzIEsUsMb1VWlRte9JtYcUWLgNU0CWsA72V
 wuJwuf60A8hD0BeuFNJP0X3bCIS2SP9t3PkDkxugnRMYL0rhclB2qgT6t
 qZ0EvgDzetRPS9H6nO0vX0MFa+KmfQwq89FJx5FTYEwrQXUtfj/B2ft8d
 EL1BMVLzhvcUaNcahuHai7pVeTsbWDacreBS9qqFzo8HG9AH0zxhKk75n
 DXwRK8YSMf06LQMtbrcvdEmo4j5DpQvm79xhcFNxeVblouGEf2K5wdblW
 JP1xr2tZun4yFv+BnxtoEdmyvEPty9+PXWknaR3Gc0FrUiBtEqIXE9dAz w==;
X-CSE-ConnectionGUID: QI53PXD3R8qVTGC9mDOtRQ==
X-CSE-MsgGUID: 98UdQ+wiTLmud2eG4BfvTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="74694205"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="74694205"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:48:19 -0700
X-CSE-ConnectionGUID: tXuSN/aPQHC//5KstJCNDA==
X-CSE-MsgGUID: an0eVNgmRSOwsny5IMe98A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="186215574"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:48:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:48:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:48:18 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:48:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6HoInFUCXs9pWXrSbxekJ90BQa2QF7lQZ1S4OdjdBVdMuioM+31IM6TFIBV1wfAK5CIsqRY4GujY43KW9xTz9AHa7l/8o/WVav1qCZUZZieVMFQ2IiTNiRt2XyxBaQVhuhEW11+/G633kDd8qSPfJ+1zUqJW2MwZFj1JYOPtMubgXqoF1R2/2NshLR4sbn/aELYIqcwiWiZEV8O8Tj2xz+8tzivS3OE6YVb8rauZyw8+4nZrx9GJSmVSGY72vtbp+n63xkDdQfr7gmzPw75/mAf6XEPc3fPphI1sYX7n1oPZ19xfqIT8r7WD94oXQxnB5rePzz8lo8Cj52tjyPKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0KxszGFCAGmWOJ1kr7a37zBRlafL437iavepCh7EG0=;
 b=Iv7ZIX7lnfumGX3TYPeFyX9d8IRPA/YXYmeicSmrWMk9/fMfetNrPmJL5jNHBscu6hgItezXoCO84Io1QBpzePL/X7wsUer7tnWWQCRoWM4O3cJBmUBPT1dUcVgfGM2ycVkPzE0FpjpkOfNc+Sjt5WPoQXKyehtmoAQ37vLymSM9F+nKWq8k/MhSrXmVXz2ym9WXyru3A5WBgpZkth7Iu366IV/pg354qru1SJbMpejpGB4oWVnqAM9D6fMVXwF+SA6SJuBzAI2uQahU5xgY7U/7GrkDZ/bAPJoYJEUThuNyHllLsFUqD2pcZHy0xGIZ2M2SDMxIs7umQc7rLNzJWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB4860.namprd11.prod.outlook.com (2603:10b6:806:11b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 16:48:11 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 16:48:10 +0000
Message-ID: <563ca804-4625-4099-87e2-5a10cccb035c@intel.com>
Date: Fri, 31 Oct 2025 17:48:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/28] drm/xe/pf: Increase PF GuC Buffer Cache size and
 use it for VF migration
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-13-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-13-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0030.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::26) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cadabc-81c5-43a8-eba5-08de189d45fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTJyemxEUklpeE9VZHY5bDM0SUlIVm5JSkJEVTU4cjBVL0dWamJJMi9zRjlj?=
 =?utf-8?B?d3hOQU5mRUcvYkpvUEpUWERrUzJLVWFjWm1Ybld4T00rM2V4dkRIYUZ5OFlT?=
 =?utf-8?B?SkVXcWZSZXJFbllIT24zSWlZU000NytwRHBqc3Y5d3ZjczhFa0NhY3lRMkhD?=
 =?utf-8?B?UWpCQ2laMmEyNGlhVngyVXNPMFN6dWF5cGZTOEY0VUt3UmlQV0tKRTFsV3pE?=
 =?utf-8?B?a0trdGJHU05MMmxTMWRlbk5OVVMzdjljVkVhMTQwNnJxbXM5RVFEOWlEeXlH?=
 =?utf-8?B?YUNtN0RZcXR6WVlCS3BGcklqTVplOGtHMVJ2WGZhWk9kZDh3NTVSWFZUcU8y?=
 =?utf-8?B?dWYyMi9tRkhUZzZ3KzMrZUUyMzIvUUJPNmw5T29xb29vd2FFblF1ZE9ud09V?=
 =?utf-8?B?SS9XOHZRTk9zM1lCVHBqa1dzNG01Y3RENUMzcjI0bVFwMEJoYXY1dDVyNlNR?=
 =?utf-8?B?dmJtWlNNMER6NHBqWHUxYkR4dE9lRmN5MG0zeTZsQjlRczljY0Z3eUNUOFpF?=
 =?utf-8?B?anZkSUprMkxTc0x6Y3l3eHhiYXdpVUpPV05tM1Y1YVQ0UExEenA1bnBhZW1h?=
 =?utf-8?B?VjRqN01zRXp3T3FWMUpIQmxvVzhDUzJnUi9ldDFPS1daVS9aTTZkUEczWlMr?=
 =?utf-8?B?akRHdkwyUy83cEJiSS9mSXlZdEtFbXNmZEdkWHkrU01JMnkydTk4TnkwVmZs?=
 =?utf-8?B?WUpLQ2kzVTN2aDlJZ1ZjellTdWtYQnphSkZFa1lRSlNHa0lhYmF5c2pwSytp?=
 =?utf-8?B?dGIrM0V5dzZ5d1UrSzFvdXZxL3lFcU05dVBZUjBLeHRSbVNSOXVvaU5vSWYy?=
 =?utf-8?B?YVphazEwNzlUQzhiZ2duQlRHb2gwS3NpQ2IyK2dSUHBXdzFJNFhQMHZLZVlv?=
 =?utf-8?B?ZWQzN1p1dHhRZVk5aXNkYTB1UTRmYndLd3pwbjZXQ1gxM2FsSkFkRk1ScEsw?=
 =?utf-8?B?SkRIZys4cVRiSFFHeXdTbVBuakxmcWtsZTlVNkNTRno3MU9ya3F2V2FRNVNv?=
 =?utf-8?B?RHV2SmtrQkZKMVJYLzZERVJLTEg5djZWRVczRXR6MmxFUTFMUE9WY3B0Q3Zm?=
 =?utf-8?B?WVNtSnUzU1VNQ1BCVnFGM04vM29vWHNHMVpPVnR2YWhiNmNVMDNXQ010S1hQ?=
 =?utf-8?B?Y29vNlhWSE4xVzdrUDlid0oyUHlSM3hwT2hBbWExNUsvdWVXK1lYSExsZnl0?=
 =?utf-8?B?QWJJU2pUQnM3VlAwV3ZmUXRia21tZHN3R2RDaUJOeFNJS20wQzUxS1dSMWlr?=
 =?utf-8?B?Z1NOeXhEaUcwNjRtODhUcUNuQ3NkTHN4UGtjSWJRSVYxbFZuY1F4UEJSOWt5?=
 =?utf-8?B?TmEwYmE1R0Q5MUlNSUJ6V1dRenpVT1kyUHdySXRiOFQwSThQcVhCNmkyKzJk?=
 =?utf-8?B?TjlybzJmREdTNUlkQmhwd3c4Wk42b2RQbGtTRldpRTZweU9CcXpxZjdiM1Nj?=
 =?utf-8?B?VTBtaE1IUFZQeTJwdUFtMHEzdFhNYlMxRStnY01mb05zL29KQzBpQ0cyV0Q3?=
 =?utf-8?B?ZmxsOGxFazhXRVlvOHVGNldXdlAzSUljZjZpMkpNK2xJS0VSWTFneWkyeGdT?=
 =?utf-8?B?Vktaek53M2U3cThJTGpIemxqQmVMSTM4L0Frd2pDOWt5VUw4d3VOWkhSZWVr?=
 =?utf-8?B?UDZjSjM0THRxUWlNMjZrdE1xWDQxZVlrSDJrT04vRmpHODFBcEFuN0ljZnNG?=
 =?utf-8?B?ZVNlbkpIckdKbi9XSDlkSDBjTTNyZ2lRaFRVTXYyUGFqNTFzWmZMK0VkazFo?=
 =?utf-8?B?UVNaMVBsYjZhZnByaWNBMUdENExwYXQ2VHZob3Bka2Y4aVY1OVpnLzRKbnp4?=
 =?utf-8?B?cmRFRmhPRkc5dll4SStiWnVsZFNGUFQ1ZXorWDV3Njc3enVpL2JnQmJLWWs4?=
 =?utf-8?B?VjhPa254MlVQU0pnU0NhTFptK0dUMnZsbTFZNkY5S0YrTlBMYzR5Tkd2RDhJ?=
 =?utf-8?B?bkVWMXpnQ3lWTllmY0VOSGZMMitaV1BoWURmLzRZdjVQQ2RvLzVmdERERlNP?=
 =?utf-8?Q?kenFgxXFc9SF2GPp5kZM7p1DQABGR0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDNseGZocnBJdFVqUlNCNktGWGcwZWRpanNMYzdpMWdHRCtoczlyMHRvWjQw?=
 =?utf-8?B?VkI0MUUrRTlrLzRWZXZ4Y3RucmNzVnlXdnRVeTVYWENBRjM1eXVhWHNEVGxh?=
 =?utf-8?B?Qk4xQm9mN2loRVJaUTBtbEtBajBvdDJDcDNvM0pYbktWQm50c1BsTE95VFVt?=
 =?utf-8?B?QnV2TVoxU1dnQ25sU3ViU0FWaVA4UFJGRldTK0kwNWl2WjRmNzdJbGM3cWll?=
 =?utf-8?B?Nm53M3l1bHNFUGJzVDVPQVpYZ2dRYkI4NG5ldWhoaFBWNEtQMGp2WGF2bjBx?=
 =?utf-8?B?aXcreWtYTWRCNVl6blNIWUZkbDZpd0tUMk9wM3Rpem83elB3Nit2eGJ4VWpT?=
 =?utf-8?B?K0JyU0dPdmRXU3UxMkt1UzdWSnVKVXJ3bys5N2tmbHovdnlDYlVhOGN2UTZR?=
 =?utf-8?B?U3BxU2I1akN6OEM5bXdob3J6Y0x1Z3R6aWJydVZIS2R2V3NzWDdnQVdqUjg5?=
 =?utf-8?B?MFBFNWJ4ZFpUTnlnZDZsZSt0eVFCd0g1OHBRT3FLN3ZFZy8zTnBjOHIzRXdY?=
 =?utf-8?B?eHRtSFFwL1VwY2lFN09CUVYzUjVBNWlBbXNQOVhIWmdmT1JodHVOR2NubG0x?=
 =?utf-8?B?K1ZVYUM5ZWRpaStGNmZ5aGNXVWZ6eUVzUVNKazdqbGRMb2pWcEExbmxOWVk4?=
 =?utf-8?B?QTdXcEhHQXZOSWpKbVF1VUc5b01RRmQ5S1VObUdIZ0hFdHExVWc3SDdPa29k?=
 =?utf-8?B?dWJpcDQ1OTIxR0dYUzQvZ3ozYnNUbUNWZHpkWkwzWmxKWTh6MktZVFlLbE5R?=
 =?utf-8?B?OWVkU3pmZjh2cjZOZGJNQk1VOENaTXZQVjFKTkpZV2hUZzVET0I1SzFObnJQ?=
 =?utf-8?B?Skd2QUpsaHZvaFI0OGZkMC9yYWFtbGtPbHU2Q0dFWWk0c09OQ3F5VWdZSmVF?=
 =?utf-8?B?d0ZPRC9zRk1RTHpESFA5V0xkc0M5UCsvaGczS0hGMzBuZXpMU2ExQ3ZFN0ls?=
 =?utf-8?B?TWpXNEpoVVRyc3Z1dXVyY1pYR0NhWEtZbmJaUk1YYTJPdTdxNWxmU2VnWll5?=
 =?utf-8?B?MHJFVnZwWWJqZUFtcms0M2hSd21sVGZXK0N1WTlXaWw1bGRaYmZWdGFhV3Nh?=
 =?utf-8?B?eFAwMlBSVWNMTE15RnUwUTZHUUtwbG9aK0VhOU4rZ3RtWG1JNk15WnpDSng3?=
 =?utf-8?B?UEN6SkF5R21GdnAwMzNxVG9rVTN4TGQydGlrV1VJMWJDcmpiY3VUQS9yTi9a?=
 =?utf-8?B?RyttcmRyYjVKZHY4aC80VnczbDdrU1NWWmxvOHBid3R1TWxtS1QyUHJiaDV3?=
 =?utf-8?B?b2JQSU1HNzV3N3VlVkxTeHl1TUhSaXN6b0NTTWE0SmRaK2ErM0VBR1FrQUJZ?=
 =?utf-8?B?NlhRYWZiZkRqc2tERWVpSUJUT0ozeHB1NWlNRmkvY2ZCQk41Wjd0N0dqVUpP?=
 =?utf-8?B?ODlsZllPdnk0Y3Q5QzZyL1hwQmJ4K3BlMHBBeXZLUWU3aVlvR3oxOXlRbmg3?=
 =?utf-8?B?Yzd4OXFBWDRHRmt5Y292aCs3WEl1WGtiQm1HQ1Q3WlFxQWxrVFRCbWdsRjJm?=
 =?utf-8?B?ci9uS1BzaEpkZEtaVzdoN3pOKzNndWsxTjdQQmxWRjNXcVlRRkNpQnBJYlJV?=
 =?utf-8?B?R0dGWU9YZDNDZUV1VEhMdUtFRlRhS2srSVpWR3NWeTR4TjNQRUpwMndMRU1y?=
 =?utf-8?B?cVlad2xyUGlHSHJlVTZQd2E2U3F6TnR5MW0yRTdXS0pXMCtJdVQyRE9kVHI4?=
 =?utf-8?B?STBwbTNyVi9MNS81VEgyVm95TlJ1SDVJVmlaRkFUV3NmNzFvRlJNeDN3emtC?=
 =?utf-8?B?N0xKdHJmdGFqOHlibUNiQjhyb2tLbGtramgzcWtmQ01JVGJWSkl6OXBPWXY0?=
 =?utf-8?B?R1dETXZiNTJWN3ZLUGdVTmpRbS9LZmZOQlB3OE12MUJXd0lNMHVab1ZqVlFU?=
 =?utf-8?B?OVk2cUVkQWlDblFQZ1JwVzRBS0hOeU1zb20wUWVHZ2xLUFBVK0d5VVRUaGxa?=
 =?utf-8?B?bTBaM25lVUhYbHhiOUZRamF0bHVsKzZBRlA5U2RQY3ErS3ZMQ0RrZHJZSlRv?=
 =?utf-8?B?cWMwQXRjZkUvcC9hY0xMRFZNbU1mL0JoWEdFU2NMblJDaTVwbW5abFhsbjhC?=
 =?utf-8?B?OHJScUVzRWpHQ1Z5MHIxN3R6Ykx1ajBMOWRCSTM4OVRvQWIya1lrd3ZDZUFz?=
 =?utf-8?B?d3dxeFN6UFFqUWMrQzJwRkZNZElxVFl5czhlcU9qUkZVdnYyaTE0UENLK09J?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cadabc-81c5-43a8-eba5-08de189d45fc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:48:09.9546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyOChhxV7kOPi7QQeAO1r5HrEI9K7Ou1JvGu/RvDUI6cmTRbP/GumQ8p7Byi33pF2zP8jhkpDJcllpMAK7GHniA2F7kU5cnkx5MwQEnbpfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4860
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



On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> Contiguous PF GGTT VMAs can be scarce after creating VFs.
> Increase the GuC buffer cache size to 8M for PF so that we can fit GuC
> migration data (which currently maxes out at just under 4M) and use the
> cache instead of allocating fresh BOs.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 46 ++++++-------------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  3 ++
>  drivers/gpu/drm/xe/xe_guc.c                   | 12 ++++-
>  3 files changed, 28 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 30f0e51da49ae..a2db127982638 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -11,7 +11,7 @@
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_printk.h"
> -#include "xe_guc.h"
> +#include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_migration_data.h"
> @@ -57,73 +57,55 @@ static int pf_send_guc_query_vf_state_size(struct xe_gt *gt, unsigned int vfid)
>  
>  /* Return: number of state dwords saved or a negative error code on failure */
>  static int pf_send_guc_save_vf_state(struct xe_gt *gt, unsigned int vfid,
> -				     void *buff, size_t size)
> +				     void *dst, size_t size)
>  {
>  	const int ndwords = size / sizeof(u32);
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_bo *bo;
> +	CLASS(xe_guc_buf, buf)(&guc->buf, ndwords);
>  	int ret;
>  
>  	xe_gt_assert(gt, size % sizeof(u32) == 0);
>  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
>  
> -	bo = xe_bo_create_pin_map_novm(xe, tile,
> -				       ALIGN(size, PAGE_SIZE),
> -				       ttm_bo_type_kernel,
> -				       XE_BO_FLAG_SYSTEM |
> -				       XE_BO_FLAG_GGTT |
> -				       XE_BO_FLAG_GGTT_INVALIDATE, false);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
> +

nit: I would still add the comment that this to WA some known FW limitation

> +	memset(xe_guc_buf_cpu_ptr(buf), 0, size);
>  
>  	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_SAVE,
> -					 xe_bo_ggtt_addr(bo), ndwords);
> +					 xe_guc_buf_flush(buf), ndwords);
>  	if (!ret)
>  		ret = -ENODATA;
>  	else if (ret > ndwords)
>  		ret = -EPROTO;
>  	else if (ret > 0)
> -		xe_map_memcpy_from(xe, buff, &bo->vmap, 0, ret * sizeof(u32));
> +		memcpy(dst, xe_guc_buf_sync_read(buf), ret * sizeof(u32));
>  
> -	xe_bo_unpin_map_no_vm(bo);
>  	return ret;
>  }
>  
>  /* Return: number of state dwords restored or a negative error code on failure */
>  static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
> -					const void *buff, size_t size)
> +					const void *src, size_t size)
>  {
>  	const int ndwords = size / sizeof(u32);
> -	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_bo *bo;
> +	CLASS(xe_guc_buf_from_data, buf)(&guc->buf, src, size);
>  	int ret;
>  
>  	xe_gt_assert(gt, size % sizeof(u32) == 0);
>  	xe_gt_assert(gt, size == ndwords * sizeof(u32));
>  
> -	bo = xe_bo_create_pin_map_novm(xe, tile,
> -				       ALIGN(size, PAGE_SIZE),
> -				       ttm_bo_type_kernel,
> -				       XE_BO_FLAG_SYSTEM |
> -				       XE_BO_FLAG_GGTT |
> -				       XE_BO_FLAG_GGTT_INVALIDATE, false);
> -	if (IS_ERR(bo))
> -		return PTR_ERR(bo);
> -
> -	xe_map_memcpy_to(xe, &bo->vmap, 0, buff, size);
> +	if (!xe_guc_buf_is_valid(buf))
> +		return -ENOBUFS;
>  
>  	ret = guc_action_vf_save_restore(guc, vfid, GUC_PF_OPCODE_VF_RESTORE,
> -					 xe_bo_ggtt_addr(bo), ndwords);
> +					 xe_guc_buf_flush(buf), ndwords);
>  	if (!ret)
>  		ret = -ENODATA;
>  	else if (ret > ndwords)
>  		ret = -EPROTO;
>  
> -	xe_bo_unpin_map_no_vm(bo);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index e2d41750f863c..4f2f2783339c3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -11,6 +11,9 @@
>  struct xe_gt;
>  struct xe_sriov_migration_data;
>  
> +/* TODO: get this information by querying GuC in the future */
> +#define XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE SZ_8M
> +
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ecc3e091b89e6..badae9a26220e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -24,6 +24,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_throttle.h"
> +#include "xe_gt_sriov_pf_migration.h"
>  #include "xe_guc_ads.h"
>  #include "xe_guc_buf.h"
>  #include "xe_guc_capture.h"
> @@ -40,6 +41,7 @@
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_uc.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wa.h"
> @@ -821,6 +823,14 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>  	return 0;
>  }
>  
> +static u32 guc_additional_cache_size(struct xe_device *xe)
> +{
> +	if (IS_SRIOV_PF(xe) && xe_sriov_pf_migration_supported(xe))
> +		return XE_GT_SRIOV_PF_MIGRATION_GUC_DATA_MAX_SIZE;
> +	else
> +		return 0; /* Fallback to default size */
> +}
> +
>  /**
>   * xe_guc_init_post_hwconfig - initialize GuC post hwconfig load
>   * @guc: The GuC object
> @@ -860,7 +870,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>  	if (ret)
>  		return ret;
>  
> -	ret = xe_guc_buf_cache_init(&guc->buf);
> +	ret = xe_guc_buf_cache_init_with_size(&guc->buf, guc_additional_cache_size(guc_to_xe(guc)));

nit: quite long line ... either split, or choose shorter name for the helper
>  	if (ret)
>  		return ret;
>  

just nits, otherwise LGTM,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

