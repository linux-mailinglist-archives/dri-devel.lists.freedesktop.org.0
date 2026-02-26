Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBsRLvWWoGkVlAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:54:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AF81AE0B4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 19:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B005610E9B9;
	Thu, 26 Feb 2026 18:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YkbJd2d2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C804010E98F;
 Thu, 26 Feb 2026 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772132080; x=1803668080;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SvCiZKEt+11wPa8MQ13JxI5hN4bmGs6beUATBhR8KF4=;
 b=YkbJd2d2uOIdOYtsWTeKcyypYCk15Al1sKbC3qPojSbEpqpA4VQTPiWz
 mvG2J6I56b74ejFqzL0J/4wXeelPE16p5KEZs2MtuLT98EikXi5KXdmTk
 Eb6OfY5zbNc/k1EFt+e3NLZPoma5ZIE57iPBFqRWsGqMommK488HaSwoq
 o1NbRDMqUIbxKxvSE/4UlH4rszL01hxX9yAdjCVwZbGidulfiieJtq5y4
 t6g9V+pRTgc1AAWrugx70LnXUPi0OHO88FRXDyHkJ43xxWDyRW35kJZty
 c1I6baQV02YlmNThFBxjH3ZdK1oGzdY25UQ4NC3r4STA61jCjktEd8Iou Q==;
