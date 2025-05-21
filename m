Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D2ABEB16
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 07:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D7210E5C5;
	Wed, 21 May 2025 05:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kj/VTbSD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F0110E5C5;
 Wed, 21 May 2025 05:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747803662; x=1779339662;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Wxstfnbi80QccHk3p33bOEZQM24aPtqYIlqYJs7xDzM=;
 b=kj/VTbSD9WHN3iz2EcynFhXqwBEr6kwj6zW3yztj0Q3NVKBGydk5Pw2S
 5tQDEvCsugoikBm9PwWieKNL9qP5lABCMgdauqPkOzwt9XNNsyrgHu/9P
 3bK7WqaLlGWgcY4iSCTcDlRsfa+A1q3S+tVUGPXsdW0Hr9oty4ViFGzwJ
 RyFYEiKFWAkAdKlzsNXdHbVFJ7ruqeuV4EwlOAK2CjT0DYskVvsXj1U5n
 JssHGu7xDMIwJUykLQIO63psGZsH7zFEjSey1Cf15bntydlDCnUa4Q1Jc
 Zjphh+xo0Ofq2lBqP5XvpyYBJ8xUhcbqaNii/N49KXPMJ6om6yXaJbC9M Q==;
X-CSE-ConnectionGUID: yHvUYgNfS6ONFL1Q4IPZXA==
X-CSE-MsgGUID: lINBXlSgRISxcAr1j+43cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="48882410"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="48882410"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:01:02 -0700
X-CSE-ConnectionGUID: ZmmaDtUIRrebGkDcz8ehTw==
X-CSE-MsgGUID: tVBKJ6fEQAKo8UYVCQIi2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="163183435"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:01:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 22:01:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 22:01:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 22:00:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGtXLF+Sv3F6kvD+870DmvPjwO1rLCAASKLEOmjowO68CSxNviB6CL05YKHfYy6Hl8rFjla6KClHuE2eCL7E6npnzNBBtnE9NrvEwYKw2T6MK6dACtP0hBzv1VJSZSSAM23srPRtBjkwRqMz009maW6w6rVCwfaPMmScMXvyyZWlNvQHXKUTAhcD0TceLnN1Q4EMKMUrOamAkp+IER5t4MAFiR7yeiMM7HdWJm/OlA66/mF3Xce2wxdYaMfvQxOE+lrv7L2rpXXWBz880/wcwO259m6285++mhiAhgGIuvtPllLYTOygbFmZ6FhzHbApC4fYptWqZLjJIrWnWwV+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRL1cCkyQfMdBdTDCxZKWFTFUp82jaC7o2+pDsZ3QAc=;
 b=QuSLG+5Hw6njYj4nEqMJdQbFjDl6lkp/Acmrs7Helc6eSoKO9FaJFbYJ2iyQEgMjwiGjEhQciALQbiuvHk8qS7Wd6BapWTybZfDof/nAk0J7/7UhKWEsSTs+LHorEFD/zonagpvcqABYdZoEEJBOfsRuOdqdo317r4gWChFqktmuSBkNxUk7+QFqZCA3yl+845aGAqaez88tAPVG3v1Tz3nF2Wcpu8u+KjnpvwAExCL1YPZHcXiAsl7rwrGuGYtsFaN174ljNZMI3M9QDHjjy2fzPhM7SVQcs060KQgCuUgODnj5nMLKWFSLXSr9SCOXDlGgBJllNsnmD70NWWTgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8463.namprd11.prod.outlook.com (2603:10b6:408:1ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 05:00:38 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%3]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 05:00:38 +0000
