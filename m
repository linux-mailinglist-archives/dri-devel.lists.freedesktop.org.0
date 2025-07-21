Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76333B0CA36
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 20:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C149D10E2A6;
	Mon, 21 Jul 2025 18:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+PZGdPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF3210E2A6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 18:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753121160; x=1784657160;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6e1m/28FZMihuKxA6P6zWZmJoQVc4rdRjXOT/5T6yLE=;
 b=Z+PZGdPFU7N3LQHX/yolrwh0qwy4sXTqEKN7gvpcFA16Unh3L2fftVkf
 fKW8drSg7FLBoMCogL+pcS60ZsZG5jtHj0seAduMd0MJVMUS86s7E50cO
 O28g4KyEuoMqdi+gvV050rrFNb+VndggyhpiJ9oAQ89NWdoEyV1dVF9jk
 xwmW8XxWGkoOIHCwooy9VrNtGQp3OxeRwFBtzdDAIPtQ1qyEbFrqAcmEh
 aXMu65jaQsJy81eTrR783DrXaaFsLUobl8Wdd8EVrlfRMXqBHGAHvkEwt
 eFQfOLAE/IrIT7QxCEobSjCNrhuR/0vEt4kWyhW63caSdMt9A1LwT43W4 w==;
X-CSE-ConnectionGUID: O/O803y6SiWQ5V2iaiODhg==
X-CSE-MsgGUID: tvO2//iTTEKcwVFUMeBdKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="66690811"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="66690811"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 11:05:59 -0700
X-CSE-ConnectionGUID: xbmQyYA/SL+k1wVGqaTrAQ==
X-CSE-MsgGUID: sznyUS23Tlay0B82G/XopQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; d="scan'208";a="159239086"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 11:05:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 21 Jul 2025 11:05:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 21 Jul 2025 11:05:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 21 Jul 2025 11:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zz41gceHBAyF6f4j1m9YS05BgUr53jUU96/exs3fNJpxKoDdAKbp1djtB8MF/DiunYDQMvAg6v1Odad34GCqe7O3IhY1B6yMX3/N3E9Q8bt75DITydX7giNk0ZT7bMBP8KSTvIhVHxWL6rJPCbhENFfkcHeBAXzMQaO0im5ddIXk7FeAoIXeJd1Rdn08WsjTc37pQ6atz+3FboGp+/xEKsYBbLx2GWrhquLsMEbCwOB0qZdzucunqxlk55iIBSRFdI5OF/cvpKXoe2HZg7Zd+XeTTpF+7qD5KKXKZCYtEZ6QbvfdP4vYSkh/jVHqASSydsiltRkWH/1lQXlZdBnk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGjMTskxySNdYUtvoU4lcF1699HQAYsz/jGp/IX2Jhw=;
 b=m9GD9infI/A1o/xB+n8+hMOMbJgyY0VZmFxOWPbYRcttpjZuJevR3NoNESCt7SKkRJNDkei12+MDfDMA9EoYdWp91u1Ebb/k3Aj8kNqN+nAXxj4fGl/yXbNTakJlKWo76ZETX2RjlRsFue9TTYOD9LNLkoYbZWcwluA+3M/0Sgiknwm8G5YwEY29ggGdYVBcdyyGu2IcqQa+YqmzUyUdXBVMK1tpSxRjeywPHHY/8xg5yetwvHYc49OqeZNiw1TyN+YNC6qiMt6HFj9rA4uFxdii2kKLu3oSo3QKQ/pNv8aCV3mxno/zQ0k26I7xd44Q4o6SJXw27c20mKqKTf7+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.30; Mon, 21 Jul 2025 18:05:55 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%7]) with mapi id 15.20.8922.037; Mon, 21 Jul 2025
 18:05:54 +0000
Date: Mon, 21 Jul 2025 11:07:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: Philipp Stanner <phasta@mailbox.org>, <phasta@kernel.org>, James Flowers
 <bold.zone2373@fastmail.com>, <ckoenig.leichtzumerken@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <skhan@linuxfoundation.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH] drm/sched: Prevent stopped entities from being added to
 the run queue.