X-CSE-ConnectionGUID: GW+r6XhqT2yjrdAFbbyjzQ==
X-CSE-MsgGUID: IApTeo27Tfyl1q5wtUd9Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="77041665"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="77041665"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 10:54:40 -0800
X-CSE-ConnectionGUID: YUrKKeWVQ/yFlgq04nIMPw==
X-CSE-MsgGUID: 39sKxELiTEG0y46YKH3egA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="247179261"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 10:54:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 10:54:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 10:54:39 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 10:54:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qlnuPLmv6jxvtxHSFIYB4Hn/l0L7sjmI7N6D76keffGexec2twlgDiqO0+saLnVTrEJDbgPaReHHLjbsvFyET41oIe/FYycC5JS5eEvLDxVfRoPw23cRQWFgHznO2cL2tTI3491i+QP46ethIm1zRyqSCg+HyDvMq/BFuxRXHZPWzIO2Jrqq7mPQsLQ5oOCJoe/+tfyGv+Tvn+lbyizoKYiuhnnzhUPsDMbL6jAniqI95jmQi6N9XXDYjQjq6pcQ3ppTbUA9hqm9tTrg+USwYHRNhDw4EpCkxX/ju9Xx84kcF36Lf5yyZN2/7YLdVHzYAK5qstB5QJTfN/XtqdP5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9pYctGVfmPCQ5cH+p+YcwQKq8I9Z6mLoSK7lKAyuvI=;
 b=dpyePDlG+lRUaYNvONcg12aknQ6hQbmRt1oUqwERCukulVwOL1xVNJvEI+zCTVtENEnZ2WXnNC+nDnvftIoG92pHrkag+MlD3wXEl33A0dA+7e6SKUT84a4leW4nKTniUJDUEYHCP61lu3P5nWRQN/Za9Y8m3YATqZKaqX1auIiwfMuLxmtNJ94kGdrsf9zCOmplDsIF6DVgrl3ho8hdaLTaaZYboHcX81vQMsK3ruHiP4hQGh4qkjsxSyJlYR+nuLHE8m0XcOy8CvtRaLd29qNOXY76TzU3YOliSeOlLiq1Q9hKpvKvJ4JvX7VeGCRvBhf4deXLYCeje+cnG5RTsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB6398.namprd11.prod.outlook.com (2603:10b6:8:c9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Thu, 26 Feb 2026 18:54:35 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 18:54:35 +0000
Date: Thu, 26 Feb 2026 10:54:31 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Piotr
 =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>, Thomas
 =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, "Dunajski
 Bartosz" <bartosz.dunajski@intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC v4 1/1] drm/xe/pf: Restrict device query responses in
 admin-only PF mode
Message-ID: <aaCW59fWwXcskx6n@lstrano-desk.jf.intel.com>
References: <20260226163104.3192618-3-satyanarayana.k.v.p@intel.com>
 <20260226163104.3192618-4-satyanarayana.k.v.p@intel.com>
 <aaCVXnUYdsQwlSx1@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaCVXnUYdsQwlSx1@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB6398:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fae56a0-2e7b-42fa-f596-08de75687c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: D+DGVoMYTmZZ6H8Ks7FvPtZO8+OhpS4ddM1CA0Ksc03YOI0n/FrhnrAPvIWOLa+4lyy2ZjT5WkZkpnwO68+EzGMthK1crl54fa1nHP4SOPAKQrs5wwbtTOhmjX7XJZBr0rTWTRu5hU38qg913wZOlimjBJsDeQk0vd/hzmBJcEpHUAJS/zL0fe0eQX1/O/DodVaz6jY/FzlJBRwY85VAC6lyUjQ7/c9egLTcR866ijP9TlyY9fEoRrMcoRcfWD7iMwc3Xq3NOdPXcLq5o+8m5x/Tcdid0/qRRPn1h38StylA1wTwyuvQ5bFKNye9dxxA+1b+vjKuWIlt+dID2i3Ro9i5jUr2xQhyuuqU9QwRaX5bz/ANkIjLGzFglFE3LP8scp2UMrtxQG+A7FAU+X1C4YfwI8W2c/pic4gzuzphKgGqvIR/5jZk1RUhVGKXojcVysnvWKov82DsZXUli8GCSDif8WyJCh+IStzqiBEb4DjAFfM/ob/rMwr09+F7YN9YDE/XXqGUVvtZdBYy14EYsMnuQFerKmJD8Cxi7L8gLtnEcw7iU5+grCjYVO4IMx+alQwcLTaThdzng1TSGy3aAk2gHsD43dJmhJKvDYQLAShZF61ecHxF3/GvQ8JSMiKPRp7Ey9MdeCCwvMXOc3RLehUfaF2fpWh6VUXHdw55jW5Yk2hs9ZsnfxwWA2dCfL3+npXH9lRaWdO7Jj7feGyZOTnwfRwRigLc/E3lX00JywE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzI5N1FkYkFra1ZKY3RzaU1wR2FNR0wxdDNUOXcvRDMwZUNUZEMwS0VXTjIv?=
 =?utf-8?B?VkVqVHArYzkzM0dUTWNINVNQMmlPaVB6aEpPVkJjSjdsc291OUF5TExFam5P?=
 =?utf-8?B?RFhzck00SUZOdUw5aGc2N1ZQdEQvaWwyOXJKUXl6TTRjaTlVY3hFVnZWUUdo?=
 =?utf-8?B?TUhSTGF3QnhaSjdOYW9YL29pNFc3Vk9xTTBDN2FvT0dIKzRGMG12N3RFdEZ3?=
 =?utf-8?B?NEY5UTZuYS9GMlJNTTNMcldQMFVnUHFGVlF5ZUE0cVd0QkZZcFQrZ2RsNUsr?=
 =?utf-8?B?d1RaTkY2NmNJVUJoZTVWdUhuYmZURXFDbnJteWNweFA0NDhoK3pXL2RwS01F?=
 =?utf-8?B?NjZ2SUhyN2hHYlRGZ3RWUW9OVElEdFRCNzFUYUNLOS96UnRZcm1nS3NCbnFK?=
 =?utf-8?B?YkhxNTBvdWpUSnVSNGd4Um9ERTJteUZDT3dUQ1dsOHNFM01GeFlJTkp6V3ZJ?=
 =?utf-8?B?VTJVTjYyRTVSUzQ2dlNCWlVKSENud0k0WUxnNWdQSUNyZFEvb29mYlhsUDA2?=
 =?utf-8?B?dXRzOTFFU3VhMDBwdS9EWlNvdFpnS0NDNmZuaTlzbXBxaC9hLzgvSU5vd1VZ?=
 =?utf-8?B?bWdRVUdFL3VJNGpUTC9MVmlURmlOZ1lxcXVLOHZLRStudzBNQ0VCSW5nMVBP?=
 =?utf-8?B?Y25tWEErWXYwZ1NpT2J2T24rVHVRc3hXV3AydXROaDdnc2E2M1BFMFFQejJW?=
 =?utf-8?B?Rm1TQ3NGU045b2d2THNJSktMV2J2TGY5SmpFSlhxQmFFQXhlTHNlSDI5Wm1O?=
 =?utf-8?B?bVQyeElDUm1uYTVJcHc4VFM3N2didVhMQSt5MDhJWWR4cDgwVHB3TzllNEtB?=
 =?utf-8?B?Tm0rZlVScHZiSXZVNDFZSlNkMENlLzc2NGlzK0hlUlBLMGw3Q2VDcHlXVjNn?=
 =?utf-8?B?ejZlTUQ0blhUZGFJNGpQWnBhUmc4cTY2Mk1haHJpREVlcHlqQU1VeG5WWWZo?=
 =?utf-8?B?M2tIQzJQTXFoMGhYS2gxNmxRSmYxem5TeTNnTk5yNGtWL0RiMGF6Tytza2NS?=
 =?utf-8?B?QjJPVXZZQk9nc3dTMjloMjhzNVFrVU1HejV3TVJNNVJGZWljNm1KWWtCcXYr?=
 =?utf-8?B?VGhvU2JCc1ltSUZxQ3d0VURZa2hKNzRnU0E5aDVHMk94QVF3Q3FldGtUU1JO?=
 =?utf-8?B?aHlNdGpNbEttVjZXRlk1Qmk5RFBubTZ2dFpPOHg4bHYvbHphYndvZyt5cE1C?=
 =?utf-8?B?by9UUk80ak1MYzc5QjM3NTFLL3dSRitET1pMbVVkWENzRlF0WWdVTjU5bUVm?=
 =?utf-8?B?bWVCa0JHMFhQRUpnbkN0eCtUVE50ejl4TlR0TWttak1sc0VkTlZ6c0RiUUI3?=
 =?utf-8?B?ZmRIekdwZXlQdVUvSVZJQk9KQ1E0dzNpMlJ1WVBJcnN0WVgvSTJmeUVyOW9B?=
 =?utf-8?B?bjFNNnYxbzNYdlRLLytlOXVwZTdVb1d6RzZ2UEN1eXkxRW4xcmFBWW9EbURJ?=
 =?utf-8?B?SFJsVVJxMzZsWlNEbmtHV1lhTUgxOEVMWStwaWZ4R1duSThCNnJMY2NaSE1l?=
 =?utf-8?B?cjFlQWduaXlSZFE4NG53RmhEZEdqc0t1ZTJYR3dtRmhrTGpxQ09DS2o5Y1pZ?=
 =?utf-8?B?NlY1WS9RTU9GMnZWM0ZSd0RaQmJnSHFJdHNBUFdoM0RGa0xnajNqQ2MzK29r?=
 =?utf-8?B?UFliOU82T2Z2blNOM2tNTGtZclhqTk5sQURqZnV5ekJtTFNrb0F4cXlIZ3M5?=
 =?utf-8?B?NTMyTUVubml6YWMxY1RRSlAzTjFZckFYSEJIaGc1U1U0M0hnenhUNExJSjJL?=
 =?utf-8?B?N3k2UENDUGtBWEpOVVVYYm9Qb1hmakJ5TlRzWDdqUGF4YUxpdi9iYXFYNU1a?=
 =?utf-8?B?ZUdNK0g2VHZsbG9qSlIzWVJhNGxKa0lYckU4eEtRbGNuV3E3WEtubC9raU1u?=
 =?utf-8?B?UndRSmxVOVdFcit4K0NNRnAwQXU3M3BNR2hCYkVHeGxuTkdQWnU4RjE4RTd4?=
 =?utf-8?B?WjNLNGRLV0lQWnphZGJqTnJZak1iTW0rRUdDME9VbVYvQWlWcXlrZ2FqVFlR?=
 =?utf-8?B?bzkvQWRDVjRTVDZVOGdyZjRQUE1tdmZzWnZoVTB5MXRnaU94S1Q4b096K05r?=
 =?utf-8?B?M0FQVzZGd25NSTVFWm5pcmpNci9tVGJjcUtUS0llajB1bDd1VzM2UHpMTG9x?=
 =?utf-8?B?dm96dU5PcXd0WWVsZnJoSloyM2kvQTJkbnRBOUZUVFc1NFk5d1RjU01neXdB?=
 =?utf-8?B?NHd2MlZPSFJDNzVKQ0pCSWpXOENwMW9MblJndkhDM25VWVYwN3JJU0xQQzV5?=
 =?utf-8?B?eWhIcnNEZll4Vi8rRVVHT25yeGJhY2UvS21STTk4SHBJOGt2KzNGVXBmcVpU?=
 =?utf-8?B?Qi9obWNDMkVQQjlZZXpKV2p6THRVWWNhYXl6Wk80NUdOZlFMcS92M2RqZjhM?=
 =?utf-8?Q?Vd0IX7/MtwSQAcss=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fae56a0-2e7b-42fa-f596-08de75687c00
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 18:54:35.2381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2vjoB0M/0bfYp7g5i7qalXJtP1nxBdbQop1dXfvvFoma5T8ZdoOkIniXOwd8257RGHZKB1hdySOzPDgmVJ94A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6398
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,lstrano-desk.jf.intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,driver.name:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D3AF81AE0B4
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:47:58AM -0800, Matthew Brost wrote:

One more thing...

> On Thu, Feb 26, 2026 at 04:31:06PM +0000, Satyanarayana K V P wrote:
> > When the PF is configured for admin‑only mode, it is restricted to
> > management functions and should not allow users to run workloads.
> > Suppress device capabilities to userspace in admin-only PF mode.
> > 
> 
> I'd mention which IOCTLs we expose in PF admin only and why we expose
> each one of these IOCTLs.
> 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > Cc: Dunajski Bartosz <bartosz.dunajski@intel.com>
> > Cc: dri-devel@lists.freedesktop.org
> > 
> > ---
> > V3 -> V4:
> > - Suppressed device capabilities in admin-only PF mode. (Wajdeczko)
> > 
> > V2 -> V3:
> > - Introduced new helper function xe_debugfs_create_files() to create
> > debugfs entries based on admin_only_pf mode or normal mode.
> > 
> > V1 -> V2:
> > - Rebased to latest drm-tip.
> > - Update update_minor_dev() to debugfs_minor_dev().
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 14 ++++++++++++++
> >  drivers/gpu/drm/xe/xe_query.c  | 11 ++++++++++-
> >  drivers/gpu/drm/xe/xe_sriov.h  |  8 ++++++++
> >  3 files changed, 32 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 3462645ca13c..7bf462eed917 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -25,6 +25,7 @@
> >  #include "regs/xe_regs.h"
> >  #include "xe_bo.h"
> >  #include "xe_bo_evict.h"
> > +#include "xe_configfs.h"
> >  #include "xe_debugfs.h"
> >  #include "xe_defaults.h"
> >  #include "xe_devcoredump.h"
> > @@ -213,6 +214,11 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
> >  			  DRM_RENDER_ALLOW),
> >  };
> >  
> > +static const struct drm_ioctl_desc xe_pf_admin_only_ioctls[] = {
> > +	DRM_IOCTL_DEF_DRV(XE_DEVICE_QUERY, xe_query_ioctl, DRM_RENDER_ALLOW),
> > +	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> 
> XE_OBSERVATION can create buffer objects and exec queues? Is desired to
> expose things like this?
> 
> I like this approach of only exposing a subset of IOCTLs though, pretty slick.
> 
> > +};
> > +
> >  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> >  {
> >  	struct drm_file *file_priv = file->private_data;
> > @@ -442,6 +448,14 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  	struct xe_device *xe;
> >  	int err;
> >  
> > +	if (xe_configfs_admin_only_pf(pdev)) {
> > +		driver.ioctls = xe_pf_admin_only_ioctls;
> > +		driver.num_ioctls = ARRAY_SIZE(xe_pf_admin_only_ioctls);
> > +	} else {

While harmless, you don't need the else clause as these are default values.

Matt

>
 > +		driver.ioctls = xe_ioctls;
> > +		driver.num_ioctls = ARRAY_SIZE(xe_ioctls);
> > +	}
> > +
> >  	xe_display_driver_set_hooks(&driver);
> >  
> >  	err = aperture_remove_conflicting_pci_devices(pdev, driver.name);
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 34db266b723f..1416ab7be809 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -215,7 +215,10 @@ static int query_engines(struct xe_device *xe,
> >  			i++;
> >  		}
> >  
> > -	engines->num_engines = i;
> > +	if (xe_device_is_admin_only(xe))
> > +		engines->num_engines = 0;
> > +	else
> > +		engines->num_engines = i;
> >  
> >  	if (copy_to_user(query_ptr, engines, size)) {
> >  		kfree(engines);
> > @@ -297,6 +300,9 @@ static int query_mem_regions(struct xe_device *xe,
> >  		}
> >  	}
> >  
> > +	if (xe_device_is_admin_only(xe))
> > +		mem_regions->num_mem_regions = 0;
> > +
> >  	if (!copy_to_user(query_ptr, mem_regions, size))
> >  		ret = 0;
> >  	else
> > @@ -419,6 +425,9 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> >  		iter++;
> >  	}
> >  
> > +	if (xe_device_is_admin_only(xe))
> > +		gt_list->num_gt = 0;
> > +
> >  	if (copy_to_user(query_ptr, gt_list, size)) {
> >  		kfree(gt_list);
> >  		return -EFAULT;
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> > index 72e55543c30e..be426afa90b1 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov.h
> > @@ -37,6 +37,14 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
> >  	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
> >  }
> >  
> > +static inline bool xe_device_is_admin_only(const struct xe_device *xe)
> 
> Kernel doc.
> 
> Matt
> 
> > +{
> > +	if (xe_device_is_sriov_pf(xe) && xe->sriov.pf.admin_only)
> > +		return true;
> > +	else
> > +		return false;
> > +}
> > +
> >  #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
> >  #define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
> >  
> > -- 
> > 2.43.0
> > 
