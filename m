Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A6ECB0DEC
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 19:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D33810E20B;
	Tue,  9 Dec 2025 18:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cNaB36lg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F13910E20B;
 Tue,  9 Dec 2025 18:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765306093; x=1796842093;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mirMkvUuTYuUKt3lLBY+FJpNtccdADG33wXstfGN+h0=;
 b=cNaB36lgrgqWFXNmyom/KHbZy86iJDI1EMyYU2lwYKbyVZk9XwTA4b36
 wvnIVsa82anyaxlSiB9pdSbOGkfj+MuLKQAUjvLbFxsppfE6ACyu2h3X1
 BKua7Qum/wbytgTtfvT7W2aJngl1kSsDoS6IPQRLefTg2KBh9CKNI6f4g
 SW0m/8psP7oS90ZHXG7hLDCY8gLMMnXrdJ5MTojnHsmXcYDFWZRCtA1M3
 sM+1TVAVVp/DHQbtkQQETkBs8qqUofYYs99CByhineitxs3GDZ5U9dTMD
 KF/dj4/HQpLzKyNGz/Fpb6+uyeWE+Awv/d80vLApUv/c1n+etaZo+UxmA g==;
X-CSE-ConnectionGUID: 8qSKoiLPTkGH0Iwrjhlsvg==
X-CSE-MsgGUID: cmhs2d2JSeWbqxYoSIXxjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="70891501"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="70891501"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 10:48:12 -0800
X-CSE-ConnectionGUID: Fd9nDUIwQz+GVuCyZcqSbw==
X-CSE-MsgGUID: QV7/NGqbS3+JpKTuu56nVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="196590152"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 10:48:11 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 10:48:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 10:48:11 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 10:48:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgvZ7uEv0YOEZf00VFVAXHQqOBqAlQAb+Y3iyQPCnp1yOa3dAzkuSZyF+QuTZMcxwmnZyivhaapX+pyzsd6lQvDhUzOn22UcOYle/zffR5/R5aKRQS1H5CmEbCNxUX0SU11IwALTerWKid1wb8wA71EVD+MUp6E2URpJFuRD7wA+UC73wDchgWtD+juIqoQPClcNFC3Hz9G1rBI7VNxun8A9g5FxQU/+kR9hHLPunc9CEVOerXkUcMBqP4KmcmNfCdrHBq8CjAT07p6ReVLKpF9+sCr9dcg6Zl7+Jcb0kWiPElEWqvYoGRwvox7NLWIc4/owMvwg76peWSCzG8FSGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk1DzKeI8bSBidxkBCmtZDxZO1r17fSEIwhBm4bJdWg=;
 b=O9QuEIrL1vaa+GuCDQkNsPLddS8gch13IV8S7aLX0LqEvHRQMlfjKS+yOK7jj3neCrzz/4UtlLNzbYAw/Uu7kuGnTkJcckLdNqH1rMvCH26IoYDXMR5mHpOs1PW0O+Hca73fLP75vqQVzyQRAbZQTXmKRe183EcgrffdCHuwUTX7LwzU/MABCJiiVtfzAXVOV9vGO11USMzqc/qcwQZcuftGkEDIdUOi00P88121+GOD+KxxbeQ2xHNmz/wUy1xh+lqP+oAE9LZPuh1+/txGhM6lU9me17flLsqSjmUbD0e/yM0EshEV7U2RpOh8MlmY8gQOCqcpNY1VjZvy+xkxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 18:48:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 18:48:03 +0000
Date: Tue, 9 Dec 2025 10:48:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <vitaly.prosyak@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, "Lucas
 Stach" <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/sched: run free_job work on timeout workqueue
