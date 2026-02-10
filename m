Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJs2FAHRimluOAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 07:32:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B648811760D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 07:32:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15DC10E229;
	Tue, 10 Feb 2026 06:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GcHdJFd9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016A610E1C5;
 Tue, 10 Feb 2026 06:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770705149; x=1802241149;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v8Vn7Si35mwTql/y7DNSHyvvnkJEXfyjGuQV5BMC8/M=;
 b=GcHdJFd9GzEZSZ2RoyVIzGvQ4JUD0fmXT012RiGt0o/ctYHmKnzNPuWY
 gB7xKO+w2KTRaVbM73BS2PmndwQr4kAb7kCaTgAKQin7QERBVOrW51Jto
 OJYUsG3pppkp6zyloc9nkn+noXvjsKczZZm7hYHO0LInCngHDAwPYHFID
 kLL7V7GpPzLncz2gclByevx6mBlYCwKV0Uzs3pQXR2NU9d/MwuN9kjZ2N
 fgiPQA7R0wO8zC6yE755yqeXNp3O0HdUi4WZWdg4avYBXVJLQjDR959Q8
 Jj5VTF6YmPUluh4LM+0IB23HhMogWmgLUap9i1y6He56kfA7qZz0xT5Jd g==;
X-CSE-ConnectionGUID: y11xwrLzQ4yLiKEdAFW/yg==
X-CSE-MsgGUID: 6K88GQgiQOWHlKP6JYd6kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71036251"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71036251"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 22:32:25 -0800
X-CSE-ConnectionGUID: wLlpaz8ZRsOWrGXq8XZlvA==
X-CSE-MsgGUID: g6n258s4Q0eaoVEqSB7vrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="234779559"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 22:32:24 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 22:32:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 22:32:24 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 22:32:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjHimwaUxutBnLQHOB1NGIo5qGU4GNLncISfrYG20cRB4zBVDvd57Tfm82wp0/cbHfuNiwN4en3kZu8Soj9CY/oII0FyWNXVlqxHMubQCG2Xwhgz5+8zP//p3TMCWy8sGzDrZZMnNyK0cFsLElCLIT60Ca4nUMte/vyjz1l35vK8+Z/ZqM3xPChpMTaFczrF4NxHKX0cNt8TViDPjTVvtZyCg7h80jQFK+Ogr9GKmx7BPIefkS6g1K4qteJRPEUL8SSuFiPt0GXSm9FJDmq9NNy+m5j61szJIWNcru4eBIxg0UWMuMouy63Bh0tj5mcm+u8K0murfwoMGUG/M7bL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Uy47CPXCJTtmXET81BsdOrExq4Gk6B/9EjXGW+/Hdk=;
 b=nbdxT960RkxbJSXnHBeWJSpdrf91FDmMIWaDkLmT1E4dY43Zp9rPqgytfLJwW2H+WfRZQ8a9oDqBYgxf50vcq4ysvaea7i2p/dLuYAFiRtWqEah3TAsvfSqjgkfiCbXC2l3CPMqqsZII2oKi0994OM9UgRDSF/b8+J/p0kFuYtY69Dm5gg+jWWCuoZ/GpKVko9KdGWBjQpuTgYRKSsb/lcw9sS3hFJ+oNrqFpzeakB3MOBnYE3fJiSeyfgRXZpT9Z1oLQZkCGNVmZetrDA/bJjbmM5ClDrBpYl8C9+OQ2e7JDBnezYOVbNTA6IYLQLbxw9gqnUYqQ4d3r2DQyQzRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by SJ2PR11MB7476.namprd11.prod.outlook.com (2603:10b6:a03:4c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 06:32:22 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 06:32:21 +0000
Message-ID: <b1dc4aea-9c0c-4a47-9d13-c000651e2ec5@intel.com>
Date: Tue, 10 Feb 2026 12:02:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] drm/xe/xe_hw_error: Add support for PVC SoC errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <aravind.iddamsetty@linux.intel.com>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20260202064356.286243-7-riana.tauro@intel.com>
 <20260202064356.286243-12-riana.tauro@intel.com>
 <aYTdFPXDRUsT7JGe@black.igk.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aYTdFPXDRUsT7JGe@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|SJ2PR11MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: d92ed6cb-bae8-42f7-f72f-08de686e2544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGNoWjZGdDNFY1NBT1hVZ2NVQVU5R3JndThPQnRjMFN2RnhuYWdJMFk5TTUv?=
 =?utf-8?B?TGxIMUpwVTE1MFJxb2hTRGdlK0FoQk1mQmVKR2E5QzNrZ3Bsa0hLVGpmSGFK?=
 =?utf-8?B?WStRYXh6NkU5WjRXR3hDL2NtZGsvSjFEeFVHVjNXb2haY0krTlJqbmducGkw?=
 =?utf-8?B?aHh5NkN5ZHQzdnBPYWwrRlA1NVA1Z3lMOWxNbmQ3Tzd3cGJZUDdsQlpwU1lB?=
 =?utf-8?B?am5tdi83QVNiclBmcVJsMjJJaWxIcWV3RkhVZE5nQXhRalRVanNyd3Y1QXFi?=
 =?utf-8?B?cFNpcllIcjhXZDI4MlMrS25qYTk1aHgxUlFEQUg0amJjZnFteElLZlVFWC8x?=
 =?utf-8?B?VE43NG5GMjh1aG9kQVFKblA4d2Q0NGhaNG5peEVBRGhaSnk1TDJSV3lvRnBy?=
 =?utf-8?B?NC92aVVtbnpCMzE2R3d5WGhOVmJhNmJ5UTUxbVljWVpCSlNOVDdhczAzRXZM?=
 =?utf-8?B?Tng2WGlHTDRPNEsrdWhMZmNVMEJlS1NTOVN5WEJaVWRlKzhiVWI3eFZUWUdN?=
 =?utf-8?B?U0ZBVkM2TklhYkxPbWdaNlNWTkFaQWVrV0x2eWhoZldEb1NnSVBXdUxldUVp?=
 =?utf-8?B?eEQvTkVud203ekd3amx0bGkxTERXVWd0SUNGUUlSY0xqWU1hUDRHY0pPUjh2?=
 =?utf-8?B?Tmw3VU9VYzJybE9ibU1nOHlQNnlkYmVuNE1yRlloSlQvZWg3YjhGdy9qUCtL?=
 =?utf-8?B?N2trcXhPVlZJTkpjSEFNL1loLzk3Ym92K0hoMkRKZnZDamIySXFGOUFyam5F?=
 =?utf-8?B?RTZqQ0hQT1F4V2lMQ2RJMkpGMW45NFFpS2dYUGVsMks5ZzNBb3cwWVZTa0Vh?=
 =?utf-8?B?aTRBUit5ZzBPOU5nMWtMNmhVbjdTeVVrNStJOUc2OVU1aEZYME52cG9sbzdE?=
 =?utf-8?B?SnhmcTRpeFRKT0R0eVlUbGN3R1c2MFIrVE1UczVBM0N0TTgrOGd5ZGxnTGpR?=
 =?utf-8?B?elRmZ2FoYy9QMU5JMWtNNzRhOTdDSnQ5WnBFZEZmQkZSZm00YXZRa3dYeTNX?=
 =?utf-8?B?SjVhMms3T1ZFMTIrQWIwelltWUJmRVV4UmJOQmxUa2lLZHpjSUVTZUNwY01Q?=
 =?utf-8?B?eExhYzRieDQzNDR4OUJiMHZJaTRGWWpxUm1ndnVXZjE4RVErckMwbklqRHVm?=
 =?utf-8?B?ZjZYNU1na09IMnZubXNEOCtjZ2lMS0FucGt3aGwxK2J5NTBmZGhMRk1TZmFP?=
 =?utf-8?B?N2Vhd09nQTJ6OWxVYlVBdEZaZ3JOSUgwZHNZZ2JEaWk0d1JDZE9rdW94Z1l5?=
 =?utf-8?B?eGRNbnd3VDhpM0IzWWtPU2FBcVBZYXNYZHZrd2MyejYvUStEVy9KVE1DSllI?=
 =?utf-8?B?SC9Dc3I3TGNURStnTVVrOVdMR3RrbTF1aWtRazRBd1VvTGJ5MHpNMGIwSEww?=
 =?utf-8?B?bDNrVHdFSWkyaFRGM0Qrak5TdE9ISm92L0ZlcTJ6UzU5VURkWmxsemwvY0Yz?=
 =?utf-8?B?bkhSU25ZNkprZ0V1TzBValovNzhRWDViS2dhZTNXTm5uSVAycDZpMm1OWnBT?=
 =?utf-8?B?OTcxUWpWMnQrd1dFZ2w3bDFTZDIybG5kNVRmb3BVbEJEcVJhQUNROW5za3dR?=
 =?utf-8?B?anVWbGxyQW9lS09kZm1WczNzZ2Q5elhNVitsaTVHNEhybW03NklCc3ZzUDFQ?=
 =?utf-8?B?L2NUaU8xcnk1dndJWVlJdzBuNzZtaDh1Q3dGREpwdXMyN05oRXAwMXM4VUdu?=
 =?utf-8?B?dXVZUy9xRDRSb1psYXdrcEZmSnJ5ZDA5bVdMVVlnbkFBciszK1VoUGZhMExZ?=
 =?utf-8?B?N1hmcE9heWltdEhJNzRzMUt1QktVWTdjaHZHOXAzQWhkZHdVdGtsWm9GRUxN?=
 =?utf-8?B?eERsMDh1bEt0YXg1Tlp3bFRnb2p5WXZXWnBDMUlLV0VSOVlnN0toN1Y0NTJz?=
 =?utf-8?B?aE8vYTFRMWpiZFBDLzIzajRSVzMwdmV2VmJORmhVYkxzZWkrL2Q4MXQrZTBa?=
 =?utf-8?B?VVlvdXBLK01YN211dFY3RmRKUlozd0JqT2JnK2NxWngxNFFPYjJ6aDhwcGNp?=
 =?utf-8?B?RUlUYWFyK0YwdnRvQmlxL3JDSXFORkhRVGk0UVJOK3haQmNwaExZcWY1bWhZ?=
 =?utf-8?B?S2M2NWh0aTErd2xHdGRoYVptS1JsbXJ4WU1walQrTEVtREJPSkNxSjlac3pI?=
 =?utf-8?Q?GVIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0YzM29KUXFNck8wcFJqQ21nSXQ5cVdVVU94eU5BOEVpdDljcWptcG9peDE0?=
 =?utf-8?B?ZDdKby8rOEFuNG5yTjFJSVl6UVA2a0hkdHkxMGsydHhHOUR1N0RCN1gybVRG?=
 =?utf-8?B?SERZUktibEVNaFhSTXVzektzbGdOQ3Y3VENNaHN1SDdXa0J4MlpEYXh2NHEv?=
 =?utf-8?B?NjhSL3owZ043dGV5d2RRWTlnbmJONW5xZjBTN1JkMGVxQUF0U1g0SVBZQmVZ?=
 =?utf-8?B?by9VekhjdzZTek94anFQekcxc0R0WUJpa2hOSjQzR2kzK1h2UWRoU3ZVUXZz?=
 =?utf-8?B?NW1DUHM2emptMzA0QkcvSWR0SFltMU05dkRXaGFsbGR5RkNIV3E1Wnhta1R1?=
 =?utf-8?B?emtudVQybjJKY21MT1lQSGZBMWZ1eGZobE0vTEJES1FYVTFEZEVTc2NhMmJU?=
 =?utf-8?B?aDJva0ZmVDlHamszb3JWS2w1WDMrRUxObk1KM3Zad1p5V09TVlVlRXYvK0Rh?=
 =?utf-8?B?UzBPQWE0Q3RIaVNaa0xDMWk0bUtpY3RVZVo1aWZqZ2VQZlZrVTlVTHd4bVZi?=
 =?utf-8?B?a0w3dTBUSVd4eitaMFRVdlBYSXJFZndxUXJjc2E3Q1R0b1pLbVR2RDdBdjhZ?=
 =?utf-8?B?R2FEcmh0NkszK2FYMWt5eUlFM2haMkwrZzN3UGR3Rmo2dzgwMnFheGt3ekFo?=
 =?utf-8?B?S1VFUEFCdjFJSDBJS2prVjllQ2pTejVxZWdoeG5yRnVhWXVQd2IxdzN3Z2pp?=
 =?utf-8?B?dmRCcFJmRXhtU05FY1RIbk02aHV5TlFqR0hFc0svV2RLa3o2MnRpU1VXZkhK?=
 =?utf-8?B?RXBlLzVqVEp6RG9JT1RIbG9hamRmeTQ2dUl6MjFYV3RrQ2E4WkQzS29LMVMr?=
 =?utf-8?B?SlFNZlJvSUYzMzlVMys2M2s4UTd3b1lHUFVndkd5UXlLWk5HdWQ3dWdzVVFN?=
 =?utf-8?B?S1dKc29idm1uUkQ4cTlQYkVKZDAybElXUThMWXZlTURNM1oyZ3R4R3RLbXkz?=
 =?utf-8?B?NXNRckpXUjdJbVhQaSt0YlgwWjlLU0U3QTd1Z2pPM21Sdmw1Umk5eE1KSmpw?=
 =?utf-8?B?dDExYmVyTCtMeWVwV3ZUN09yQjFEb2J0d2h6QVQwYWFRdGo3SjhwZjRFM0JS?=
 =?utf-8?B?LzlhOVlWR0tkT2JpUkMra3l4eEhJbWMxTkRpMTFweDF5elJjdTFpakg2bHV6?=
 =?utf-8?B?TVNYbmc4ejlLUGtmTzVPWWJubEZsZFhrejRZNmg1ZGlNMjZTM2dHSmlsaTEw?=
 =?utf-8?B?T245ZDNkV0I3Qlc4WHVEanlTejk4QmZYMDhXNzcxMGhuVm5FTHBYcmdPdlFD?=
 =?utf-8?B?WEJhaEVhTk9LNThocEh3NlBlQ25yUG5ieHFuUm91Sng2VGd6Y2c5UUtJVWd2?=
 =?utf-8?B?UTZ0aHBmRXVXcUtldXFham9KK2hSTVdiQ2cwdlpQQmRQYkNaa0x4ajlHWUxm?=
 =?utf-8?B?eGVINlVuMnJwWTRvcm5qc21xQ1RXTnY0Skh3VERmK1VZZncyVGlWcUlXeE42?=
 =?utf-8?B?Yk1Gd0tFWGR0YlhMUHB3Zko3ZGVNSm1DTSt2U3hsRHdqZ1R2cjNrUS9VRTZz?=
 =?utf-8?B?bWdnNGlzMG1hZzg0aWdhVVRwMkxaY3dTNThURjd6Q3Q2c2NKc25QRVRLRGZE?=
 =?utf-8?B?NHdSS0VwMW1iM2RvaTZlYmFCcHNvYks3cllqS0EvNmNpeWJqLzNUM0FlTzBk?=
 =?utf-8?B?d0lmL1RPNVVsNlhrOUo1d1d1S3BnUG4zODRZK0dHRkVmUnpFVXlBcTliSnd3?=
 =?utf-8?B?bWxaNUU4WmVFcFZSaTNaNHZsSVVEY3JVNXRIcHA4VElzRkEyYy8rQjlNN0Fy?=
 =?utf-8?B?NXhFU0lVZVYxZHJVSUt0c2pFcWZhWFVxQko0NFA0OGUrMWN4eDk4aHpsOFRW?=
 =?utf-8?B?akNueXVCTHhiN2xkazk5aUxob1UzTjd2OVFBSjZ3YTA4QTlPSEpiKzZRYXRK?=
 =?utf-8?B?S1ZsQXlSTUlKWmZ4OXlLKzZ1dWY3T2NIcitDYUFrbnNLbmVBU2lMWndYb3Vx?=
 =?utf-8?B?dXlyLytCMnFZbkI1blFCemtmSExuNm5rMCt2cVMzL1RCQy9qU2ZQWG4yOHRX?=
 =?utf-8?B?dE9yUjdtSHVMeWtuVDJPWVVIWGdaejZOcm83RVlmMVpMMVgyNDV0ZTVwd1BT?=
 =?utf-8?B?UnVqNzNXWCtucGVKUEt4NGRlM0VKVFAzNEp1U1k1QnRvcElrZWJtS1lVODRX?=
 =?utf-8?B?cnNRWXgzdmtYYkc3ZSs3dnBGWmIxcmlyYTBuWEFPY0hTaGlVODNwQW9Bb2xO?=
 =?utf-8?B?SzJwLzZ2RW5Xd3MrSFBpa3VMU29rdGRRNUY0K043aUZTN01jaDkzTTVXdHBD?=
 =?utf-8?B?NGlmV250d0JBTlY0R1I5RGJ6RzZVZm1nckM4NEVTSzBZWnlxRGQ4eEdFSHhL?=
 =?utf-8?B?WlFEU1djMmpRZVNmR2w0WWhjd1ZGTHJpVi9KYTV5aTNFTjRVUk5VQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d92ed6cb-bae8-42f7-f72f-08de686e2544
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 06:32:21.8214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsKWoHFlwX1oEOF9A4IxTcFwQJpipBYKFPwTESSSnu3VuEDpHxx9KZvPJDs1wWAeGTqUEDIyvJrYhBFaBcxDTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7476
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[riana.tauro@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: B648811760D
X-Rspamd-Action: no action



On 2/5/2026 11:40 PM, Raag Jadav wrote:
> On Mon, Feb 02, 2026 at 12:14:01PM +0530, Riana Tauro wrote:
>> Report the SoC nonfatal/fatal hardware error and update the counters.
>>
>> $ sudo ynl --family drm_ras --do query-error-counter  --json '{"node-id":0, "error-id":2}'
> 
> Same comment as last patch.

the second line is the output so not necessary

> 
>> {'error-id': 2, 'error-name': 'soc-internal', 'error-value': 0}
>>
>> Co-developed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: Add ID's and names as uAPI (Rodrigo)
>>
>> v3: reorder and align arrays
>>      remove redundant string err
>>      use REG_BIT
>>      fix aesthic review comments (Raag)
>>      use only correctable/uncorrectable error severity (Aravind)
>>
>> v4: fix comments
>>      use master as variable name
>>      add static_assert (Raag)
>> ---
>>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  24 +++
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 221 ++++++++++++++++++++-
>>   2 files changed, 244 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> index 17982a335941..a89a07d067fc 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> @@ -41,6 +41,7 @@
>>   									  DEV_ERR_STAT_NONFATAL))
>>   
>>   #define   XE_CSC_ERROR					17
> 
> I overlooked this in the last patch but I think this should be used as
> 
> 	if (err_src & REG_BIT(XE_CSC_ERROR))

