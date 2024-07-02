Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0669246A6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 19:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC3910E11A;
	Tue,  2 Jul 2024 17:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=synaptics.com header.i=@synaptics.com header.b="YUOuzE+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2100.outbound.protection.outlook.com [40.107.92.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43F110E199
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:07:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YXh71b6joO/q0um55XSa2BwI6KbC9DXvAVZeLz/pTqkjKqOy6VFwSAl0tntI6glTeUa0KF7YQid40p48xRJjJJom93nDHzan3EQk5Mxnba5GrxBZM1XzFw95DNuHy0at1kEYMFESMv0ZNrgRwj4gt5MBRkPTPfndf3Dq1J9R/w3jsTsYusAydFYUrZaqPHmFoA2eD9MXrUF13Q/m9coLQm8suqd0sFuzm0J8byBk+RxcnRud7pOmDw8cGTq4llyRkNLZ0b9wXITw+CKIx/w4BmcrsYsY5KKBvj+UHRLRl7KDsDrtpfp5EwKHxzEf1ZZ4dxP+ITHtX6CvpvazEH60yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eKS1TmIi71NZtFclUrZ0APhuz8mszc3RBB8ENfyTzM=;
 b=g2Ciu0Zure8OGM5OSnQXoMvwGiXXcvYU2sPS4sww9ZI9em9VIp72QdH1SQ6wtFua/SQKQwgQNHx3FH+RRRfe9tXR3w97GczrL/slw3HQp8r/QtgFNLrXlGUXExsjZzORVeanfKRRLpjx7jJMrODDyPW/YQuQnPa1G6o1lNGBCaLpoBivByfX963AsnhuOwvob2ud9Gpu2KKmhM62mSk6cIR15XqyTdrMWccEWtwo8Dp9T8fBYNexEXEGqpdUKOOifJ5YRoUDNquAI7EP33zWKIrSK7BHJWotiW8pYtVYm4RklxsOYfnK5zstoXExOacgJ/4yypuY1hd2n0Bnuujumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eKS1TmIi71NZtFclUrZ0APhuz8mszc3RBB8ENfyTzM=;
 b=YUOuzE+ON9Xs7/AAfOpne+hTXtBrNjheJkORMTAY0SH4aohWQkkBmtA2MgBl8grprdLBqlvosdmW7cqyNStRNvRgG4rWmPPR45LAKnxFTCyjSboZHeYdGJ36k8h1Z5PnDDeU8lV9449OXYB3S0p3lTn3U1YydJVdDmMOwvrtgC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from BN9PR03MB6188.namprd03.prod.outlook.com (2603:10b6:408:101::18)
 by BL1PR03MB6005.namprd03.prod.outlook.com (2603:10b6:208:310::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 12:07:55 +0000
Received: from BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990]) by BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990%4]) with mapi id 15.20.7741.017; Tue, 2 Jul 2024
 12:07:55 +0000
Message-ID: <3e8783b7-12bc-4972-80f2-03cc641de26c@synaptics.com>
Date: Tue, 2 Jul 2024 14:07:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drm/udl: Implementation of atomic cursor drm_plane
From: Lukasz Spintzyk <lukasz.spintzyk@synaptics.com>
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
References: <20240624071041.5087-1-lukasz.spintzyk@synaptics.com>
 <5fbf1be7-5049-4596-9ad0-d40d397396d1@suse.de>
 <ZnlE-Wm2gim2Unnz@phenom.ffwll.local>
 <0dd740d1-0046-41b0-a6ac-83ef0b023f63@synaptics.com>