Message-ID: <aH6B7JruWCkReaLw@lstrano-desk.jf.intel.com>
References: <20250720235748.2798-1-bold.zone2373@fastmail.com>
 <66a14b005fa3dc874f4f3261b93901af1292bde9.camel@mailbox.org>
 <e7c0f63678a93261182b69aa526217821552a150.camel@mailbox.org>
 <DBHNK2XQHUIW.TQHV41LR5D8I@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DBHNK2XQHUIW.TQHV41LR5D8I@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|IA1PR11MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: 70133f8c-7f1c-4e03-2829-08ddc8813c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTJPQ1dEKzFDTElPK1NIN0hCRkNnWU1xY21qS09OdjFKbi9Hb0JEelJ4QlFh?=
 =?utf-8?B?a3BFSjVhYmdqakZrQ0VMK0dQM21OcXMrY2p4c0xRenkzZU12U0xGWTZCYmZ3?=
 =?utf-8?B?WDl1Lzh1czNNZ08zVUlhY1cxUXVJRXlxOSswOXZFMEdqRWU0bldGdkJwUGtW?=
 =?utf-8?B?OHgyYjBveVhhZnMvdEdDb2VWRGRSRGRTR29pNEVmSGdtTTR4T0tmQm5GWEdk?=
 =?utf-8?B?R3BVMjFManpqNmRRc2M1aWpDQVQrVDBBOS9qMzQ2dlJEdjlKQ2sxVFF2cDFz?=
 =?utf-8?B?YTJyL0pBUXVtbm9YUS8rNzNBWlVzWWZUMEJ5ajlhOWFDL1B1Rk9HbDVqSXFI?=
 =?utf-8?B?enZoWmN5cnIxSDF5MTl4MDFISEt3bzRSS3FVYm5ZTDljcVpnNCtheXl1TnhF?=
 =?utf-8?B?RE5UN0ZYcmZ2Z29oUUQ5VEtKeGNRTDg0UVpjaFNpelo5RFVndndPdDJsaW5m?=
 =?utf-8?B?NkgrSytTWmU2cFNlSjJoUGxUQ1JrMjdkRWkvNFY1R1prRG5kd1daU1QxeUF6?=
 =?utf-8?B?dGFlQjBzaS83ZG9CUURBMXZnSlBjM2oyNnRjMmZjUGVXbzRtcDlHSjBTSDBh?=
 =?utf-8?B?VlJiNU1IcUUvMmE3aEJFS0FVcTN6WHNlbUczVmNEeE9DMzlIbXkxZ0xxQ25t?=
 =?utf-8?B?UFBtVTZQOXZtOUJDUlRUaWl6bDYxbkFSODVTcHdKZXcwWjJkeW1vY1BYSFJC?=
 =?utf-8?B?TCtsLzVIUkZ1WjlWT2ErYmhtRy9UdGxsSHBMM3dUdDdGTXZCR2hoaTd1NGY5?=
 =?utf-8?B?Nm8zdlZsV296RlZiLys5U2Yrc1VsSjcvemZCZGlncFlsbjNjQ2Y3U2VKMWVI?=
 =?utf-8?B?UTdoZ0oxS3ZINy9mRzRRQlQvTE91MzRSY2w4RG9WSC94cFB2OGlPckQxcnla?=
 =?utf-8?B?aUZ4dndoY3gyaU5qVGpNc3gwcU40SjcwMk1RS045UDlJNW9FZnk4WGlKZ2h1?=
 =?utf-8?B?Mlp6dWh0RjhXaDNOQkpVcnlNaGRsZ0dKYlRSeVI4cWFaQWpBMnY3eVR4S2VE?=
 =?utf-8?B?dzYxdjc2YmJ3TmFzZlhuVStKT1dQMUg5QldFRlN2ZVkwZWJBdDdDMlpjWDRC?=
 =?utf-8?B?V0dhUzZBdkN0bEVpamZPazc3RHlsekxpa3RKZGthcmRBazhFb2lUY0ZLazNE?=
 =?utf-8?B?aUc2Sk05K0pEd1Q4aHlDcWtmSzlTdlFOa0lsZHNRUWY5bG4yTkQvaUYwWUlZ?=
 =?utf-8?B?MXZHVGxRVDBoT1JwWHRLSHY3T040endjdis0dXlFUmZYUDBxT2pIWlBxOUt1?=
 =?utf-8?B?Q2FtUE1GVUY2WHhVem13R0o2T1FRa2Nha01aeks1TFdaakk4cnc5MkVhc3pm?=
 =?utf-8?B?aDVoa3AycDFwb1EzS3NnMHlvRlhaeWxPRE9WL0NLQlNGYTV2MUZrVHdjK0oz?=
 =?utf-8?B?ZDZUdXJCV3NYUGIwWXF5d3kvVXd3MG5JaWcvMmpUVXp4MysvVCtmdExRNzJE?=
 =?utf-8?B?bHVZMFBmQzlsNVVUR3J5ZXRvM0N5dTJoR0k3Vk9VcG9lVDVwbCtHWnlvVnI5?=
 =?utf-8?B?NENha3BYaklOYjhVNW96dHhOakpPenZSUmVQVkZ2UittanNrSDdEM05CS21F?=
 =?utf-8?B?UWg1SjVjeE9mRkFUc3BydzVhaUMxallnRzVSN3dTUDVtVmFEN0RaVUdhNUQ5?=
 =?utf-8?B?S3A3YmhQTGFYKzQydnlRQVRrVTdacnY3aUVSMUllY296VG9meGllN3FDai9k?=
 =?utf-8?B?cjdiTUtyYlVubnBOUXRxb0hWSGNTSTVWMWNxb1d4YmwwQjloNHdYemJCcWpK?=
 =?utf-8?B?RktGeVR0eHFqK2pHT3VsdWkyMVlJMEJJNFNQTTFuVHY1U01PM0hyaFc0amdI?=
 =?utf-8?B?ZWNSR2FqeGJCQXhicVhCSlgyYmVMMVcwM0NGT3hRRkl6MnpocFcrYXBBWDBI?=
 =?utf-8?B?YkVrc0dwcE1zSEFDVnovNnVCVkJkWnkzcHRIZGQ0RDg1Y2Y5MjgzS2Noc2Zt?=
 =?utf-8?Q?zDQlPw3Uiqk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEk1b3FyODQyaFBoU1NXZTN3ZjVMZENhaVAwV0tsek5aQXh6UXJ6YVBzTzR3?=
 =?utf-8?B?T3F6dzhKNVJqbE5HdWdGRU5YWno3VGFVemk5cHhDTHV2MjhXN1RaWnNZVDVG?=
 =?utf-8?B?dmtPVTI3b0pHWDM5YU5mcGthZlRSejhSaHVwTTVudFIvb2dYTmV4NFRDdlZK?=
 =?utf-8?B?TXJkODdVeHhVNllGZjdRTjBiU0UzRXdXelRoanFTSHZFcmluOFBsVis5THZr?=
 =?utf-8?B?K1NGUHFSR0s1TElIQktXNkE2S2U0TmE1Wkc0QWY2a0t2czNtYVgwNk84QVd5?=
 =?utf-8?B?WHBpQTRwT2VzeW9vTXkvaFI1bzErcHltUXBVUDFiSWhHeU1FZ3Z4djFKYk1G?=
 =?utf-8?B?OUxQb3A0ZzBkRWJMbjFLR1hPTXA3a0tKbS9NbjBycW5PRCtYcUdHTmROdjI3?=
 =?utf-8?B?eTIwQ2l1ZFk0TTAvbko5d1Y3alNGU1RwVEFaVjlwU3VnZjZ6aG1ZUHZWT2FX?=
 =?utf-8?B?b2cyZlVRTU9KbHVDV2JBR1RUays1NTBuSzN0Q09kQ2hRY1RRMjVuQ1UrOWRI?=
 =?utf-8?B?ZHkxZDJPbGV1TmpJMWRwYnl2QkpSU3BqWnJ5U3RuWjNUWnpEdkVtTUNEcWZR?=
 =?utf-8?B?RlNJSVZEZy90NDBNOVhuSWRqR3FySlpWMzdGVS9VaEJSdW85bE1YYy9XNVNL?=
 =?utf-8?B?Ly9iRFBmUDgya2F5Z0xrV0FtVHQ4Y3Urbk1qNEU4ZzRQV0tsNFZiUXZWNS82?=
 =?utf-8?B?Qi9QUEw0QWVYdlBDYXlvSDlQV2c1c29wdXFONmV6NVRpa1dRRllIN2lVOVgx?=
 =?utf-8?B?T0kxMERvZmppK0tQMmFRMVFXakNkVi9vTVprcHg0Z2dxL0VET2RpM2tGSDZB?=
 =?utf-8?B?UmZaN3NCTTBwcEI0M2ZiZzEva1I3WElMbDVkZE1IdFZubW91NC9YZmhjR3lT?=
 =?utf-8?B?L2EzUVRvODFUZ2dKQjQxOG5MRFhXalcxVWIxWmxsRkM2TGRTanJIWGVjb0Jo?=
 =?utf-8?B?VFB6YjlHRE10WjQ3UHBzVFBpZ3RGb1ZGMXkvc1cwZWNTUFhKZU1Oc2NSc0py?=
 =?utf-8?B?ajhBUnVCZnVkT1FqU0ZWckRRMm4wclFpSWhDcnE0U3Ird3M1UnFyVkMxUUNn?=
 =?utf-8?B?YjJqM2NSemZGd0RkdWtZM1lYZVl3OGx4Y3VhaHVoWHcrbDR0YnZnRXNVWlFI?=
 =?utf-8?B?SUhiVDF3Ukh5SmxuUUFRV213bGhTb1FObVJmalVleDF3Wkd3OWF6Wk1iVklM?=
 =?utf-8?B?TjU3TWVvcTFmMFdOSzRqQ1hiTzRkSHgzblpRK3M1WlRBUXpsaG5QQ3BtaEtz?=
 =?utf-8?B?emJmM1NONmVxalVpMVRMZ2hKOHAzYUVONng0c09NUU1tckFnZTBmYW5WRlFq?=
 =?utf-8?B?ekpta05lbWJsS25PRmh6WHZXZThpa3E4c3FhOXlhUkpBL1pqdVc5T3d1NFIy?=
 =?utf-8?B?Y1ZQRkVBTTl4MExyY0N2Ukl5bE1BeTgzeCt3V0E4WG9OenVKcXpLZmowSHZD?=
 =?utf-8?B?bThFdGlmblVtdEJ1ZTBKc3lUbytVdzVzKzVWVllaUUgzSkdzS2FTaU03ZSsr?=
 =?utf-8?B?Z1c1M0hueDJDK1NRLzUxdHZQblc4emFQalVob1l5V3VUUFRGZ1NZT3RFSTlM?=
 =?utf-8?B?TzVMVkZzQVNybnZTVGQ5dmRjSmw2elZ6WlFscGRtQjNjbTlKMzBBNkNZSnhu?=
 =?utf-8?B?U20zWXFGMXlCNVVIOTdiMElVNTlUYW1FSkZDZzZBcFQwcXpQNnU2aDUrQ1NZ?=
 =?utf-8?B?RnBwM3ArYjNKL3FqWDh1R3ppQTdzOVdycXErVUd6TEgxVGVKbVIrR216ajZm?=
 =?utf-8?B?Q3Fmd1hPVXdiL0kxOTdwM1pjZmduOVdxVXArQmZwM0JvNndHSXFtb1VBM0c2?=
 =?utf-8?B?VXB5RjZQTGgvbzRZM1FyY0c5VHpsOHJ1cXI2ZDNhbkk4Y21UQmprNTZEazVx?=
 =?utf-8?B?RjlodmpSMDJhOEx6OGxGN0k2WGNHdHRSSVAzd2JnZHBjK3lmeEFIcE9Yc0xY?=
 =?utf-8?B?Yy9GTmFzcWF0cENWNXd5NnJoSFd0ZjdNUXRnMEg0SkhSeTBzS1JETTlGNFRT?=
 =?utf-8?B?NXFSeFV4eUZMZ1VCdFpXbHcvVGZBTUlXZHAvUTd4UldGWUpJYVBFdXJTMFVy?=
 =?utf-8?B?QnFiZVRvalFncGRXTkZlajFhMGtpem9tcm9obE9adjJEcDUvN0UvRU1wYTV6?=
 =?utf-8?B?TEhURXNoNUNRL2wvdFNBU0V4aUhDeEd2eTBtQXBLUXN3L3dFaUlIaGlKUXV0?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70133f8c-7f1c-4e03-2829-08ddc8813c4b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 18:05:54.8575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrhlwMisH/nLynGGv9TYmhXdvf2RyA0sJclmc5binQ1WPHCAxXABORxFZm//uorVgN6ckOkBpfecfZ0QNl1/iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6195
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

