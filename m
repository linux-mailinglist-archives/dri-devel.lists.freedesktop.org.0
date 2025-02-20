Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A8AA3E001
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 17:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B50A10E174;
	Thu, 20 Feb 2025 16:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haCHiK2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F25C10E174;
 Thu, 20 Feb 2025 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740067917; x=1771603917;
 h=content-transfer-encoding:date:message-id:subject:from:
 to:cc:references:in-reply-to:mime-version;
 bh=XsZYtXrm8RDanKbkBy2v0bji1PTRyiTwSq2LuvCdysE=;
 b=haCHiK2B4QlLxRAW2L9OMerY00JAqdphpBUMoXMBcvKfFaMZgLEUMcfO
 gq/OzkpaWj2wuN9ZEaASfKGCnAaUCwnQbyNXWfsHus6N/1DdaKMXl1sKv
 uQQrCq0vCO2OZaQg2NbnXbHB5F6mpbmsDQDElElnsO3yOFuaU9CKHfl9S
 1QBv+wuGYfx03bMbIBhIt0oSUgx0wQpnAlGg0vBRiMmVwK9cLe4bM9HdH
 i+vPi9Wh9FSI0BbDbM87MuyqmQzNaHSrVntBUO7laJWVZ5fuUDq4z9Eo/
 MIfpi2VzFDwG9vMmV88RQRSPhaqGVb/yiOysWVtK7YrbDad/Q+JByWZKJ A==;
X-CSE-ConnectionGUID: ee7jczliSUeyTDdlSdQ4TQ==
X-CSE-MsgGUID: +SCUpZP6SxOvvuKyALz2wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="41112147"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="41112147"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 08:11:13 -0800
X-CSE-ConnectionGUID: aM2/HyjLR6q0u1unRvvG6A==
X-CSE-MsgGUID: qKPzlr3uSmSAOGMIDh4zuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115020503"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 08:11:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Feb 2025 08:11:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 08:11:11 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 08:11:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJhIpdkH7jHbTRgtB7RRCrprmpxobSWjjhteUR5Sqe6rNk0dY8vdZLpAmL1ytMPVwmvjuvoaHFRTcH+gYg8CNOoKSnF0CdOy2NYzTWYnOcYvYuiArHTxiHbjU2oJ+gddZUW/Yih6n27fU6++dFuzKJ4RhJMw0kwDIED9xxptNv4sTOhVZ87QcCFSzM+WESeKQi43lohcbBAz63vhl3/aGHOuKDvQpE4LS6xEGC9ovW99fYfKh4Gwq/aFtIHdq4i56LIa2RTAl6A6oTgRagBq65bdP9N4HzVW/UNscvhCERldBFbdqYFGOyYUcTyabAUAZJn+9lFbUQEGlMxSERKcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI2CA1eGu8OoUdGw2TQ4gjoahahkazFIPPtyZpprdBU=;
 b=hoXMS1IKfoNexrEEZor68YplQzgH8UVuKnkhigKLvLufDxNXd+A6ufI/sihUvxMqaf3xz3n8Drqo1WFkmjrnwLVOwch7mNbCVmA+rKnZkpnQwo6lefcoBzVS/CaRoJvuEm12uBvVme4HRapLO+/+0mkOqCRD3sIctKt9hDigREplxCAK4YjdenrBSPSk1mtxBSZRTje2Ml+vh81WrzKx1mKKVLbuasTo7LqwKyeRK9qe7/0rwSrdPkOKnor24fHpxSO3WoKNW7qGJyQXKtBETRTyjBDSy/rLXTbb9L4bSeWlytW5iUv82/fUFRoQ8qV7pWVd3paY4jQpV5UK5IycAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH7PR11MB8034.namprd11.prod.outlook.com (2603:10b6:510:247::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 16:11:02 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%4]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 16:11:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 20 Feb 2025 16:10:57 +0000
