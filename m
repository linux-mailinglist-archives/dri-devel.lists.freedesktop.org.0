Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D95CF4ECF
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 18:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8313310E429;
	Mon,  5 Jan 2026 17:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VnSzFP2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013008.outbound.protection.outlook.com
 [40.93.201.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF3010E427;
 Mon,  5 Jan 2026 17:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZvCoxaCJ9roJFvPksPrxc9+7ugS8Y1fA21oVAn1hGHNnDiQzh87Edr1NzDBbT0QdVOks5hWE0ajBDu/JwU0Y+Aw0mBOuLE+0GBINa3jgAw4bNHQhdS70UFSHRCx1khEzGmfcUIKNLTvMzb52GHJdtrFUen+xCSqDQZ/3UXTF78TkFrfIuk1GU5XTTavcsw0AzR2frOsrq/zSJBA7r3c+0LIIKHQFUMisHCGbdV+0jxeJg3P4GgtfyOn2Jx+i6LO/YYwRFc0MaPL4ybBmTjsHzHbTn8bqm4rEYprb4GfR9JMERr+QcyQX/rah2q1ptgQPWNWx5W6HZcrXKb/9CyA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TO5M9TlNI+w0Rk3BIMxap0QEzkfTkTtgUz4ASEtwRyk=;
 b=sSOaC8Bbqt/PotZ1HEXLzAjb30S6ruTsWqDS7SIm9MuBDMeVb/xt079eUMCEOFzMkzPe1HI6NjhWXnee/yQrvNlusnFnITRO535g0zBF3aAtNodlOOhlhz7p9v1lUD81Jn2NHFhSm8xvzKY4ld6f+22sfpzjRftT+kFKmXce34+tB6L2i5qztw6FSLPMII2tvaH8Pe4UL0uCC5y0nE6+iMrZUvIjY8sEJfIN9qloBVX8deksKB0wEcGIH6AVORYh87DxutbtlbDw3Rn1/Zy2p1YV58XtOc8tQyD6tC5eTOpOELjp5EWToVXSBechml7WC1R4pFAXHnyItw2W2QXIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO5M9TlNI+w0Rk3BIMxap0QEzkfTkTtgUz4ASEtwRyk=;
 b=VnSzFP2wXLSxm06WALUeDhWOC7nxWemcpQCs9aCDh0WLPs5XSRsqdvefegmpWaxbpt8HGGKl0YDb7nBG+HUzHbH1Bfvd1Z+7WeNRrUNzXvC48T2tM8X7DF7e4qnJJtDa33fks1cIuTMZ7KQe4pgkuq56URH5Adc/6ktcMbFH9Q3O7v6a4I2T0TzzAxpyvR3sNoxQILNF+IyOgdoRRDxlVhtcjUDkHg/tkfKXOGQQFaSYRYWsatVxnZYy2jJWs7CG9puVbw0IGDQIDRt1oAo86NkvR6RYba2sxdv13qrdHJlesHVYrQ7uCgzKGxVTHMSaSUMhjvaQe907T+9zF1hW2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH0PR12MB8485.namprd12.prod.outlook.com (2603:10b6:610:193::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:11:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 17:11:39 +0000
Message-ID: <d642ef4c-145c-4b16-818d-153c8f2e3485@nvidia.com>
Date: Mon, 5 Jan 2026 12:11:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
To: Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Yury Norov <yury.norov@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Christophe Leroy <chleroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2> <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
 <937926D0-00DC-499B-9FD8-D921C903882D@nvidia.com>
 <aVmyZ0iXzTkNU86y@smile.fi.intel.com>
 <20260105113902.6bdfcfa8@gandalf.local.home>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260105113902.6bdfcfa8@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0315.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::20) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH0PR12MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: 908436ab-a6cc-405d-1510-08de4c7d7d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnY3T1U3Z1lGVWtGV2lmR1kzdnpCOVhaMGZZdEoxR0FVYnJKTGxXVmRrazZj?=
 =?utf-8?B?K044L2xIRGxUYVdKV2QxMm9HNUUxOXM4enVsd0tVbkdWeEd1Q1FUTnlZWTZx?=
 =?utf-8?B?Umg3U3NvWTR3V01iTWNJcjdpN2s1KzRVR250OEhucjJISFlFanhUT2U4R0hF?=
 =?utf-8?B?SmswS1hzMjhHR2FhREJDQ21DeFVycGRqOHEzbE5SdFViY1NYaGxuMTRHbUFC?=
 =?utf-8?B?MlBRcEFLdXVQOEI2YVlSRkJUd2VYRHlPaTliM2VwdzFOWXVVZVhWcittSDM5?=
 =?utf-8?B?MURmc1JWdkNQUE9QUTFqVHdhSlBKV20rQUUwSEJqb0VxWnY5emlIOGd4clZo?=
 =?utf-8?B?Z0M5VVpqamdPVEZ3TFVuN2xLbUp2VnFwNWlJNFBvUldMQ2R1MXZCNWk3dU1o?=
 =?utf-8?B?V045Wm91R29kallMMUVJU0lkN2xsUUZ4dlowRmpTWHNDSkwveFVYaS9uRlBO?=
 =?utf-8?B?K0g2aE9ENTFYM3A2TGcwaVV6VHE0VWU5dkdyNEhwQVI2N3BMMVArUkx5NG5M?=
 =?utf-8?B?MTliRE5IWmE0T0FFRFQ0SW93ckpSRi9IUFF1czI0S2xSeUg0emlVVFhHa3hN?=
 =?utf-8?B?bXZ5R1BTbFhnNXBQTmtJMkl1UEtUSzhsZFV4VHBYV1RlT3VvaURNMkNHa3Ev?=
 =?utf-8?B?dmx2cW41QVphNXJWbDhlUUI5RmUrcHZEL0dNcnVBa2VMQnpRZXM4K1dwTm11?=
 =?utf-8?B?RDJpWjUxN0dUdnNmZEZ5WG9GRGhwYkFDbDk3TmYwWkVLVUExeWROTkR5SnJS?=
 =?utf-8?B?LzJuS1FQRXc3ejQ4RmI4SEVkVWJDTkxkVDdxdnhKd0xzUTVwZ3h3ejdIRW1y?=
 =?utf-8?B?MEVSb2VLS2lkWnhMQ1pXdWxGR0doRFlRQjFYS1NPRXNhVXprQXliT01uSlU1?=
 =?utf-8?B?Zi9ZT3p4Vk1qVVh0VWEweU5UeDZpNDhhZEdDeEJNRE8rR05yU3lpbnlraTJ4?=
 =?utf-8?B?SFN5WVJrMk9nYW95c2c1YlJVWGhxekdhb2FOZlpkVGtJSHdOazhiWHNoYkU0?=
 =?utf-8?B?N1lOMVl0NVlEbDVKemcvWXVXbk1nNjYrZkhZWkpHVDI1SkJqU0Q1SUhwM2g4?=
 =?utf-8?B?b1VUNk82U1BrZ0FMaEcrOVplSVZPZ2JIcGsyZXJlcGRnazFuMS82bE14dzI5?=
 =?utf-8?B?eDRJajlZVjRVcXl1Nnc5NkdZaC9GenZpQnBkYkNVcURIVGx2azVrblA3QWJE?=
 =?utf-8?B?ckxZQ0lqMnpXVEdEMDRpWGNneFZ1RmlhZU5yN0F3aEZyWi95VlVoakQrWFNL?=
 =?utf-8?B?Y0RYcTM2ZHBISERiQmdTUDhORDJPaHk2S1RQaXUrMi9PbU5LL1U0cEZxWURq?=
 =?utf-8?B?dlFicmFnTWlhZ3AzR2N0bHp5MFR3amQxTjluOTdCdVFjdkRzUEc3cS9CZ1lW?=
 =?utf-8?B?WnJWekZLc1IrKzhxdGtGTFZNUThaeEtwWFdxZ1dueEU0V21ZMHhxaHNIKytF?=
 =?utf-8?B?azFGQTMyT1RQVlhub0NILzZHSjZGK1d2V0xrdStvb1lKcnJwdUdqQ2Q3MkRQ?=
 =?utf-8?B?QWMvalZmRUs0V3NvUTNQRzhDSFdSWFhkZDY1c1NIaHcrWWw0QUFKMU1jNEEv?=
 =?utf-8?B?ZDNEVW14L1NKNTZKTkhjVERCc216VWlqV04zbjZqdmpyVFNpY3hITE1odko2?=
 =?utf-8?B?NHdqeEMvT2lYaW9aZG15WnFYbXIyZzZNWWxUMEFPdzNLckdIR0pUTWYvSnNE?=
 =?utf-8?B?aXNyN2toMUVrL2wxVGNKUFBWNUVQR1d3a09DbGRLUFM1QXFHNzlkR01xZFlT?=
 =?utf-8?B?TEV5VUNkVm9vRUpQTnF2Um9RM3laUGlaaGNwUkpxSkhSS1FsQmVmOFEzN3VY?=
 =?utf-8?B?WE0wRWxpeEVsUytrNkdMd3d1R2V3Tm4xMDA4QTBVU2Z1b1pQR1lUTzdzV0Jv?=
 =?utf-8?B?YzBtWVhxY0tiSVhDbmJKQzZDNUlsUFF2bVpQdWJGNDVtbkVtYUFXQm5TWWNT?=
 =?utf-8?Q?NGdbNisrRcLMRZ5ZeTsVeMhZjDCB3yNp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFJ3S3ZxK0QwREMvS2I1TVNRUFVRdkk1bVZ0NHVITGsyVWxHQ1ZXUFNGMXRl?=
 =?utf-8?B?Q3RMSzFzemM1VXVRanRaRDJjemVMajZPYTIrbzJWd1RKUDBEOEIvMEg5dzd0?=
 =?utf-8?B?L04ra1JhK0tZbTVkSlpSS2s2bzFEbmRCc29oQXZUd0VLcWllSk9lVXRlQ2Vr?=
 =?utf-8?B?enAwSWV6M0pab2RRM2tSN3ZnZGxTUTVRdGw0aTBEWWJ0amNTVWhVMjN0bndP?=
 =?utf-8?B?OTEzYlNKcXVZM2Z1NCtoS3hkVXZ3OTRJdm1vd2Job3F0UGtZcktpTjBIaEVL?=
 =?utf-8?B?NGd0akdKNUwrRHhOY0RYUzBXUUtYZmd2bzdvbEIxcVFiak5nUjUxSzVuLzh4?=
 =?utf-8?B?VVdYeVh1S2syWUltQ0NORlpYU29CTDQ5dVBXeU82b1BIRHhqVFhENFdhVFNv?=
 =?utf-8?B?dkRBU1Y5VGxyTWJKUXN1WTNLK1VBbVdyTWdaZjBaVUpMejM5OHBwSzMzdUZj?=
 =?utf-8?B?SnpiOEJMTWU0RnYyZTk2U1pmUUptY0Mvd1NsUW9Od1FJT3F6NU5wMVNLSHVS?=
 =?utf-8?B?YUs3eDFyNW1RdWVvS2lCTGRmeDY3WkNRS1U5NitZNFNWWTRYQk05TDc4RU5n?=
 =?utf-8?B?ZFJ2S0tlODFxSmtFRUNQd2JMN1gvcWJ4M1YyZ1YvOTJEdy9xbVR1S0lpV0hC?=
 =?utf-8?B?VDVxczZrMG82bmphQ3FFQ243UXRIWWFEQ3NMVFFlNGlidndCVS9udkRFeUxC?=
 =?utf-8?B?bkhHcmo3ZWpoQ0t0T1BPQ0w4UGpsWDBMN053d3VKTUQvS3kwMWhsd3MyT3Fo?=
 =?utf-8?B?bTJWQTZBMVB1MzA5dHZxMDd1YnVhSWxFNVU3OXNKNkVMazhoYVQ0L3RPNnI4?=
 =?utf-8?B?SzkwVnVGK2NWbys3UnRNeDNHNUlhYkgxakNXMmhkNlJSWEcvQ1A4Mk5NTEdO?=
 =?utf-8?B?azYxUnVhN2tNT1BMaTdBL2lKWEFmUUV6a1BuNzBvdVVxbHcyS0lHRCtDd1V3?=
 =?utf-8?B?K0JBMmpmMmhYMm93VElWL2d0My9HZ0JCVmxZZC84WGZEcnBZVGIreFhDeVk4?=
 =?utf-8?B?MzNHaTg2aHVKa0pkWUN5YmFxYnhZemtEK3NHZi9NWWRyaHpOUUU0Q0w1MXdk?=
 =?utf-8?B?QWM0WWV5cUduNWtGTml1RUtRckp3Z1d4bkFPN1g0TUpyRWVISGQyeStwUTRl?=
 =?utf-8?B?ZTZ3QVV4bDFRZThGRlIzaVNQRVgvd05Fb3lFRnduVXA4VmpaTTU0TVJYcmM0?=
 =?utf-8?B?TnpkdGQrNGltTVZRSDQ3czVtaDRFSnlvMWxiVDdnUzdQWjZGTnlhNW1pZlNn?=
 =?utf-8?B?bERzK29GT1NETUhHREpLSnpHSVBDbjN2MnB6WDdqKzIwMk9Jem5tU1ZsRndB?=
 =?utf-8?B?d2o3eDFWZGpwbVUzWXhxcUhrMVRmY1NuRUlMZEh5MWhTdTBybUpXN1dQR2o1?=
 =?utf-8?B?ZkFXbVJMRnRPSy9kczNhYTlZQVdDUzdMNFQ3VXNXWVJWNk14T0NWTlY5UTIw?=
 =?utf-8?B?eFh5czRZU1NLWGpPa25pYU1QZ1huWktLcG9vL3VFRGJRTHZzK2NVZHZpeVZH?=
 =?utf-8?B?TnJrYUVBS08zVmo2Y1ZyU2hnQXdRclVNQ2Nod0h1YnhQUExEUjJuRGVFNTA2?=
 =?utf-8?B?R29xbVFJVk1nOENEcFFLOXU2NHBGYXFUcmllNkJaK3NvSHBNZlFpRExzb1hO?=
 =?utf-8?B?WitXRVZQbmw2Q1ErNGVhNy9XN1E2aFkyZU5SNjBqUVlsUmpEdFh3V25paDZX?=
 =?utf-8?B?Kzc1S3FBZWUrbXNMdm03U1k1TjNQbGhxQzZxT25nUFh0WFVPMHNUR3dNV1pQ?=
 =?utf-8?B?UnlNaWRFQVVRb3RWWm9KV0hGZ2s5K2ExakZkVndrYzhvTUZyYzNwckJOa3FY?=
 =?utf-8?B?eUFlYisrZ0xPMndqN1dCMkxSSDRydGwyN3NYOUJFYThaOHpoZExXcmhhNkk3?=
 =?utf-8?B?ckxFT3hyNG0wSlk3cVdEOXRDZ09idTFaOTlBN1luRmw0KzB4cExyWGJyWnIr?=
 =?utf-8?B?M0lTTmtoeE5CM0l5TUJkZng1OGJlYXpnbjNWMlk4QlpIWEU2K0FZcUlxYVlC?=
 =?utf-8?B?a1NpamRlZEJMa2tVZXVjVUg3NmRrZ2Zpa2w5RVhjc2VGSVE3UTUrSEFEdEh3?=
 =?utf-8?B?VDNKeXVDelZJTFNkSEMxNU1RdWRJdU5ZSEx0QXo0RE1Ic2FBcDM5K1V1eXNP?=
 =?utf-8?B?c3VjUFM4ck8yVSsvRHZMQjNESTdWSnZLUHVoRStsR24wWStsSko3czBWQkJ3?=
 =?utf-8?B?dkFiSm5ZT1kxQkZ0Vm1TTy8vSm9keDVYQXgreWl0ckcyYjREeGtETlNERStr?=
 =?utf-8?B?NFlHVHJPdmUvajF1QTg0bE9uczRvWWhXMS9NbVVobWJmVzJuMmpDTXdaWHBU?=
 =?utf-8?B?ZUJnWHJlWGFsY2RhYWQwMTRYYkhhMWJTRi9QeldtdVNPN0RkWFBDUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908436ab-a6cc-405d-1510-08de4c7d7d84
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 17:11:39.4931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KC+hP98LmRUacBQwOgX7fNUpaTsra49oDaHmT9CFTq3r/y5Bq0u4Xp6O93LBT66adEvztbbaKPvKu31yIr9Piw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8485
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



On 1/5/2026 11:39 AM, Steven Rostedt wrote:
> On Sun, 4 Jan 2026 02:20:55 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
>>>
>>> I do not think it is necessary to move it.  
>>
>> I'm not talking about move, I'm talking about the C 101 thingy. Any custom API
>> should be included before use, otherwise compiler won't see it. Which header do
>> you want to include to have this API being provided? Note, it's really bad
>> situation right now with the header to be included implicitly via non-obvious
>> or obscure path. The discussion moved as far as I see it towards the finding a
>> good place for the trace_printk.h.
> 
> It's not a normal API. It's for debugging the kernel. Thus it should be
> available everywhere without having to add a header. Hence, the best place
> to include trace_printk.h, is in kernel.h.
> 
> I'm thinking that my proposed config option is the best solution now. For
> those that do not care about debugging the kernel, you enable the
> "HIDE_TRACE_PRINTK" config so that your builds will be "quicker". But for
> everyone else, it will not slow down their workflow when they need to debug
> code.

100% agree. We do have people running custom configs for faster builds, so this
hide thing could be enabled there assuming those don't care about debug.

In other words, "If it aint broke, don't fix it".

 - Joel