On Mon, Jul 21, 2025 at 12:14:31PM +0200, Danilo Krummrich wrote:
> On Mon Jul 21, 2025 at 10:16 AM CEST, Philipp Stanner wrote:
> > On Mon, 2025-07-21 at 09:52 +0200, Philipp Stanner wrote:
> >> On Sun, 2025-07-20 at 16:56 -0700, James Flowers wrote:
> >> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> >> > index bfea608a7106..997a2cc1a635 100644
> >> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> >> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >> > @@ -172,8 +172,10 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
> >> >  
> >> >  	entity->oldest_job_waiting = ts;
> >> >  
> >> > -	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> >> > -		      drm_sched_entity_compare_before);
> >> > +	if (!entity->stopped) {
> >> > +		rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
> >> > +			      drm_sched_entity_compare_before);
> >> > +	}
> >> 
> >> If this is a race, then this patch here is broken, too, because you're
> >> checking the 'stopped' boolean as the callers of that function do, too
> >> – just later. :O
> >> 
> >> Could still race, just less likely.
> >> 
> >> The proper way to fix it would then be to address the issue where the
> >> locking is supposed to happen. Let's look at, for example,
> >> drm_sched_entity_push_job():
> >> 
> >> 
> >> void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> >> {
> >> 	(Bla bla bla)
> >> 
> >>  	…………
> >> 
> >> 	/* first job wakes up scheduler */
> >> 	if (first) {
> >> 		struct drm_gpu_scheduler *sched;
> >> 		struct drm_sched_rq *rq;
> >> 
> >> 		/* Add the entity to the run queue */
> >> 		spin_lock(&entity->lock);
> >> 		if (entity->stopped) {                  <---- Aha!
> >> 			spin_unlock(&entity->lock);
> >> 
> >> 			DRM_ERROR("Trying to push to a killed entity\n");
> >> 			return;
> >> 		}
> >> 
> >> 		rq = entity->rq;
> >> 		sched = rq->sched;
> >> 
> >> 		spin_lock(&rq->lock);
> >> 		drm_sched_rq_add_entity(rq, entity);
> >> 
> >> 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> >> 			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts); <---- bumm!
> >> 
> >> 		spin_unlock(&rq->lock);
> >> 		spin_unlock(&entity->lock);
> >> 
> >> But the locks are still being hold. So that "shouldn't be happening"(tm).
> >> 
> >> Interesting. AFAICS only drm_sched_entity_kill() and drm_sched_fini()
> >> stop entities. The former holds appropriate locks, but drm_sched_fini()
> >> doesn't. So that looks like a hot candidate to me. Opinions?
> >> 
> >> On the other hand, aren't drivers prohibited from calling
> >> drm_sched_entity_push_job() after calling drm_sched_fini()? If the
> >> fuzzer does that, then it's not the scheduler's fault.
> 
> Exactly, this is the first question to ask.
> 
> And I think it's even more restrictive:
> 
> In drm_sched_fini()
> 
> 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
> 		struct drm_sched_rq *rq = sched->sched_rq[i];
> 
> 		spin_lock(&rq->lock);
> 		list_for_each_entry(s_entity, &rq->entities, list)
> 			/*
> 			 * Prevents reinsertion and marks job_queue as idle,
> 			 * it will be removed from the rq in drm_sched_entity_fini()
> 			 * eventually
> 			 */
> 			s_entity->stopped = true;
> 		spin_unlock(&rq->lock);
> 		kfree(sched->sched_rq[i]);
> 	}
> 
> In drm_sched_entity_kill()
> 
> 	static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> 	{
> 		struct drm_sched_job *job;
> 		struct dma_fence *prev;
> 
> 		if (!entity->rq)
> 			return;
> 
> 		spin_lock(&entity->lock);
> 		entity->stopped = true;
> 		drm_sched_rq_remove_entity(entity->rq, entity);
> 		spin_unlock(&entity->lock);
> 
> 		[...]
> 	}
> 
> If this runs concurrently, this is a UAF as well.
> 
> Personally, I have always been working with the assupmtion that entites have to
> be torn down *before* the scheduler, but those lifetimes are not documented
> properly.