Message-ID: <aThu4N8dVQxFPIyg@lstrano-desk.jf.intel.com>
References: <21699026216379f294d6597ed6febd187229ffb9.camel@mailbox.org>
 <aTcf4o0huubgUPIQ@lstrano-desk.jf.intel.com>
 <aTcguvAQCZ07xD/C@lstrano-desk.jf.intel.com>
 <212ecf88-b175-44cc-af3f-7371340ed480@amd.com>
 <aTdFgVM5s/H5tc4G@lstrano-desk.jf.intel.com>
 <b0781c7fd90c51394ec60faa71222fc3af06bb0c.camel@mailbox.org>
 <e99a2e97-3058-4501-ad22-457ede493a59@amd.com>
 <3e780e52dc0a7f1267e814c895e9d5e840a8c913.camel@mailbox.org>
 <d846a1dd-a705-410a-a043-ffae43bada57@amd.com>
 <fb93bfa5f32025ce187153d0eeb47c43ec8cec7b.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb93bfa5f32025ce187153d0eeb47c43ec8cec7b.camel@mailbox.org>
X-ClientProxiedBy: MW4PR04CA0236.namprd04.prod.outlook.com
 (2603:10b6:303:87::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: daf8ac30-dc7a-4fae-1a7a-08de37537be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmZ1aHk3RnEwek9nTDdYQm5NeHB2Q0k3YzNTQnJxdWtiV0plYjZJZTJhWUJt?=
 =?utf-8?B?aTN2UFRlQlJUem1oQlByYjhPSkgxcEl3V3Y3eHNMbUFtVGZDODh5WXhYbVhu?=
 =?utf-8?B?R1pKQW5xV2hvRE5INGNTdVpuWmZNMlRjZEpxa3U5MWNFa2E2UStrcjFyVTB4?=
 =?utf-8?B?TndyMDVDZklobFBRcjBsZklnVFFDamlRQno1MjIzMm11UUgyZVhDbjFwTWZo?=
 =?utf-8?B?R0IvVUg1bUVreEpDT1FnbXBBN0pWei9DTkwyTDNJeUZ2cnJHa2N6cC9JckRr?=
 =?utf-8?B?Y29kVFFualFEcFFpb1JTOFBwN3lHSnowUHV5ZGVZZjY4QkdEbitnOHRvc0J5?=
 =?utf-8?B?cEVMOGtSbkcxMmNJTnVRN0xUaEFCYU53aGpEUWErTDcrRW1ERlFaYis0aVpi?=
 =?utf-8?B?YUZJY3RQaGJuajAvRVdPM1dLMVBuVGtxUHJ4b0Nua0poc3pKWFluZDdFaStP?=
 =?utf-8?B?MlJxb1ZQMXFqQ2h0aXBvYmtIQktieHNKTmxjMmxMTlNDZmhQQlFUdjM4MEZJ?=
 =?utf-8?B?eGpHVkp4MzNPNklGMkVpQ2EvU09ETFlMN0FVTmxzckp3MUhMYjNxSFZxZ1pl?=
 =?utf-8?B?Qk43MlJ6aUxLMHBLeXlnV3hOdit2SjNycVh1OE5wZTdLNTNhaS9MeEkyOUFn?=
 =?utf-8?B?b2ZoblcwbE9tTDVNc2VBUytncld4eXVESXBVQndadTRXNG5KUWJ4MjlTM090?=
 =?utf-8?B?N2s1TlFaeURPRU1HUjB6N0Y1L0lHdTYxdGQzcVA3N1NMaElTcUlNM0U5Y3Fi?=
 =?utf-8?B?WmVUVHkzL2JwRlN6S0pIaVZNbnRlYWxKWWFQOHRVeEE3ZENmdUZnQWptR0FJ?=
 =?utf-8?B?TFgvT01ab0RnS0gvVWxJaElXYWEzekVsbWRQcVBOUytFOGs4eW1WR3JTeTlM?=
 =?utf-8?B?L2FhWkpIbjBQcERUNEtDNnhtRmk2a2s0WThSUjg4K2dUMkIzUHB3cEd1KzhR?=
 =?utf-8?B?K2NabFcwL25KZ0haSDhOZkhXVHJTdVlPWFhObjdPcjlEUUx6OFBSWE1SRk9w?=
 =?utf-8?B?RjBFM25CVnA1amdwVW44TGZndGV0N2FsMVFmQ2JINlpqSkI5SmR5TzBVdTll?=
 =?utf-8?B?SlVWVHFyYUdDZGFXRFdSSndhUHVDSVBlN1FtN0VjVnNkVElRK1J3ZXg1ZUNx?=
 =?utf-8?B?VmtDOTVNNWU3aUNvM2pIaW10ZTU4cGNQTDdaaTVpaEpqVjRsRzhwTFVKWDhB?=
 =?utf-8?B?dzF3K3pROHNiRmEyRTV5WWRwMVJHOHhjU20wZ3RTbzdUMEZzakxLbXo5eWxH?=
 =?utf-8?B?MUpNbVRQb1NzS1YrMUJ3ajZFT29DVXB5QjBjaE4xVDl4aFd1bktIOGVNeWNI?=
 =?utf-8?B?TlpwOUlOaTJhaWFSSFBrOVFMNTVoM3dFQytaTzR5eTc0NlhKODJOWWgzbkU3?=
 =?utf-8?B?Qzd1ellxVjdBOVFSZXBxQkN2c1o5RHd5aTlJaU05NGVFZW5PWmtuSDFBSWdo?=
 =?utf-8?B?WnNTVG1nRFozdWVMa0FTNE9XSnpQMHA5Z2JNWm9pT1pBUEczVm1nY3dZenRi?=
 =?utf-8?B?T0RiV3plY1k3ZmJCK05QMHdyTHVYYzEzSzlmN0ZLcnl5MHpuMFZ5bE1FSWpF?=
 =?utf-8?B?cWZPNVBDU1J0YW5oalNnaG5yREhJc0ZnckNMWEcwQ0MvdWtIaXc0dC9kLzJW?=
 =?utf-8?B?b2FxU2hWRTBkTzJtRUh4SGhzUGR4cWhPckhUS3hwV0RIbk5mUFNEeGpZWSt1?=
 =?utf-8?B?Uk4zZ1FDRENFU3Y1RXFFTVF1eDd4VlR1dS9GODVBamhyZ29yZlpVZGhiYWU5?=
 =?utf-8?B?UGVHUzU1U1FlUkdTcUpYeDRUbmpYd1JnaFdEUE1FWkhWOFZFRHNMRWdNZkdh?=
 =?utf-8?B?a2kvQ3d3V2R1NWF1bTBzSGM5S1FVUXF6cGtnU3d3MWdIUC9uNTFCbCtIRFFt?=
 =?utf-8?B?TlhwWGhNeWZWNE16R21FOUFzNHF0bmtOUlZDY3BnaEVHSjFUT1FZSnIydzlN?=
 =?utf-8?Q?v0/d9/KWJSvGFVRPGy0sYDCMyplvymPW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2kvakdlejA2WlRobldmcWY5VFhwUkVZZkJMc1B6OUFKd3VaSkpGbzgrTFRW?=
 =?utf-8?B?MW1hcmtJREtaTDZPaURlV1AxMWNOQmFhTE9EQXpHdnJQQzFIUHZkSWFmZW5h?=
 =?utf-8?B?c24vSEZKSXJsUkw0bUlSa2ZNYTBHM2tNZFNEUGJYdUI5QkkyU1RBQ2xROHl4?=
 =?utf-8?B?b3VWUnVNYkgzN2N2ZGpVbjhXUzVmZ3JHWHN3ajFhN1grUlNaZlk0cGlEWGJK?=
 =?utf-8?B?akkyUW0xa3RxdXZlRHlJenVEcVJ1UGQvR2pRWWN6RzVTQzlOSERVcFZDWlpn?=
 =?utf-8?B?M3pYbmNhcVE1MEhTZE5uM3J0d0drNmprM3pENzJvMUcwZEV0R01SZ2tIRkdW?=
 =?utf-8?B?MlBkUGxTYVloYVRVcXFiRVBwdlFhWmpyRnJFTTEwZkRFcWZKZWl3Qm1oQmFH?=
 =?utf-8?B?SGthZi9maTMydDc0c2ZTM2NBbHZzUUV5TktxT1dwbHcwekR1M1JEN1VKMFNy?=
 =?utf-8?B?b2dHOG4vT1pWV05jaGdqTFh1TVdpUlVoeVo4QXViMkIwdWZqSjIwa2h2SWFP?=
 =?utf-8?B?WVg0Y2FJaGVOTDRmQWFrb0JIWXRRWlFQSURyNloyRExjb3Y1aVVUMkwzZFJr?=
 =?utf-8?B?QXNqblRMOUFPTzMxZGczbm1BTlN1OEUwUVdKT1JFb0dNYXo3UzJPVFBnVndH?=
 =?utf-8?B?em5wZEtvUHpXdUlGTnA5MVJ0bDZTME5ML05FY0pnenJ1cytHMzlBb1pSaVVD?=
 =?utf-8?B?VG5aNDNxd05waC9iQkRJV1JZem5XR3JRME9SVU9nMWQxbXoycWE3b0x2UTND?=
 =?utf-8?B?bEJ3ZjlldHFqSzdqRWRhUGwxMFROWDFDd09nUVJVSHI4VzZXWHBpZksyS1ZY?=
 =?utf-8?B?Y2VVbGdnVmNwZmFmT0plbzdUeTg1OVQycEFiYjJIRXBEbE14aWpleXBXQ3JT?=
 =?utf-8?B?czNEWVJ0N3BPbllldHo4K1huc1JIS3ZPSFQ4ZmJvZlAxaTRhSTFyZk5oam41?=
 =?utf-8?B?bUJzY0xOa2JNQ09saXdWTm9tZU44SGdtanVTTHZaV3hqcGl0aFg0dkZUNnJ2?=
 =?utf-8?B?alpoaEI5T2hNcXpYa3VhMXh1M3RsdjJYaGpFRXpsZ2IvdkJ4Z01tRUR5T09D?=
 =?utf-8?B?NEhmRWkyUWZMMnFWTTRPbnhrNDFoL3Z6WllWUHVnV3ZMVG81bDdjZGdQMGw4?=
 =?utf-8?B?OTFhbTV4UmVOMnJlNnl1NFh5b1JLcG1ab1dEQkNvVVduVm9mSWZad1p0RGZS?=
 =?utf-8?B?czJWTmxHWUlJQmV2UFNua0dUOW81cmE3SFVwNzNocG1WbXNBakpvOTlXYXVL?=
 =?utf-8?B?cTZvQjlTdm1xOFZXRzQwMFlRNU9ZL01iUkhwRXY0WlVNbWRXVkR2aHRBUG8z?=
 =?utf-8?B?cjFrc0ZRTWxsRHRmV1o4MXZSMTNGSEhSQTdHQkJXb0lUMk5LaHRXVndFZDMr?=
 =?utf-8?B?TjlaUEZNTDUwL0x3c2JDcERPaHRPTmlEUkJROGZrWGdpME1WcjF2dmhiMkYr?=
 =?utf-8?B?VS9iN0h5a01GQU80YjVOWUtkYVNWaU0yN3E3YzdleXV3bVJOTnRUYnQzaFpR?=
 =?utf-8?B?VU94Qlorbk9PNDl2YWFFVW1yMW9SaVYyQTNYcmtCMWFLWUhBNmgySW9acTY0?=
 =?utf-8?B?ditMQmNmSFBNTXJKK2U1azlSbjA1WUtDdDVQRWcvbUFwbWc4M3lnblY4VU1k?=
 =?utf-8?B?d3d1RFg1MTVKTVFRNjhFOVRXbDRPSHB3ZmoyRk1adjI3VVBOM3dqanQ4VXBo?=
 =?utf-8?B?TWordVIxaXZsQWlnWHhwTHhXZHloSDZBbHNDaG9KV0lNRnNxalhXTmN0aExi?=
 =?utf-8?B?MDZpSVZkNUlOSXZXeGVyY1JjTXhXZWdXNDZ6c3hLV0RrRjlKdmpwcVRIQ3Ny?=
 =?utf-8?B?eDRPL3RjZE5YNXhSMDZRTXgzMldCUjg4QlZQTkt1TXh3R0NhTGJFbS9sNWEr?=
 =?utf-8?B?Yjd0a1VVTUF2U0J4alVuU0JybFppZnAxSTU2bC9ZMWllTUFLV3dWNldFaGN0?=
 =?utf-8?B?U1ROQmgwaElhT2h1alVCWnFpaFkzVkFXTXNnMGFnSGo3aGNuSmhHdXRJTXZq?=
 =?utf-8?B?RDBhSTVMajl6NnJQc1lxKzZ3U2RhZ3ZLQzIvTDBIYmMxeFk3SVNub3Y4L25X?=
 =?utf-8?B?ZlpXRXVTQW5MVmZCOE9yNy9lZDQxYmFkMlFYNkplWUF3blJaMStFdk9MaGlz?=
 =?utf-8?B?T2FNQkdxQkZvUG4zSmU5MklsNnRZajNZZEQzYlpzN3J6YmpKQ3FOV0grVXJt?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: daf8ac30-dc7a-4fae-1a7a-08de37537be5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 18:48:03.4711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ww2t3uQJ5FyajTet3BlOfzCVS5kyuRltgrjv/bcshBr/gQnfGf6FrLtxRgHH11oNsepn1bRFxa9w9iMBd6K0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8986
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

On Tue, Dec 09, 2025 at 03:28:49PM +0100, Philipp Stanner wrote:
> On Tue, 2025-12-09 at 15:19 +0100, Christian König wrote:
> > On 12/9/25 14:51, Philipp Stanner wrote:
> > ...
> > > > > > > > > > How can free_job_work, through drm_sched_get_finished_job(), get and
> > > > > > > > > > free the same job?
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > It can't.
> > > > > > > 
> > > > > > > But exactly that happens somehow. Don't ask me how, I have no idea.
> > > > > 
> > > > > *Philipp refuses to elaborate and asks Christian*
> > > > > 
> > > > > How are you so sure about that's what's happening? Anyways, assuming it
> > > > > is true:
> > > > 
> > > > [  489.134585] ==================================================================
> > > > [  489.141949] BUG: KASAN: slab-use-after-free in amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> > > > [  489.151339] Read of size 4 at addr ffff88a0d5f4214c by task kworker/u128:0/12
> > > > [  489.158686] 
> > > > [  489.160277] CPU: 11 UID: 0 PID: 12 Comm: kworker/u128:0 Tainted: G            E       6.16.0-1289896.3.zuul.0ec208edc00d48a9bae1719675cb777f #1 PREEMPT(voluntary) 
> > > > [  489.160285] Tainted: [E]=UNSIGNED_MODULE
> > > > [  489.160288] Hardware name: TYAN B8021G88V2HR-2T/S8021GM2NR-2T, BIOS V1.03.B10 04/01/2019
> > > > [  489.160292] Workqueue: amdgpu-reset-dev drm_sched_job_timedout [gpu_sched]
> > > > [  489.160306] Call Trace:
> > > > [  489.160308]  <TASK>
> > > > [  489.160311]  dump_stack_lvl+0x64/0x80
> > > > [  489.160321]  print_report+0xce/0x630
> > > > [  489.160328]  ? _raw_spin_lock_irqsave+0x86/0xd0
> > > > [  489.160333]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> > > > [  489.160337]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> > > > [  489.161044]  kasan_report+0xb8/0xf0
> > > > [  489.161049]  ? amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> > > > [  489.161756]  amdgpu_device_gpu_recover+0x968/0x990 [amdgpu]
> > > > [  489.162464]  ? __pfx_amdgpu_device_gpu_recover+0x10/0x10 [amdgpu]
> > > > [  489.163170]  ? amdgpu_coredump+0x1fd/0x4c0 [amdgpu]
> > > > [  489.163904]  amdgpu_job_timedout+0x642/0x1400 [amdgpu]
> > > > [  489.164698]  ? __pfx__raw_spin_lock+0x10/0x10
> > > > [  489.164703]  ? __pfx_amdgpu_job_timedout+0x10/0x10 [amdgpu]
> > > > [  489.165496]  ? _raw_spin_lock+0x75/0xc0
> > > > [  489.165499]  ? __pfx__raw_spin_lock+0x10/0x10
> > > > [  489.165503]  drm_sched_job_timedout+0x1b0/0x4b0 [gpu_sched]
> > > 
> > > That doesn't show that it's free_job() who freed the memory.
> > 
> > [  489.405936] Freed by task 2501:
> > [  489.409175]  kasan_save_stack+0x20/0x40
> > [  489.413122]  kasan_save_track+0x14/0x30
> > [  489.417064]  kasan_save_free_info+0x3b/0x60
> > [  489.421355]  __kasan_slab_free+0x37/0x50
> > [  489.425384]  kfree+0x1fe/0x3f0
> > [  489.428547]  drm_sched_free_job_work+0x50e/0x930 [gpu_sched]
> > [  489.434326]  process_one_work+0x679/0xff0
> 
> The time stamp shows that this free here took place after the UAF
> occurred :D
> 
> 
> >  
> > > @Vitaly: Can you reproduce the bug? If yes, adding debug prints
> > > printing the jobs' addresses when allocated and when freed in
> > > free_job() could be a solution.
> > 
> > We can reproduce this pretty reliable in our CI now.
> > 
> > > I repeat, we need more info :)
> > > 
> > > > 
> > > > > 
> > > > > > > 
> > > > > > > My educated guess is that the job somehow ends up on the pending list again.
> > > > > 
> > > > > then the obvious question would be: does amdgpu touch the pending_list
> > > > > itself, or does it only ever modify it through proper scheduler APIs?
> > > > 
> > > > My educated guess is that drm_sched_stop() inserted the job back into the pending list, but I still have no idea how it is possible that free_job is running after the scheduler is stopped.