Message-ID: <2f7fe9a5-9ef5-4bb8-8028-1e8557f883d2@intel.com>
Date: Wed, 21 May 2025 10:30:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] drm/i915/display: Add function to configure LFPS
 sending
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
References: <20250520165326.1631330-1-jouni.hogander@intel.com>
 <20250520165326.1631330-11-jouni.hogander@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250520165326.1631330-11-jouni.hogander@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8463:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c381a78-20c7-4c8d-f81d-08dd98246d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkJpQzZDSmxBM0QyS3l1cE8ydDBYdExmbmRqdjBPSkNEUzkwM3ZHM1JUeFJs?=
 =?utf-8?B?VDBucjk0a2dZZCs1NC9pVVV4TGpBQ3MyYTM1eU82aDR1dFdBWWJUMXNVRkw5?=
 =?utf-8?B?cHVlZ2lrZkt4cUs0djlsYXJaMDFJZEs4czdlZkczRmJ4OUgvMW9OTWc1UU1K?=
 =?utf-8?B?RmpqZm0vN3Y0a0pBM3lDc21BNjhkeTl3N1Rkd2ZMSFM0SWhGanlJb3MxeEd1?=
 =?utf-8?B?TitPZW1aZ01BUHBCM3diM1p5RFZ0SStBMXRURFpxRGVaMnByeWJWWHh1bSth?=
 =?utf-8?B?R3VVS0NKU1lDdmF5OVBuU1RDbEZiUTNkcHZvT2psUXhPSlhmK1RDVjNmY2pW?=
 =?utf-8?B?bWwwNVM4UGFmdGtsRzlxVlg5MlFSakJzUDFtWGk4VmgvY0JFN01SMVgwMDdk?=
 =?utf-8?B?c3RJaTd5U2p3Y1FMQk9ieXAvcUd5S0xxc0tIRkh6T0dsWjMyMVh3MkkvSU1L?=
 =?utf-8?B?QWRidUE0NW1nZ01nWElTMHJFaStEVGJ3QlNXeGlEWEZkOU15MWd1Mks3bVJR?=
 =?utf-8?B?OEEzK2FST0dINWxVclREQXE4WFFmOVNVQ2hGN1NTQzN6bFJ3bGZ1VEFLd0ZC?=
 =?utf-8?B?TjFVQ0JWU2VSWk5sM3gxK2lFaCtKdE9wanZKbGFDei8vZmNOejUxNEpGV25D?=
 =?utf-8?B?Ti9BZzRya1hJaDRLUTFQRlltdjZRR2RqNmxyQW83M0NwSWtndm5WOGlmdkJG?=
 =?utf-8?B?V0ZiRTF2R1ByMm9jSG1qZjhjNGoxUmQ2MlZsNGNCZm1JZlV6OEQyRkcxanJL?=
 =?utf-8?B?OTRZUit5WTBzOHhzY2dHb1FRaEFqV0RuOStxVnViMHdJVlV5L3JNVG5FTk85?=
 =?utf-8?B?Q3haNVgzQ1FtbGxGSGVRSlNWYituaXFaaGJEOCtieGZyQm1jZ0ZETHRxU01a?=
 =?utf-8?B?eXovTHBvZDJadVN1STdFZlR0WXlvdjRqcFE3RUVyUDZHYTVHMi9yNW92OW9S?=
 =?utf-8?B?a3NCeHdFVytaSTZ6dmc0amdpYWNnSTZKMlhIY1RvaFBVYjVVaStxU2h4M2Zq?=
 =?utf-8?B?Rnh1cHNJNFIvSGpiaGlTSGFuazVVRWFZR0Uzbkh6STVZc0ZieVpJUnhHZVNL?=
 =?utf-8?B?blF1bytIMmxQeEEwRHFseG5aYkZvN0NFT3JjRzV1V3htU3RYMklsTkgvWjY0?=
 =?utf-8?B?MGlLMURtb1hicmxYVVZCYVNFckZnN0lLejkzUjY2M0F5WndDcHV3aVVXZCtq?=
 =?utf-8?B?Q0xLbGprUE10U1FxRTI0eHhCYlM5Rmp3L2JhN2tpSWNJYkFhcFp2ZW93cTE0?=
 =?utf-8?B?ZGliUVdKU2FRV2JoQTZIMThoME9qSXFMZHdWVDVod2w5dGNDZS9od3FZcTlW?=
 =?utf-8?B?WFUySDI0dWJxK2MwZWVLdVROVDdhRzJkU1dBZHdNeXR4Wm1mZVdzYUFXSHc3?=
 =?utf-8?B?VFhKeExMb1NHZWpRYkRoeEZ3aWtjblFGWittWm5oaFR2Yms2R3luQUphamh1?=
 =?utf-8?B?RlUyTnI1R0xoL2gvdzA0dk5rR3FNZWhvaVpFd1p6MHErbHlhS2dmZWFJUkF6?=
 =?utf-8?B?QXZXK09TQ1VGRWFZRmY1Y0xVSVhZQlRvRG9BTlkxVzlNZzFXd1lYb1NHcnkv?=
 =?utf-8?B?bjEvS001YjVabTUvS2ZuOThGZGc0TEFwNXRrSnJiOFU4YlZ1NWNFWWFaWVNE?=
 =?utf-8?B?a2NMUWs2MTV3OTlERlhTRlhhazJYR0RsSkRuVHlFekFZdGJrSURWMXRPZENs?=
 =?utf-8?B?YnArb2JYSkVYYVVTcUkxWGl2UjNZU0ZJcDBTcTBjU3lNaTZWU0ZTemNyRU5t?=
 =?utf-8?B?UXF2TmhzTFIxem1YZTZ0RGppUnA1aXlWZkFqM3lIU2FZV0xOZXdObzFOcDhQ?=
 =?utf-8?B?MWlyaGlzRVdqK0JkTFNTeDEwV2w5TGRabUdyZjFuZFpSbGd4VmtCbkFrWjlI?=
 =?utf-8?B?bnR5R1Y3UnpoWmlJdEJ3cklyN3BSWXAvL1ZpV0FhWUNXRkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU1lWFFoNlprTnp2TkFadHJSR2l1dW1CUVA4N3hhTWQ5WmtGUy9MUVQwa3cr?=
 =?utf-8?B?cHV4WTdGTmcvY1QwZ0lMWE43Ry9CU3Y4T1JQV2U5VmxtTi81YU05NzM5dFNh?=
 =?utf-8?B?VDZuL21ud2lxODdnbVFZNDZTei80OFE2cC8xQWI4RjFhOUo1QTMwSFQwbnE4?=
 =?utf-8?B?L0xxdzZ5UTlOUmVZc3FWU0dOclQ4YWt1UFlqVjBtTkxxQVZ0UW40QVRQMkhj?=
 =?utf-8?B?a3dPdkY1RGlGVXF3ejBLQ0hoSUJIL2liM2QwZXZIS3ByZUdLK3RpZ1g5MG85?=
 =?utf-8?B?Q0Voc1JTcVFYTFEzdGxsSWxSV2NQT3dZSGdMblNpUUdVS2FHVFJhMEt3T0gr?=
 =?utf-8?B?L3lqcDUxNnVRMEY5c2Zja3cxeHBLRDQweDFONWFXUUhhaytScnRldm5ZVFgz?=
 =?utf-8?B?UEQzRTIzWWRjTHBXWUdNaVJUWVRGZHZDVDFoN1JxbUtmUzlKY2REMWZQdjRN?=
 =?utf-8?B?VjE3VE50blc1Tkgzcnh5S0p4UTIxaHVGQjZzaHRIOEdyOGZwclE1MnY1VmFD?=
 =?utf-8?B?WlpGQmNhOFNwbkVRM3c3TER4NnppdlB2STR6RWlvNzF0TjZYWFJuUCtLUDVz?=
 =?utf-8?B?Z3VkY29TSjl5cCtibUVpOVpuekp5WUVmNmwvN01kMFlnQUR5bzh5OGNnWm04?=
 =?utf-8?B?Z2MrS0FPVDBwZHJJaWFGQTZzVDhqaW0zdFJlbVFqSTNBTDhneUswQkIzZUhJ?=
 =?utf-8?B?K3lvTURtV2hzZXhFYWpldXZ6ZG1QSzIvZEZJQU5SbW0ydkdoaVFwN0c2d3V5?=
 =?utf-8?B?QmUzeEZ0L2w3UFFoek1tRXZOVGVRVEVPVE5wdlFmRVAyQU15djgxNVNHYmdr?=
 =?utf-8?B?T1ZBem9UVUl5SStoaEdJZ1A0VWRPTy9FcDJlS0JRVTN0ejVlbzA4Qmp0aHpI?=
 =?utf-8?B?VGRUYlJrb01lbXhUdzBxa29aV2JuUXFNbElxS3hQeGlZMUJ3blEzMU02Ymw5?=
 =?utf-8?B?MUlhbXRlbXN3bGlCNkJQelpDTStaMzNacjdUbHNiZlBPUTVCK0Fkc0puYjhC?=
 =?utf-8?B?NEFTVnI0ekoxanAwS2w3aDh1VkFSQTNxdmM5a29GOUs4VC9hamQrM1VQcTA3?=
 =?utf-8?B?RnBWcURSNVZzRXI1K0xBZGcweWZUNlZqc1VKQkQxOUFubVlpblJyRGM5aFVa?=
 =?utf-8?B?ZWtvQXlIa2JtZk1qZUtPc0lWbTNGa2U0Skp5VnRSbm5LUitXa0VSZWJlR3Vw?=
 =?utf-8?B?VllTRW96Y3NPbklSK21Udi9JaURQdHAzdURXazdIaEd6OVNYYXluSjloUWtq?=
 =?utf-8?B?eE5jYW9ueU5GajRiSmxFR0hUR0Y0N09pZ2g0Y2lXeFJ3VCtWN2RFZVkzQVZx?=
 =?utf-8?B?Nm5HYUZVWUZiSTMzNHprWDBTWHNjZjQrRkhTQzBjNDZ3OVRzanNrcGJJNnNv?=
 =?utf-8?B?eVcwNkRjZm1teVR1aDQ3UlY1Tm1wZGJSWGhlRXVwcTcwSmFTbXRnMGV5NXE1?=
 =?utf-8?B?Z29vVk9QWWpCYUU4c2RVYVpmSEhqKzZPUmp3TCs3c2NOZHNZWGZvNGJ6eHl0?=
 =?utf-8?B?SDdIWW1saEorSWovajBpYzNQVEhDYURWMStzRTFNcHY5Q0FKZG1FWGJ2Z1lM?=
 =?utf-8?B?YzhwZ3M2RGs4d29ldWlHcEszdkk1ZnFwQzNWenBhZEVzQ3dLVGp4ZUJkT2lS?=
 =?utf-8?B?MEJSb1I0V3NkUmVKcGFzYXlEUENrMjc4SUVlTko5WWl1aE1KUkFtQXZ2UWpM?=
 =?utf-8?B?Si9ZcnNSclgxZlQydTA5MGd6WERVdHBKYTBpaU9oNFJNVmFsOTJMNXlya0J0?=
 =?utf-8?B?VXV2WlQwUWlkSTY4ZXFGRkFrL1ZJRzVMcDJ4dFI3dWMzYk5ZTEV2VnlUcTFC?=
 =?utf-8?B?dU4yZFBaTTdCM3pvUXFMVTlzQTYyUjRudHR4cHRjQ0U4bUZRd0s1dFdNMy9O?=
 =?utf-8?B?d2F4bXRjNzBXRWZnMktXRXFzc29nb0l1RVB3OGRQeWpqTEpReS9aN0dHTkJP?=
 =?utf-8?B?bTZ6b1Q4dWo4aHEyTkljNU1pYk5kSHFvcHIrOVhSeWQzRmU2T2kvYmE5SSta?=
 =?utf-8?B?R2VHeHFmaGZiNXpnU3NYVFJvbWszTHE1dFZxUVN2VENhL1JPelpZVU9tZlJN?=
 =?utf-8?B?MDExTjE2V3BxTk1IVG9nZ2F0MWZCK2lGbTFtYVhJZDF3V0I4VEUyQVk4Wjdy?=
 =?utf-8?B?NHd6TmJGL3ZEYkd1clJYamJsN0o5djN3dWZjcm9Ub0IxamFRK1VuN3F4cjNV?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c381a78-20c7-4c8d-f81d-08dd98246d73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 05:00:38.2659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhZmi3U15uxRb4RrMevarKAz+kZcofek41a4Lxt8vbWDWwCLsHq6xGeLgLgBUrz9x/qJ2Vz/U29gfi7Yoaal9Ib3UVzYT0wjQ/tqSlLrf5k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8463
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