Yes, this is my assumption too. I would even take it further: an entity
shouldn't be torn down until all jobs associated with it are freed as
well. I think this would solve a lot of issues I've seen on the list
related to UAF, teardown, etc.

> 
> There are two solutions:
> 
>   (1) Strictly require all entities to be torn down before drm_sched_fini(),
>       i.e. stick to the natural ownership and lifetime rules here (see below).
> 
>   (2) Actually protect *any* changes of the relevent fields of the entity
>       structure with the entity lock.
> 
> While (2) seems rather obvious, we run into lock inversion with this approach,
> as you note below as well. And I think drm_sched_fini() should not mess with
> entities anyways.
> 
> The ownership here seems obvious:
> 
> The scheduler *owns* a resource that is used by entities. Consequently, entities
> are not allowed to out-live the scheduler.
> 
> Surely, the current implementation to just take the resource away from the
> entity under the hood can work as well with appropriate locking, but that's a
> mess.
> 
> If the resource *really* needs to be shared for some reason (which I don't see),
> shared ownership, i.e. reference counting, is much less error prone.

Yes, Xe solves all of this via reference counting (jobs refcount the
entity). It's a bit easier in Xe since the scheduler and entities are
the same object due to their 1:1 relationship. But even in non-1:1
relationships, an entity could refcount the scheduler. The teardown
sequence would then be: all jobs complete on the entity → teardown the
entity → all entities torn down → teardown the scheduler.

Matt