I believe I found your problem, referencing amdgpu/amdgpu_device.c here.

6718                 if (job)
6719                         ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);

Which is after:

6695 skip_hw_reset:
6696         r = amdgpu_device_sched_resume(&device_list, reset_context, job_signaled);
6697         if (r)
6698                 goto reset_unlock;

The job is likely added back into this free list here:

6676         amdgpu_device_halt_activities(adev, job, reset_context, &device_list,
6677                                       hive, need_emergency_restart);

So free_job runs and 'job->pasid' explodes.

Save off the pasid on the stack at top of this function and I suspect
your UAF goes away. This won't untangle this hair ball of code but I
believe this at least prevent explosions.

Matt 

> > > > 
> > > 
> > > And my uneducated guess is that it's happening in amdgpu. It seems a
> > > sched_job lives inside an amdgpu_job. Can the latter be freed at other
> > > places than free_job()?
> > 
> > Nope, except for error handling during creation and initialization.
> > 
> > > timedout_job() and free_job() cannot race against each other regarding
> > > jobs. It's locked.
> > > 
> > > But maybe investigate Matthew's suggestion and look into the guilty
> > > mechanism, too.
> > 
> > That looks just like a leftover from earlier attempts to fix the same problem.
> > 
> > I mean look at the git history of how often that problem came up...
> 
> If that's the case, then we don't want to yet add another solution to a
> problem we don't fully understand and which, apparently, only occurs in
> amdgpu today.
> 
> What we need is an analysis of what's happening. Only then can we
> decide what to do.
> 
> Just switching the workqueues without such good justification receives
> a NACK from me; also because of the unforseeable consequences –
> free_job() is invoked extremely frequently, timedout_job() very rarely.
> Drivers will not expect that their timeout_wq will be flooded with so
> many work items. That could very certainly change behavior, cause
> performance regressions and so on.
> 
> 
> P.
> 
> 
> 