On 5/20/2025 10:23 PM, Jouni Högander wrote:
> Add function to configre LFPS sending for Panel Replay according to link
> training sequence in HAS document.
>
> This assumes we are using AUX Less always if it's supported by the sink and
> the source.
>
> v2:
>    - drop HAS reference
>    - replay kerneldoc comment with a generic comment
>    - check display version in intel_lnl_mac_transmit_lfps
>
> Bspec: 68849
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cx0_phy.c | 31 ++++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_cx0_phy.h |  2 ++
>   drivers/gpu/drm/i915/display/intel_ddi.c     |  8 ++++-
>   3 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> index 91118d115fd3..75caccb65513 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -3225,6 +3225,37 @@ void intel_mtl_pll_enable(struct intel_encoder *encoder,
>   		intel_cx0pll_enable(encoder, crtc_state);
>   }
>   
> +/*
> + * According to HAS we need to enable MAC Transmitting LFPS in the "PHY Common
> + * Control 0" PIPE register in case of AUX Less ALPM is going to be used. This
> + * function is doing that and is called by link retrain sequence.
> + */
> +void intel_lnl_mac_transmit_lfps(struct intel_encoder *encoder,
> +				 const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(encoder);
> +	u8 owned_lane_mask = intel_cx0_get_owned_lane_mask(encoder);
> +	bool enable = intel_alpm_is_alpm_aux_less(enc_to_intel_dp(encoder),
> +						  crtc_state);
> +	int i;
> +
> +	if (DISPLAY_VER(display) < 20)
> +		return;
> +
> +	for (i = 0; i < 4; i++) {
> +		int tx = i % 2 + 1;
> +		u8 lane_mask = i < 2 ? INTEL_CX0_LANE0 : INTEL_CX0_LANE1;
> +
> +		if (!(owned_lane_mask & lane_mask))
> +			continue;

Perhaps a macro for the loop pattern would make sense, as this is used 
for other CX0 register.

Regardless of the above, patch looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> +
> +		intel_cx0_rmw(encoder, lane_mask, PHY_CMN1_CONTROL(tx, 0),
> +			      CONTROL0_MAC_TRANSMIT_LFPS,
> +			      enable ? CONTROL0_MAC_TRANSMIT_LFPS : 0,
> +			      MB_WRITE_COMMITTED);
> +	}
> +}
> +
>   static u8 cx0_power_control_disable_val(struct intel_encoder *encoder)
>   {
>   	struct intel_display *display = to_intel_display(encoder);
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.h b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
> index a8f811ca5e7b..c5a7b529955b 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.h
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.h
> @@ -43,5 +43,7 @@ void intel_cx0_phy_set_signal_levels(struct intel_encoder *encoder,
>   				     const struct intel_crtc_state *crtc_state);
>   int intel_mtl_tbt_calc_port_clock(struct intel_encoder *encoder);
>   void intel_cx0_pll_power_save_wa(struct intel_display *display);
> +void intel_lnl_mac_transmit_lfps(struct intel_encoder *encoder,
> +				 const struct intel_crtc_state *crtc_state);
>   
>   #endif /* __INTEL_CX0_PHY_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 65ab012c3eae..70de99cc4ead 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -3745,10 +3745,16 @@ static void mtl_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
>   	intel_dp->DP |= DDI_BUF_CTL_ENABLE;
>   
>   	/*
> -	 * 6.k If AUX-Less ALPM is going to be enabled
> +	 * 6.k If AUX-Less ALPM is going to be enabled:
>   	 *     i. Configure PORT_ALPM_CTL and PORT_ALPM_LFPS_CTL here
>   	 */
>   	intel_alpm_port_configure(intel_dp, crtc_state);
> +
> +	/*
> +	 *     ii. Enable MAC Transmits LFPS in the "PHY Common Control 0" PIPE
> +	 *         register
> +	 */
> +	intel_lnl_mac_transmit_lfps(encoder, crtc_state);
>   }
>   
>   static void intel_ddi_prepare_link_retrain(struct intel_dp *intel_dp,