Message-ID: <D7XEKPZV5YCX.2TK15CAYHMZD@intel.com>
Subject: Re: [PATCH v2] drm/i915: Fix harmfull driver register/unregister
 assymetry
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, Andi Shyti <andi.shyti@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <20250219183807.713776-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20250219183807.713776-2-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: MI0P293CA0007.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::10) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH7PR11MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 283bfffb-61b1-4a42-7606-08dd51c92ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tm5vWWNIb3d4YnBmdGR3TmcwQnlwbnI0bmRIcGtoYnJYNzN1MlgzS3pMVkhT?=
 =?utf-8?B?ajhjeldDZC9TNStYdTZrZ3lBOEZvbi9vQjlHdWdTUmlONmx1NTAzTU1lUkRQ?=
 =?utf-8?B?cXUxM2ZuRU9UcnhPNDdHMU1Pa2RTbkNVbytvNlAyRWtZc3FiakVJQTErREZ2?=
 =?utf-8?B?a0htSVJta3VCUDVBU2F3bGxlZW00Z1dJdGo1T1UzTFpKWGxLVjJMdmJ0eC83?=
 =?utf-8?B?bFFXanNWd1BQMXJhR3h1d1I3SVhiWXdWckdNRUZxRmtocy92QlhLcmc0Wkdk?=
 =?utf-8?B?YXVWaUQyeGRGQXM1SUJEcXc3aDVHK1ZlaU9mR3JFKy9pMFVIN0c0Ri9wWVZo?=
 =?utf-8?B?QlFXN0Y3UkdSeVkrNjZvWW44NG8vT3ZvVVFoQnVjd2xFcFN5a0NkMTJhczFs?=
 =?utf-8?B?UkcySjVhRXNBZkdkNjk5dnp3cmkvbnkwWHFGWTF6aW9ScytZcGQ1Vi9lT0pK?=
 =?utf-8?B?YlB3UUZxbnUwdFZ4UFMrQTFpSTJ0ZkxYSHJzMU1ELzllSjhYQXZVbDU1UnZv?=
 =?utf-8?B?OUF5NkJRTm1keWpUWCtkK0pxeGtCNDBCMGkvSndTOHFTQ3kvWnhINjNFc1dt?=
 =?utf-8?B?ZTM5aUlvcVBaZms2RnJieHUwQVdaVWpCWUtJTEJxTWd2UWVNQllqb0t2S2ds?=
 =?utf-8?B?aTdCaG5iRFFDR3lXMlllNzlTTHJFMllSeUdMUHo1WTNSaFpqdXA1a0U2NjFm?=
 =?utf-8?B?bXJIUUJuRXhXOUREeDhnNjBFUkVYK3dCNm1rMlRWV0FtNXZpSFM5cE1xU1I4?=
 =?utf-8?B?NnFXVEVPNUJ5MzZoUTNxczFHbmN3TDlPUDdsTjJ4ZUZiaERZUTduUlQ5ZDEr?=
 =?utf-8?B?U3ZQdERYMnJTamg4eHVWYUtMbWp1M3VJeU9TN1ErWS82REZTS3Y5Rk83T1pD?=
 =?utf-8?B?Zm16YWpEYk1xWStFZ0FpV2RlVkdjUDBOb2dNaDhyM0Y1U3BScTk4aWhkTnNR?=
 =?utf-8?B?YlU0c2NMd29qbThBZnhqNE5rOXlMTmRWdnQvRXlwSStLZ2g2eGdKdEdIRXFE?=
 =?utf-8?B?Z21acC8xSFh1ekJRd1VBWUJRdXNBRnRhQ281TVlJUm1zc2xsZmNqeEJJenNN?=
 =?utf-8?B?RDU5RDAzWlhJUUJmeU5qR2F5dmlydTlSdktsZ3hUQXYvSkpTQ3lrT0NTbTRY?=
 =?utf-8?B?blkzK0hONWs5L05ISHVBYndrQ1V6SUtPTUhZYWNSUGNJMzgxZm9qMi9qdEdr?=
 =?utf-8?B?Sk9rbzJXVjJSa3BrU2J6cm9Sby9Db3dtQjRkRXp3YjdQU0dzSTFsYVNEVDVZ?=
 =?utf-8?B?Z2M5dmk4RjVzRGVVNHg3VDRaZGNpZE15S0kyeUJ6VFpJM2gzNDVPVkI2WEdT?=
 =?utf-8?B?RXc5NGt0bk5wY1MySld0SGlHVDV6bmFVYUJuWWsxdnlBRzZBdVp0WXUxTGl2?=
 =?utf-8?B?ZTVFSnRFUGFURWRUbnRpdW1jbnZmaklhNlJjZVM1dklkbjAyajdFVkZoait3?=
 =?utf-8?B?SWM4YWJQak9ydFUwWXB4Y0xXenVFaWdKUkQ4S2xWUFdJRlVhand3OG1HN0JZ?=
 =?utf-8?B?b3NTOElRYjF5WjJITU9NaXVEb05hUDdqQjFwTXREK1o4Y3MxcmZKdGNpQ0VQ?=
 =?utf-8?B?b2luOWtBMHlRUTVGMnRPckt4MnUrM1NxZDF0cFNzeGt0Y25KYTRqZWZFeGFG?=
 =?utf-8?B?OTZMT1BSd1lVSEFmWFhiU0tiQ0NpUi85Q0pMbnZFRGg1dHJ3eXRmaytGM0Ro?=
 =?utf-8?B?bWs4UC82cVJIUlg3eHB6TDVHTk9VendLeGM0M2lybWlIek5CUkFmTWtlbWhQ?=
 =?utf-8?Q?hyftNPdJfksvSzxAQydUYELqb47s15ewAnHty/J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFk3ck1rNnFHZm5XeVhNT0ExdkNWakluMGIwWjA2Nkl5TEpvNmFncXJxbElq?=
 =?utf-8?B?cmI3Vk44TmhLZVlXbUtIQ3RmMFlDWGUyYytrSk5lQjBJV0xHMWRYRk1OU1h3?=
 =?utf-8?B?RkR6VXo2ZlBZRm9NTE1jL2N1dEdzK0tuMGtodHBPY2hvV2FJTGVUYjl5Qlkx?=
 =?utf-8?B?OWwzWXZva0ozM29hY0dDdmhOazBaL0tQTVF5RkR1THMycUE5NEdvNHFKMVZE?=
 =?utf-8?B?OHl2ZzYxc3Y2UlZCNEFNT3A5dlE2ajBZTjhRSHZEMnh0aEdjMm8vL3BYa0hs?=
 =?utf-8?B?QktYYnVSdWk3dzNERWU0UlBuQ3JFOE5RTmhXbmcrbTRUZkFsZWtrWVpKWE1U?=
 =?utf-8?B?THFxd0tnaWlpc2p6MmRoOXB3V1ZtK2QzK2JXTlMrVzczMjM0amN3NjNNOXV0?=
 =?utf-8?B?M21rNEpDZmw1L3owbDFIMjljQlh4WU5hWFRjVTlsOGZ1V0MyZlpncnRQVzN2?=
 =?utf-8?B?NFBRRkN4RkdpUE1KOWtZRDZNbVRIeXNIOHZZTFlxdHlXM0RacWVGYSsxQnBO?=
 =?utf-8?B?dVFGN1ZhY0U0WDFaL3lVWVJ0RG0rZHE4TWU0UVBNK2tVY0I4OFRUM0RZVHln?=
 =?utf-8?B?TzhzVjlYUnBQUEQvMVIzVTY2aU5Ua05zdG9JWVhTc1JWN2UzcW5zVFFpOXFJ?=
 =?utf-8?B?dnp0ZG9ZZjJWenhkVUgyZ3B1Wm8xN21UVEF1bjYrYXFNaHlGQWdBelRzUjdx?=
 =?utf-8?B?NGpkTTNBQXJSYjFXNjZFTjBHclFZWi9UZjZ3Y21NNVFWbU1NdkFwM0VBY1dI?=
 =?utf-8?B?NCtkdnZVZmxVdW93NG1mRGhKV1ZyZEIwNDBkVXhXVXVGeHZ0QXBEQlBzb0py?=
 =?utf-8?B?akI3WXV4UDEvRkZmNE9xMmN0OTBNSEN4bUpzTmVhdHFUWVNlK1dNdnczTFFm?=
 =?utf-8?B?N2YwdGNPMjFPN3NoN2JQQ1BvSGk0SEtyNXM5YW5nQlBrVjY3SmhhTEUyYzh3?=
 =?utf-8?B?UkE0bUlLUGFXRUxNUGExUlJveUFrVHNpeGtHSnZLUWJuUUpaWE0zOHdCcDVZ?=
 =?utf-8?B?ekdXdUo0RndiK2xtZVlkMDE5cHRxY0ZNNGgrTEtKbForU0lxejdZYjdGL2Rr?=
 =?utf-8?B?Mm9EcXFLWkRzUFNFTk1MSS9lckRxREpiWHJnN0dud0dBRXAwMHhnNzlhK1ZR?=
 =?utf-8?B?Y3R6Tm9VYWZaTDd1SjJHcktwNzU4S0lwN2JxZys4MWIzSUs1VjRRWFhPK0lT?=
 =?utf-8?B?akdDMmYxREpPWnBYNnc2bnBTektWSG1OUHZSV3Y5YUFPQy81RmpaNXNKYzZW?=
 =?utf-8?B?SXorQUxHMHViZzhpd0MySjBRbUlEWGlpWHpNVVFqRzhnbUJKTUw0RnhYWUZi?=
 =?utf-8?B?RTBPVjNuMDZqQ09KTFN1dDQ3ZWVKbWowTVVlSjZnWUt3SEN5eXU4WUhjakpx?=
 =?utf-8?B?cDRuZnZ5cUZEcFN1dzZnT1VYSDJGZmx3bVBmT0htVGhTWG02ZHpFajc0N09y?=
 =?utf-8?B?VU56cWxtY0hmWVVoRzRsUm9zblR6WVMveGFxRzJNNnI4dXJ1cmdrNExGTk9F?=
 =?utf-8?B?SGUvK3h6NGxlaS9IS0txRzlDSURnRTVvcisyc01KRGJQRjVid2pqOWFxQ1JS?=
 =?utf-8?B?RkNVZGgrOTBwTHRyVndoMXNHY21LQzN3MzN5ZE1FdjlubzNNNnk0MEtZYWpm?=
 =?utf-8?B?YStJMVplbU5hSEVKRGNxeUY0MDZxUDAzS1BhOEc3M2lJUDhEaUx1NlN2M3NR?=
 =?utf-8?B?WlFINXpoRUp5RmlBTXkrNng5NUtCQVNmbFl6SmxGYS9nRk02dW9Wd2hIUVBi?=
 =?utf-8?B?d2xLM29uMmluOVhzMkIxVndmNzZ3d2NYMHpjT0l1QUZjYmYwSGR2Q0plQTY3?=
 =?utf-8?B?RXVrN3RzUzZTV0VLdk9aanYwZ3g0RzJDN05sMGRMRHN4Vk1UQ2xYcFdPaGpE?=
 =?utf-8?B?bUNIVi9uTjFqak9wU1FYampLSUYwZ3NGc3owQWdGdlorZ3FFYStYT2dJd0FF?=
 =?utf-8?B?N1JWRVBsWVdwaGlEbTJybFNPVmlxbDd1OFFNSWZiYklwRldYV2JSNi96SXhp?=
 =?utf-8?B?Y1FtY1Bzb0ZobTRQTTNRRTNnYlY3R1hnRCs0eDdmSHdCRXE3N3dkVlVJRng3?=
 =?utf-8?B?WjZROXRnazFZU0JGVEZvSCsyUUhEUUdJOU50REgvTTdweXgwUm1zVHM4SGpQ?=
 =?utf-8?B?Yi9kRGcrak44R2hVZ3dEeFk2VXM5L0ptQ3ZCU0xpdHNPOGEwVWhMSjdBUmFK?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 283bfffb-61b1-4a42-7606-08dd51c92ba8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 16:11:02.2146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBH8gnyLuMlOh5dWvXjDWYC441UfnJbdkFkI66c9dINdLecPliX1MV6Scu2g6fcKJg4utYKRcmbUZaCKFjyjwz/9CMN5xF2qmZRR2CDfvLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8034
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