Content-Language: en-US
In-Reply-To: <0dd740d1-0046-41b0-a6ac-83ef0b023f63@synaptics.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0445.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::18) To BN9PR03MB6188.namprd03.prod.outlook.com
 (2603:10b6:408:101::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6188:EE_|BL1PR03MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1da975-8d44-4ad7-2273-08dc9a8f9b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmxoY3JhaDQ2UHRaRWdESm5rQTBDT05YNkV2QytBc01hKzFMTWhmVG9oVVV2?=
 =?utf-8?B?K3E4REkrZUZhQjN3bEZqdVdHd0FrRVhvRG1BdXU4NUN4UlR5bk5ZYmFzaVJt?=
 =?utf-8?B?QUk5VFZmUG1ISlZQYUNyU0JnSFlvOEh1NitrZlJ5OUR2SzBtdFJvV01taVRq?=
 =?utf-8?B?NjR3cHNVSnhYRXh5U0MxSDkwTGFydVlqWUdZQlFWdEVLMytQWXVyMGtMV1FC?=
 =?utf-8?B?cXV1SFNaVXB1OGFGQk1sYkkxVEpJc2kxb2lRTHJ4YS9WS244YUNjNU1uaC9P?=
 =?utf-8?B?ZG5Ed1ZoWEVzNm4yNjhzN2p4VUh0anV5VzJYUUxmTVRWOXoydmN0Q0FxVmN1?=
 =?utf-8?B?cDRpUENhN3N0c09xZHFmdy9jTFA0bTdvZEZBN0pDay9tWmlNRHBvbktENVgv?=
 =?utf-8?B?MHBWY1k1T3c0WU1QVnJucmpMRmdiWFUyT25FOENoNTVHMXcvcXFGWGZYUUE5?=
 =?utf-8?B?d3drRDZKV1BvOGN0OGJWY0EyQ25Nb2FzZE5TY2pBZjBrMGdYMlRyZ0JvQU1T?=
 =?utf-8?B?bnVHZWtLNWRQWi9sZFZIeC9jSGVDUGMvRy9mVXpzK05zT0xxUU8vdkEwN3RI?=
 =?utf-8?B?SHF2Q2tLWlFIYnluYWtNN0NYaXR6bW9WZHFpOUJWVjdLYzhhcVdFbTRqNWp3?=
 =?utf-8?B?c0tVWXI0K2VuWGlQNnhkMGREbHBLNjVvbDVHS2tMdCtueUsxK0YvcHUrcHNt?=
 =?utf-8?B?QVJZZTMrV001dmlBQWs5VEhrSkJGWnpEejVpZWFkbzhwM1k1V3dZSWpnZTRD?=
 =?utf-8?B?STYxbFpabHI3VnhwVkVuZ3hjZVRHOFZRSzQ4ZndmVFIxRWlpZzNRVXg4M0hQ?=
 =?utf-8?B?a09aMXBNd2ExSmxHTDhHUzdxd3FiZ1c0MDNtdUVLbXVOSGxLcW1SaWV6TXlr?=
 =?utf-8?B?a0U0UFBIWnhqNk0vM2xYUHdGbysvREFZVVhVaE9kdkVVUy9WRktUQ0hqeElh?=
 =?utf-8?B?U0p2NlhWN3BKVHZQMzhaeFBIQUFRSzhUSkN5T3FFNmF2YmdoeXlrN2JNdG1C?=
 =?utf-8?B?dlFJY0ZVQTUvb1pPRHJSeW1sekE2amxjSTRkaDJ2aXp0b2tpRkxUb0V6NnN4?=
 =?utf-8?B?Ris3OHlnK1E5eXJweTVNVUplU3ZHeGF0M0w1aytJNXBTZ1ovcmhQbUM3YUN4?=
 =?utf-8?B?KzlPQlVIZnNGK0orNFdjSi93K1lBWTBEN256V2gzS0FiU0NwbEo4b0U0VDlI?=
 =?utf-8?B?MXhYWGlOZmJFVzY2ZG9XYU9PbndaTmIwQndFQzk5QnN2Q3htcUR0OGRQL2xF?=
 =?utf-8?B?NW5BSGtZaVpJUkkvY21BWDRwWjZUYmpYMHlWV2hTcGFIeTVXcnppUjNBWE9r?=
 =?utf-8?B?ZEE1L3orSGo2dnNyQllJaDlSNWp2NjVFT2J6SkNMNTRQbjJWUnU4UEprUU8y?=
 =?utf-8?B?VGZvMnl5aHVCU0NSdHZ0NUgvaGFHOWhMVGRMMSsydjcrQ1BndDdlUlUzR2JS?=
 =?utf-8?B?TC8wckpBbm4xaU9wMlNFTzNoMWdFZnVOVUZQMVE1elUwVkRpUTVBT0hONS9B?=
 =?utf-8?B?Q29XMmpoNFQ3TkFJMzF3bnVxcXBvTUxUUjN2V1VyOFRqbVlqckd1NjdHaWZC?=
 =?utf-8?B?NnU4VFNBbzhzb1NFL1EwRDJXMHdNV1Z1NUdaVUZ2S3l0ek8zb29yNnRWVmdB?=
 =?utf-8?B?dzVEV1JzM1V1RTZGRm5JQm55NFNuMk5SQlp4UmtQNjFjdkt2My93MGo1cXR3?=
 =?utf-8?B?aTU4TitJdHNoeTFXMzY3amZTZE8zSEJGNGg0bDdXdndDL0ROQk84NENrZGFZ?=
 =?utf-8?B?UnRpSWhGTXpIeXNlTnIrNWQvMFpKK0hhUWZYN1ptNVNxYXFVYlI3eExoMkxO?=
 =?utf-8?B?M0Eyc2M3RVhDNFNNVVM3UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6188.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXZRekNLS09QMFZpcklnTjBQdkhlQ0pJSFB5SEpYNGhFL09Wd0JJY0s2TUNm?=
 =?utf-8?B?WEJFUDEvNnlIQ3pnSWh1VjR3UC9ILzJiRlozeFlPZU1xTXpsbUJTRWlLMEQx?=
 =?utf-8?B?VldBUWFqNXhObnJiakR0N0FZRVZITjdjNmYrbWlmajY5TktPL25LYzhKNTVz?=
 =?utf-8?B?ZjZpd0kxOUdDZWRRRWw1bG5VdnhOWUdUM2trMlVXRXdoMzl6emZ1NGVyUlgx?=
 =?utf-8?B?RkZIWFk0R2ZKWmpqMGVZSElBRU5RN1pFVXJLWFFNRDNEcmw3eit6Vzd1MDk0?=
 =?utf-8?B?aFA3ZTM5Y2t1OGFwWDU4UGFtT2pMY20rcUZiZjFyLzlkT3hXUjU3NXdLcXhM?=
 =?utf-8?B?Z2lRN0hTSGVLNGFYRWlWenV1UXUwZ3RTMU5lRWtML24zNGpqMnpVY2VWME1S?=
 =?utf-8?B?YU1tcjNNRGFvejVybVpLWTVjYmRGc3JEZ0trV0lEVWhKNjI5Z0VGZE9RbmJN?=
 =?utf-8?B?YVd2T05GdmlnVGZEdmdObHAveUVmRk1zUGZuUXNKNXN1NHZBYzRyVmFRcGFx?=
 =?utf-8?B?WWJqWHFCS00zUEFuK1l5ZFhra3hpRnJ6K1hVd2xTV0t3TmhpUEFSR3hvQjk3?=
 =?utf-8?B?RWYrdjFaUGg1dVhSMFZNZHFlS1p4dEM1N0g1WnJ3cDlQN0RXak9MTHkvSktK?=
 =?utf-8?B?dHNXdzcrM0swK2lCNFVsSnIwNjRUUGxoK29qQmhOd2hxMVd0NXZkYzRyNWgv?=
 =?utf-8?B?SWVBTTRpMUFZL1lINHpENk1pUnJUUWlJaUVjUzZOSWxtMmtOS2xKdlZxUi9i?=
 =?utf-8?B?cHkxcDhxZ3BqL2g3T2NIUWRYNDZwUnMvcWNkdkE4STJyRTIzVFRpOVMvUk80?=
 =?utf-8?B?Zi9NWTlGR2g0czV5OFJaVWpvMkxMdlNqeURBcXJRZFhhNjI1MWNQWlBkK2tZ?=
 =?utf-8?B?YkFYbEpNOHR5VTc0dmRxZnVNU3BzeWpSWmxGSDlYN0RoQjVyblRRUXFWQ1Qv?=
 =?utf-8?B?dWFFY0FGUDV6WFNWQUE5MFNyWW9nWnZLczM2RzZvN0NpL3p3SHlVTGdscjJL?=
 =?utf-8?B?Szl2U3pFWm5nL2hTRDRCYWkzSk1rQ3BmVjNmYXVnd2o5b1JBdENFd2pCaU1C?=
 =?utf-8?B?RFE1Wk9hdzFRdHBRSnkyVlZ4cU1CTFhROU8rbStOLzVIOW0ra2NaNlI1MVJ3?=
 =?utf-8?B?Y1h4YzJCZnhwbm01RTI5dzFaWkNhR2g2MlBqVGpic20wQldGSWFJTWhMNXli?=
 =?utf-8?B?cVJwUlVPZU1XaTlsYy9QMFJXSFNrQk11dkpqcXp4d2xPRjRMcVlyRVZaOGpE?=
 =?utf-8?B?azVHbXZENkZoY25HV1M2NThNV3RkQVd0SS84TEcwZE9pZWNEdmtEbzZ3cFQy?=
 =?utf-8?B?WElEWXk5dHB5bEwrQnU0c1hqTDVlT1BubXF4bDJYdlRQaEZQUkd4MDBXVHNv?=
 =?utf-8?B?SFRNVUhpRG94TG53eVUyTExjcUY0akpDSVVhdDE2cW5xRFBlTWp1V3lWYm9U?=
 =?utf-8?B?eW1XRlVqc3NDV0dBc3h3YitZd1NBNURXTzVKWWl5ejdSRVpsbGRIcDZOY2RW?=
 =?utf-8?B?TmlzYUpkWFVIK2xBNE9qZG0yWEV5M0QwTXA0c21hakZZbUVTKzRhbXJhZmpp?=
 =?utf-8?B?aFo0TCs2QzgyRVhxT1VCUmU2TnB2T3ZBYS83VloycEtGNVR4OGEwNnQrODk5?=
 =?utf-8?B?RzVKWEZLS3FYbEF3V2QvU1ZQNG1QeVgxcU44N2F0TVZqTWVLclRvQU9ZamZQ?=
 =?utf-8?B?eHVPWi8zUTZGNEVZOUdURGtxQkNld05qak5obU5NYWM5Um1XeTJKckFyK0dC?=
 =?utf-8?B?WGZ0T1lMbDZiTEh5SDJwdkRrRi8ySFZvL1ZxT045VHp5NFl2S3d1MzlQc0VJ?=
 =?utf-8?B?b01Hc1VPcmYyc1Y0UEhqUDV0RlFJQnhjbzBQN0N4WkRmV2hJUnlJZmRoZklW?=
 =?utf-8?B?cGZ1S3BLb3BPcmlxRjJTaU1BUTBXSUpiRUdoRXFYTC9IaUhkVFBMNlIzZHd6?=
 =?utf-8?B?VWRFQkFtOEMvcEtLREMyd2J1T3BndkY2eWhyZ0ZlaE9pL05ncnRsT0hzMVNp?=
 =?utf-8?B?azliZXFER0JoYUp6SzFZQXd5dGFUVDk5Tm54TEtLRVBwSXltVU03ZlNmVERm?=
 =?utf-8?B?VWZNY0dYTmVtN2hqQk1pK1ZRcjdSUGNpaFRyOFV4ZFlyNXB4VnJwL1ZxNWlw?=
 =?utf-8?Q?ZwCmdQ8qU7DuBb/IOuPQPTRLo?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1da975-8d44-4ad7-2273-08dc9a8f9b49
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6188.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 12:07:55.7526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXMmXpYdMB3I+J/ZffRib5aAHFDcErQwVhCNVHJ3c+T51f4igwYoWetnB2XNir705IUkYBjkXXuTXy862XliQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6005
X-Mailman-Approved-At: Tue, 02 Jul 2024 17:49:15 +0000
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

On 7/2/2024 2:02 PM, Lukasz Spintzyk wrote:
> On 6/24/2024 12:05 PM, Daniel Vetter wrote:
>> CAUTION: Email originated externally, do not click links or open 
>> attachments unless you recognize the sender and know the content is safe.
>>
>>
>> On Mon, Jun 24, 2024 at 09:28:29AM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 24.06.24 um 09:10 schrieb lukasz.spintzyk@synaptics.com:
>>>> This brings cursor on DisplayLink USB2.0 device on ChromeOS 
>>>> compositor that requires either crtc'c cursor_set callback
>>>> or cursor drm_plane. Patch was tested on ChromeOS and Ubuntu 22.04 
>>>> with Gnome/Wayland
>>>
>>> NAK on this patchset. UDL has no HW cursor support, so we won't 
>>> implement
>>> this in the driver. Software blending should be done in userspace, 
>>> where you
>>> have CPU SIMD available.

Thank you Thomas,

Please check, my answer below Daniel's response.
I think that compositor still benefits cursor blending in the driver.
At least for ChromeOS in which udl based devices are only one without 
cursor plane support. I believe it can simplify compositor code in this 
case.

Another topic,
What do you think about "[PATCH 4/4] drm/udl: Shutdown all CRTCs on usb 
disconnect", IMO it is unrelated and happened to appear more frequently 
with cursor plane.

Shall I re-upload it as separate patchset?

regards
Łukasz Spintzyk

>>
>> I think for drivers which do cpu upload and are vblank driven there's
>> maybe a case for kernel implemented cursors due to latency reduction if
>> the blending happens as late as possible. But udl just goes right ahead
>> and uploads, so this doesn't help I think. damage tracking should, but we
>> already have that.
> 
> Sorry, I don't get what you mean here. This implementation uploads only 
> damaged primary plane area (gathered in 
> udl_cursor_plane_helper_atomic_update) and uploads it to device in 
> following immediately udl_primary_plane_helper_atomic_update. No full 
> primary plane update is done in this case (which is done only when 
> plane_state->fb != old_plane_state->fb, please check updated 
> udl_primary_plane_helper_atomic_update)
> 
> Sorry i don't have hard numbers for that but this in overall should 
> improve cursor latency (especially for move events) in which case whole 
> primary plane render is saved and cursor update can be done without 
> waiting for next vsync of the primary plane.
> 
> Ihmo this implementation can be useful to test and implement atomic 
> updates for cursor plane in compositors.
> 
> Anyway thanks for your(Daniel and Thomas) responses, if there is 
> something I can do to push it then let me know.
> 
> regards
> Łukasz Spintzyk
>>
>> So concurring here.
>> -Sima
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__blog.ffwll.ch&d=DwIBAg&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=0p1mI1lUPD-etxZm5xwnMe2dJnw8yCkW8EVTCGmBDPo&m=M1yfa7XuJVH9rCMPSuFfUD51RJsC3N6CNXSv9yDKmfmSUijg5Z3ngLzUqKBnbTgJ&s=Cs7RKpEwGAz4cdSnl3jqFctOKhaOpoHPGw3tSRPW2OI&e=
> 