Thanks for catching this. When i changed the bit i retained previous 
code. Will fix this and test

> 
>> +#define   XE_SOC_ERROR					16
>>   #define   XE_GT_ERROR					0
>>   
>>   #define ERR_STAT_GT_FATAL_VECTOR_0			0x100260
>> @@ -61,4 +62,27 @@
>>   							ERR_STAT_GT_COR_VECTOR_REG(x) : \
>>   							ERR_STAT_GT_FATAL_VECTOR_REG(x))
>>   
>> +#define SOC_PVC_MASTER_BASE				0x282000
>> +#define SOC_PVC_SLAVE_BASE				0x283000
>> +
>> +#define SOC_GCOERRSTS					0x200
>> +#define SOC_GNFERRSTS					0x210
>> +#define SOC_GLOBAL_ERR_STAT_REG(base, x)		XE_REG(_PICK_EVEN((x), \
>> +									  (base) + SOC_GCOERRSTS, \
>> +									  (base) + SOC_GNFERRSTS))
>> +#define   SOC_SLAVE_IEH					REG_BIT(1)
>> +#define   SOC_IEH0_LOCAL_ERR_STATUS			REG_BIT(0)
>> +#define   SOC_IEH1_LOCAL_ERR_STATUS			REG_BIT(0)
>> +
>> +#define SOC_GSYSEVTCTL					0x264
>> +#define SOC_GSYSEVTCTL_REG(master, slave, x)		XE_REG(_PICK_EVEN((x), \
>> +									  (master) + SOC_GSYSEVTCTL, \
>> +									  (slave) + SOC_GSYSEVTCTL))
>> +
>> +#define SOC_LERRUNCSTS					0x280
>> +#define SOC_LERRCORSTS					0x294
>> +#define SOC_LOCAL_ERR_STAT_REG(base, hw_err)		XE_REG(hw_err == HARDWARE_ERROR_CORRECTABLE ? \
>> +							       (base) + SOC_LERRCORSTS : \
>> +							       (base) + SOC_LERRUNCSTS)
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index ff31fb322c8a..159ec796386a 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -19,6 +19,7 @@
>>   #define  GT_HW_ERROR_MAX_ERR_BITS	16
>>   #define  HEC_UNCORR_FW_ERR_BITS		4
>>   #define  XE_RAS_REG_SIZE		32
>> +#define  XE_SOC_NUM_IEH			2
>>   
>>   #define  PVC_ERROR_MASK_SET(hw_err, err_bit) \
>>   	((hw_err == HARDWARE_ERROR_CORRECTABLE) ? (BIT(err_bit) & PVC_COR_ERR_MASK) : \
>> @@ -36,7 +37,8 @@ static const char * const hec_uncorrected_fw_errors[] = {
>>   };
>>   
>>   static const unsigned long xe_hw_error_map[] = {
>> -	[XE_GT_ERROR] = DRM_XE_RAS_ERR_COMP_CORE_COMPUTE,
>> +	[XE_GT_ERROR]	= DRM_XE_RAS_ERR_COMP_CORE_COMPUTE,
> 
> Unneeded churn, please align in the original patch.
> 
>> +	[XE_SOC_ERROR]	= DRM_XE_RAS_ERR_COMP_SOC_INTERNAL,
>>   };
>>   
>>   enum gt_vector_regs {
>> @@ -60,6 +62,102 @@ static enum drm_xe_ras_error_severity hw_err_to_severity(enum hardware_error hw_
>>   	return DRM_XE_RAS_ERR_SEV_UNCORRECTABLE;
>>   }
>>   
>> +static const char * const pvc_master_global_err_reg[] = {
>> +	[0 ... 1]	= "Undefined",
>> +	[2]		= "HBM SS0: Channel0",
>> +	[3]		= "HBM SS0: Channel1",
>> +	[4]		= "HBM SS0: Channel2",
>> +	[5]		= "HBM SS0: Channel3",
>> +	[6]		= "HBM SS0: Channel4",
>> +	[7]		= "HBM SS0: Channel5",
>> +	[8]		= "HBM SS0: Channel6",
>> +	[9]		= "HBM SS0: Channel7",
>> +	[10]		= "HBM SS1: Channel0",
>> +	[11]		= "HBM SS1: Channel1",
>> +	[12]		= "HBM SS1: Channel2",
>> +	[13]		= "HBM SS1: Channel3",
>> +	[14]		= "HBM SS1: Channel4",
>> +	[15]		= "HBM SS1: Channel5",
>> +	[16]		= "HBM SS1: Channel6",
>> +	[17]		= "HBM SS1: Channel7",
>> +	[18 ... 31]	= "Undefined",
>> +};
>> +
> 
> Redundant blank line.
> 

Then checkpatch complains :(

>> +static_assert(ARRAY_SIZE(pvc_master_global_err_reg) == XE_RAS_REG_SIZE);
>> +
>> +static const char * const pvc_slave_global_err_reg[] = {
>> +	[0]		= "Undefined",
>> +	[1]		= "HBM SS2: Channel0",
>> +	[2]		= "HBM SS2: Channel1",
>> +	[3]		= "HBM SS2: Channel2",
>> +	[4]		= "HBM SS2: Channel3",
>> +	[5]		= "HBM SS2: Channel4",
>> +	[6]		= "HBM SS2: Channel5",
>> +	[7]		= "HBM SS2: Channel6",
>> +	[8]		= "HBM SS2: Channel7",
>> +	[9]		= "HBM SS3: Channel0",
>> +	[10]		= "HBM SS3: Channel1",
>> +	[11]		= "HBM SS3: Channel2",
>> +	[12]		= "HBM SS3: Channel3",
>> +	[13]		= "HBM SS3: Channel4",
>> +	[14]		= "HBM SS3: Channel5",
>> +	[15]		= "HBM SS3: Channel6",
>> +	[16]		= "HBM SS3: Channel7",
>> +	[17]		= "Undefined",
>> +	[18]		= "ANR MDFI",
>> +	[19 ... 31]	= "Undefined",
>> +};
>> +
> 
> Ditto.
> 
>> +static_assert(ARRAY_SIZE(pvc_slave_global_err_reg) == XE_RAS_REG_SIZE);
>> +
>> +static const char * const pvc_slave_local_fatal_err_reg[] = {
>> +	[0]		= "Local IEH: Malformed PCIe AER",
>> +	[1]		= "Local IEH: Malformed PCIe ERR",
>> +	[2]		= "Local IEH: UR conditions in IEH",
>> +	[3]		= "Local IEH: From SERR Sources",
>> +	[4 ... 19]	= "Undefined",
>> +	[20]		= "Malformed MCA error packet (HBM/Punit)",
>> +	[21 ... 31]	= "Undefined",
>> +};
>> +
> 
> Ditto.
> 
>> +static_assert(ARRAY_SIZE(pvc_slave_local_fatal_err_reg) == XE_RAS_REG_SIZE);
>> +
>> +static const char * const pvc_master_local_fatal_err_reg[] = {
>> +	[0]		= "Local IEH: Malformed IOSF PCIe AER",
>> +	[1]		= "Local IEH: Malformed IOSF PCIe ERR",
>> +	[2]		= "Local IEH: UR RESPONSE",
>> +	[3]		= "Local IEH: From SERR SPI controller",
>> +	[4]		= "Base Die MDFI T2T",
>> +	[5]		= "Undefined",
>> +	[6]		= "Base Die MDFI T2C",
>> +	[7]		= "Undefined",
>> +	[8]		= "Invalid CSC PSF Command Parity",
>> +	[9]		= "Invalid CSC PSF Unexpected Completion",
>> +	[10]		= "Invalid CSC PSF Unsupported Request",
>> +	[11]		= "Invalid PCIe PSF Command Parity",
>> +	[12]		= "PCIe PSF Unexpected Completion",
>> +	[13]		= "PCIe PSF Unsupported Request",
>> +	[14 ... 19]	= "Undefined",
>> +	[20]		= "Malformed MCA error packet (HBM/Punit)",
>> +	[21 ... 31]	= "Undefined",
>> +};
>> +
> 
> Ditto.
> 
>> +static_assert(ARRAY_SIZE(pvc_master_local_fatal_err_reg) == XE_RAS_REG_SIZE);
>> +
>> +static const char * const pvc_master_local_nonfatal_err_reg[] = {
>> +	[0 ... 3]	= "Undefined",
>> +	[4]		= "Base Die MDFI T2T",
>> +	[5]		= "Undefined",
>> +	[6]		= "Base Die MDFI T2C",
>> +	[7]		= "Undefined",
>> +	[8]		= "Invalid CSC PSF Command Parity",
>> +	[9]		= "Invalid CSC PSF Unexpected Completion",
>> +	[10]		= "Invalid PCIe PSF Command Parity",
>> +	[11 ... 31]	= "Undefined",
>> +};
>> +
> 
> Ditto.
> 
>> +static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
>> +
>>   static bool fault_inject_csc_hw_error(void)
>>   {
>>   	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
>> @@ -138,6 +236,26 @@ static void log_gt_err(struct xe_tile *tile, const char *name, int i, u32 err,
>>   				    name, severity_str, i, err);
>>   }
>>   
>> +static void log_soc_error(struct xe_tile *tile, const char * const *reg_info,
>> +			  const enum drm_xe_ras_error_severity severity, u32 err_bit, u32 index)
>> +{
>> +	const char *severity_str = error_severity[severity];
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_drm_ras *ras = &xe->ras;
>> +	struct xe_drm_ras_counter *info = ras->info[severity];
>> +	const char *name;
>> +
>> +	name = reg_info[err_bit];
>> +
>> +	if (strcmp(name, "Undefined")) {
>> +		if (severity == DRM_XE_RAS_ERR_SEV_CORRECTABLE)
>> +			drm_warn(&xe->drm, "%s SOC %s detected", name, severity_str);
>> +		else
>> +			drm_err_ratelimited(&xe->drm, "%s SOC %s detected", name, severity_str);
>> +		atomic_inc(&info[index].counter);
>> +	}
>> +}
>> +
>>   static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
>>   				u32 error_id)
>>   {
>> @@ -221,6 +339,104 @@ static void gt_hw_error_handler(struct xe_tile *tile, const enum hardware_error
>>   	}
>>   }
>>   
>> +static void soc_slave_ieh_handler(struct xe_tile *tile, const enum hardware_error hw_err, u32 error_id)
>> +{
>> +	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>> +	unsigned long slave_global_errstat, slave_local_errstat;
>> +	struct xe_mmio *mmio = &tile->mmio;
>> +	u32 regbit, slave_base;
>> +
>> +	slave_base = SOC_PVC_SLAVE_BASE;
> 
> Just name it 'slave' and it'll probably help remove the line wrapping below.

There is no wrapping except the log_soc_error. This change won't fix it

> 
>> +	slave_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, hw_err));
>> +
>> +	if (slave_global_errstat & SOC_IEH1_LOCAL_ERR_STATUS) {
>> +		slave_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, hw_err));
>> +
>> +		if (hw_err == HARDWARE_ERROR_FATAL) {
>> +			for_each_set_bit(regbit, &slave_local_errstat, XE_RAS_REG_SIZE)
>> +				log_soc_error(tile, pvc_slave_local_fatal_err_reg, severity,
>> +					      regbit, error_id);
>> +		}
>> +
>> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, hw_err),
>> +				slave_local_errstat);
>> +	}
>> +
>> +	for_each_set_bit(regbit, &slave_global_errstat, XE_RAS_REG_SIZE)
>> +		log_soc_error(tile, pvc_slave_global_err_reg, severity, regbit, error_id);
>> +
>> +	xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, hw_err), slave_global_errstat);
>> +}
>> +
>> +static void soc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err,
>> +				 u32 error_id)
>> +{
>> +	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>> +	struct xe_device *xe = tile_to_xe(tile);
>> +	struct xe_mmio *mmio = &tile->mmio;
>> +	unsigned long master_global_errstat, master_local_errstat;
>> +	u32 master_base, slave_base, regbit;
>> +	int i;
>> +
>> +	if (xe->info.platform != XE_PVC)
>> +		return;
>> +
>> +	master_base = SOC_PVC_MASTER_BASE;
>> +	slave_base = SOC_PVC_SLAVE_BASE;
> 
> Ditto. Just 'master' and 'slave' will help remove the line wrapping below.

Yeah this will help. Will add this change

> 
>> +	/* Mask error type in GSYSEVTCTL so that no new errors of the type will be reported */
>> +	for (i = 0; i < XE_SOC_NUM_IEH; i++)
>> +		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(master_base, slave_base, i),
>> +				~REG_BIT(hw_err));
>> +
>> +	if (hw_err == HARDWARE_ERROR_CORRECTABLE) {
>> +		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(master_base, hw_err),
>> +				REG_GENMASK(31, 0));
>> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(master_base, hw_err),
>> +				REG_GENMASK(31, 0));
>> +		xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(slave_base, hw_err),
>> +				REG_GENMASK(31, 0));
>> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(slave_base, hw_err),
>> +				REG_GENMASK(31, 0));
>> +		goto unmask_gsysevtctl;
>> +	}
>> +
>> +	/*
>> +	 * Read the master global IEH error register if BIT(1) is set then process
> 
> Missing comma after 'register'.
> 
>> +	 * the slave IEH first. If BIT(0) in global error register is set then process
>> +	 * the corresponding local error registers.
>> +	 */
>> +	master_global_errstat = xe_mmio_read32(mmio, SOC_GLOBAL_ERR_STAT_REG(master_base, hw_err));
>> +	if (master_global_errstat & SOC_SLAVE_IEH)
>> +		soc_slave_ieh_handler(tile, hw_err, error_id);
>> +
>> +	if (master_global_errstat & SOC_IEH0_LOCAL_ERR_STATUS) {
>> +		master_local_errstat = xe_mmio_read32(mmio, SOC_LOCAL_ERR_STAT_REG(master_base, hw_err));
>> +
>> +		for_each_set_bit(regbit, &master_local_errstat, XE_RAS_REG_SIZE) {
>> +			const char * const *reg_info = (hw_err == HARDWARE_ERROR_FATAL) ?
> 
> This looks like it can be outside the loop.

will fix it.


Thanks
Riana


> 
> Raag
> 
>> +						       pvc_master_local_fatal_err_reg :
>> +						       pvc_master_local_nonfatal_err_reg;
>> +
>> +			log_soc_error(tile, reg_info, severity, regbit, error_id);
>> +		}
>> +
>> +		xe_mmio_write32(mmio, SOC_LOCAL_ERR_STAT_REG(master_base, hw_err),
>> +				master_local_errstat);
>> +	}
>> +
>> +	for_each_set_bit(regbit, &master_global_errstat, XE_RAS_REG_SIZE)
>> +		log_soc_error(tile, pvc_master_global_err_reg, severity, regbit, error_id);
>> +
>> +	xe_mmio_write32(mmio, SOC_GLOBAL_ERR_STAT_REG(master_base, hw_err),
>> +			master_global_errstat);
>> +
>> +unmask_gsysevtctl:
>> +	for (i = 0; i < XE_SOC_NUM_IEH; i++)
>> +		xe_mmio_write32(mmio, SOC_GSYSEVTCTL_REG(master_base, slave_base, i),
>> +				(HARDWARE_ERROR_MAX << 1) + 1);
>> +}
>> +
>>   static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>>   {
>>   	const enum drm_xe_ras_error_severity severity = hw_err_to_severity(hw_err);
>> @@ -283,8 +499,11 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   					    "TILE%d reported %s %s, bit[%d] is set\n",
>>   					    tile->id, name, severity_str, err_bit);
>>   		}
>> +
>>   		if (err_bit == XE_GT_ERROR)
>>   			gt_hw_error_handler(tile, hw_err, error_id);
>> +		if (err_bit == XE_SOC_ERROR)
>> +			soc_hw_error_handler(tile, hw_err, error_id);
>>   	}
>>   
>>   clear_reg:
>> -- 
>> 2.47.1
>>