Hi Janusz

On Wed Feb 19, 2025 at 6:37 PM UTC, Janusz Krzysztofik wrote:
> Starting with commit ec3e00b4ee27 ("drm/i915: stop registering if
> drm_dev_register() fails"), we return immediately from
> i915_driver_register() if drm_dev_register() fails, skipping remaining
> registration steps.  However, the _unregister() counterpart called at
> device remove knows nothing about that skip and executes reverts of all
> those steps.  As a consequence, a number of kernel warnings that taint th=
e
> kernel are triggered:
>
> <3> [525.823143] i915 0000:00:02.0: [drm] *ERROR* Failed to register driv=
er for
> userspace access!
> ...
> <4> [525.831069] ------------[ cut here ]------------
> <4> [525.831071] i915 0000:00:02.0: [drm] drm_WARN_ON(power_domains->init=
_wakere
> f)
> <4> [525.831095] WARNING: CPU: 6 PID: 3440 at drivers/gpu/drm/i915/displa=
y/intel
> _display_power.c:2074 intel_power_domains_disable+0xc2/0xd0 [i915]
> ...
> <4> [525.831328] CPU: 6 UID: 0 PID: 3440 Comm: i915_module_loa Tainted: G=
     U
>             6.14.0-rc1-CI_DRM_16076-g7a632b6798b6+ #1
> ...
> <4> [525.831334] RIP: 0010:intel_power_domains_disable+0xc2/0xd0 [i915]
> ...
> <4> [525.831483] Call Trace:
> <4> [525.831484]  <TASK>
> ...
> <4> [525.831943]  i915_driver_remove+0x4b/0x140 [i915]
> <4> [525.832028]  i915_pci_remove+0x1e/0x40 [i915]
> <4> [525.832099]  pci_device_remove+0x3e/0xb0
> <4> [525.832103]  device_remove+0x40/0x80
> <4> [525.832107]  device_release_driver_internal+0x215/0x280
> ...
> <4> [525.947666] ------------[ cut here ]------------
> <4> [525.947669] kobject: '(null)' (ffff88814f62a218): is not initialized=
, yet kobject_put() is being called.
> <4> [525.947707] WARNING: CPU: 6 PID: 3440 at lib/kobject.c:734 kobject_p=
ut+0xe4/0x200
> ...
> <4> [525.947875] RIP: 0010:kobject_put+0xe4/0x200
> ...
> <4> [525.947909] Call Trace:
> <4> [525.947911]  <TASK>
> ...
> <4> [525.947963]  intel_gt_sysfs_unregister+0x25/0x40 [i915]
> <4> [525.948133]  intel_gt_driver_unregister+0x14/0x80 [i915]
> <4> [525.948291]  i915_driver_remove+0x6c/0x140 [i915]
> <4> [525.948411]  i915_pci_remove+0x1e/0x40 [i915]
> ...
> <4> [526.441186] ------------[ cut here ]------------
> <4> [526.441191] kernfs: can not remove 'error', no directory
> <4> [526.441211] WARNING: CPU: 1 PID: 3440 at fs/kernfs/dir.c:1684 kernfs=
_remove_by_name_ns+0xbc/0xc0
> ...
> <4> [526.441536] RIP: 0010:kernfs_remove_by_name_ns+0xbc/0xc0
> ...
> <4> [526.441578] Call Trace:
> <4> [526.441581]  <TASK>
> ...
> <4> [526.441686]  sysfs_remove_bin_file+0x17/0x30
> <4> [526.441691]  i915_gpu_error_sysfs_teardown+0x1d/0x30 [i915]
> <4> [526.442226]  i915_teardown_sysfs+0x1c/0x60 [i915]
> <4> [526.442369]  i915_driver_remove+0x9d/0x140 [i915]
> <4> [526.442473]  i915_pci_remove+0x1e/0x40 [i915]
> ...
> <4> [526.685700] ------------[ cut here ]------------
> <4> [526.685706] i915 0000:00:02.0: [drm] i915 raw-wakerefs=3D1 wakelocks=
=3D1 on cle
> anup
> <4> [526.685734] WARNING: CPU: 1 PID: 3440 at drivers/gpu/drm/i915/intel_=
runtime
> _pm.c:443 intel_runtime_pm_driver_release+0x75/0x90 [i915]
> ...
> <4> [526.686090] RIP: 0010:intel_runtime_pm_driver_release+0x75/0x90 [i91=
5]
> ...
> <4> [526.686294] Call Trace:
> <4> [526.686296]  <TASK>
> ...
> <4> [526.687025]  i915_driver_release+0x7e/0xb0 [i915]
> <4> [526.687243]  drm_dev_put.part.0+0x47/0x90
> <4> [526.687250]  devm_drm_dev_init_release+0x13/0x30
> <4> [526.687255]  devm_action_release+0x12/0x30
> <4> [526.687261]  release_nodes+0x3a/0x120
> <4> [526.687268]  devres_release_all+0x97/0xe0
> <4> [526.687277]  device_unbind_cleanup+0x12/0x80
> <4> [526.687282]  device_release_driver_internal+0x23a/0x280
> ...
>
> Introduce a flag that indicates device registration status, raise it on
> device registration success.  When that flag is found not set while
> unregistering the driver, jump over reverts of registration steps omitted
> on device registration failure.
>
> To make it possible, move i915_pmu_unregister(), a counterpart of
> i915_pmu_unregister() that is called unconditionally before registering
> the device, down so it is not skipped in any case.  Also, move
> intel_pxp_fini(), that apparently needs to be called on driver remove
> whether the device was registered successfully or not, down right below
> the jump target (though it doesn't look like a step that belongs to drive=
r
> unregistration, but that's beyond the scope of this patch).
>
> v2: Check in _unregister whether the drm_dev_register has succeeded and
>     skip some of the _unregister() steps. (Andi)
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_driver.c | 13 ++++++++++---
>  drivers/gpu/drm/i915/i915_drv.h    |  2 ++
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index 91a7748f44926..d3b30c3690bbe 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -639,6 +639,8 @@ static void i915_driver_register(struct drm_i915_priv=
ate *dev_priv)
>  		return;
>  	}
> =20
> +	dev_priv->registered =3D true;
> +
>  	i915_debugfs_register(dev_priv);
>  	i915_setup_sysfs(dev_priv);
> =20
> @@ -673,6 +675,9 @@ static void i915_driver_unregister(struct drm_i915_pr=
ivate *dev_priv)
>  	struct intel_gt *gt;
>  	unsigned int i;
> =20
> +	if (!dev_priv->registered)
> +		goto not_registered;
> +
>  	i915_switcheroo_unregister(dev_priv);
> =20
>  	intel_unregister_dsm_handler();
> @@ -682,17 +687,19 @@ static void i915_driver_unregister(struct drm_i915_=
private *dev_priv)
> =20
>  	intel_display_driver_unregister(display);
> =20
> -	intel_pxp_fini(dev_priv);
> -
>  	for_each_gt(gt, dev_priv, i)
>  		intel_gt_driver_unregister(gt);
> =20
>  	i915_hwmon_unregister(dev_priv);
> =20
>  	i915_perf_unregister(dev_priv);
> -	i915_pmu_unregister(dev_priv);
> =20
>  	i915_teardown_sysfs(dev_priv);
> +
> +not_registered:
> +	intel_pxp_fini(dev_priv);
> +	i915_pmu_unregister(dev_priv);
> +
>  	drm_dev_unplug(&dev_priv->drm);
> =20
>  	i915_gem_driver_unregister(dev_priv);
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_=
drv.h
> index ffc346379cc2c..27a23b1eb9de0 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -347,6 +347,8 @@ struct drm_i915_private {
>  	/* The TTM device structure. */
>  	struct ttm_device bdev;
> =20
> +	bool registered;
Isn't `struct=C2=B7drm_device` already has a registered field that could
be used, instead of introducing new variable. It's set in
`int=C2=B7drm_dev_register(struct=C2=B7drm_device=C2=B7*dev,=C2=B7unsigned=
=C2=B7long=C2=B7flags)`

--=20
Best regards,
Sebastian

