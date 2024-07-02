Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7809246A7
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 19:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2C710E194;
	Tue,  2 Jul 2024 17:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=synaptics.com header.i=@synaptics.com header.b="hgOLtnQt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2112.outbound.protection.outlook.com [40.107.93.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D76610E034
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 12:03:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ap9gucgqYcOdSanbI9QSnVQEcPY3ulAjruh3EYJKMGzL7i+5UagM22W27pIC5BsJ5nQy6xhVS3DOCizx2H+gGjFQncOrFOcrUaK5ctr15xCfw39UvbWWn1DzBfNIIJKIENwICv1qQqV+2B426xeldxILM5f5cf6jhiZdk113gqvfVQHnnGS3qRG1WH6al4by9S0K/cJKzxoGafHk0495IOz8r63Gu8eKnb+FYFvZmGEMwnJ/qw+RwacAUzYNDrdUiAjG7dffb56n7SLiwn8769fm5adzT3nvPL6BTzxysnAK8rusk5mYhE1Ur2YZUxN/oJhSkagItLEZD8NxvKaxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLcwfyMJCTVZYS/7cJNsHhivJR4jvhLoYPtIiT7oorU=;
 b=VtPygSU7a0+HE9S27UW4GZL3C+uYvRytK/LfYMiiY6eXNG1GjYRXDgdI13a0a1htBgqTwcLn/xvTccgfwZo+DwNsshaH7pjtI3waDrUBW6G79D99ryCwiKGKUuOp1dA9b8h9vsYIe9DV8fBIR1gkEsyvpTpMmhro0yYL0LQkDgZMajTaNioVvpZIZBwfFfxklPZ1FMUqn0uo/lz2KEc1JbDNRCbiVHM3JP/ggkAo93ch98ZbXJhr6iZScs6BvYI1p9e0lOFR92ccstzxs25BJPhNNjW6d3pQ9NNIiIoEA+0+VCGuX5CZok3H9bHIeyk4UHlzeF+6Stv3LAcPazhkOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLcwfyMJCTVZYS/7cJNsHhivJR4jvhLoYPtIiT7oorU=;
 b=hgOLtnQtL0/orq/Ew7eqjPGxLzt99U0U3li0PNEq9WqyFFiXrZMrwNXoTIZMqmHTiToeVFfgRAlDYwOL5hV/DVnBwVAOgwXOp0QWlO5y3staTLJTFxb6PmLXDSr1daAeuFMLglln+z/n2kg/KHcZLgJbW18hKr8zbxDQDjh8Obg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from BN9PR03MB6188.namprd03.prod.outlook.com (2603:10b6:408:101::18)
 by MN2PR03MB5198.namprd03.prod.outlook.com (2603:10b6:208:19e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 2 Jul
 2024 12:02:59 +0000
Received: from BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990]) by BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990%4]) with mapi id 15.20.7741.017; Tue, 2 Jul 2024
 12:02:59 +0000
Message-ID: <0dd740d1-0046-41b0-a6ac-83ef0b023f63@synaptics.com>
Date: Tue, 2 Jul 2024 14:02:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: drm/udl: Implementation of atomic cursor drm_plane
To: Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>
References: <20240624071041.5087-1-lukasz.spintzyk@synaptics.com>
 <5fbf1be7-5049-4596-9ad0-d40d397396d1@suse.de>
 <ZnlE-Wm2gim2Unnz@phenom.ffwll.local>
Content-Language: en-US
From: Lukasz Spintzyk <lukasz.spintzyk@synaptics.com>
In-Reply-To: <ZnlE-Wm2gim2Unnz@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0247.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::20) To BN9PR03MB6188.namprd03.prod.outlook.com
 (2603:10b6:408:101::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6188:EE_|MN2PR03MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: 4037dc2e-482e-46dc-ad2d-08dc9a8eeac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1hWYWlQekI4QjY3VUsrMkxXclhCQTk2V3cwTTBqMWk4MTI1TkdKWXcxT09t?=
 =?utf-8?B?QWJIcTFWeEFrUkkvWjQvTFBqOWRpckpaQUFxYnYxQjZYWWJ4OFhqazZCYitG?=
 =?utf-8?B?aW5Oa2hDK0wvb1E3UHJSSGRVUmRwNm55eENBbkNZSGRqUTIzY3BPL0RLbGor?=
 =?utf-8?B?d0c2Yy81aXV3QVdrRGo2ZjN2VGlnZ29ndlc5OXRDdjhyQ1cyZU9mZGhBZ3ZU?=
 =?utf-8?B?Vjh5ZGl5MmdDMlVEd2tEbkdQY0ZhUEdoNkFnNkZnbmdURHlVRjZjVjlUTUhp?=
 =?utf-8?B?aW9IYzFUblZ0MHI2eG43VG5KdEZzUERMUVFVWmVPRFdhTzJtTDRVSlpoaUt0?=
 =?utf-8?B?TU1ab3J1aTZJRXdFS1dxdlhPZms3MEhabjI5a1dkQ2NIUHlVZ05YMkRGc3NW?=
 =?utf-8?B?YjVRbXZQL3kxS0xDcExWTFlhd0lBVlNiOFZjTUloazB6OGFqRGkrczc4ZDRS?=
 =?utf-8?B?bTJiT3E2VWwramJCV3FHeVJ0TkdFTzN5T2M2SncrQjFpaFRBVHlOdXFhaU9P?=
 =?utf-8?B?MDNBcDhkTDdITXBKU0JqVnkvcTlkakcvSlMrSlZsQVdXaGtRUjl2S3EwZThQ?=
 =?utf-8?B?YW5xTWVyU0pJNTN5NWFLZTY2b3Vuc2RJaklCMXlnUVNpUWJYTHFwenhyejRU?=
 =?utf-8?B?dm1iUU9DQ0pMczBkTGhDR1E5SGErSGRsZHp6cFRycW1ZK3ZWVzFMcy9GWXdQ?=
 =?utf-8?B?N3FIN1NDdFBjbzZNd0JrdElQbXlBbUpET2o2d2grS2hyVTNYbTlnRVYrcmVY?=
 =?utf-8?B?T0JuSVBzY3pnUXNXMUl2OElUVTdITGFqVlBrZzV3VlF6eHI3Z2FkTGllTm1B?=
 =?utf-8?B?LzF5UmpCN2I1VElXdDNqU3RxY1Bxb05CYXJ0Vm1LOUhKQVozcThBZHNDd2hC?=
 =?utf-8?B?UGtnUW9ITnhPUXVyL2lKeTJwbjFFUzliVENYZ1A5OUhHY3lRL3RmQW92YlJW?=
 =?utf-8?B?ZEwyZWR5THhMNU94cFNrWks2TEZ1YWRVL1NVVFY2WUFtNVNQVnRHSGJRa1hB?=
 =?utf-8?B?ZGFUUHJYa1lvKzBXWnZwMFVFOExOMEQ4N2ZCekJFU1RQQVVkZE9FenhJNnAw?=
 =?utf-8?B?SklFcEwzd2RoOVpROXViMGdxWUI2aEx3NXYwRHk5Q1BHd2pDNCtJakpsZ29I?=
 =?utf-8?B?T1o2V295aDh5WFE5V0xqUy9EWHVhWWlsZ0VJd3RyZzJaTTlJR2JjUThDNHVV?=
 =?utf-8?B?WGw5cDdDWGV5LzE3dlhSNGR0M3puQ05qcVU3SytCZlhxZzR1Z1NUN1AyclRW?=
 =?utf-8?B?eHJPdk9UdHF5eU53dm5FOU8vWE9vWS96TUYzeGlyQnNaTG4zdnQ3UUJxRVoz?=
 =?utf-8?B?dThKanVGWEFKd1lwK0QxT3J4cy9YS1dXL3NucFZyeEZLMUYyTThDMTlVbXQz?=
 =?utf-8?B?dzQrV1FtdXFuNzkxYXd0QzZKZ1BzMDZKckVwUjYvcHhUK25ZcEtSRU9BNnQ5?=
 =?utf-8?B?OXl5emxvcFR6OGVhMWl4YlQvZTZUSDNNay84NDBQSlpHbHpRTVRWTWk1b251?=
 =?utf-8?B?YnVIZDZLd2VLOExKUEl5blRlSWwrZVdqTkFkZUJtb292WkswZUNMMkxKUHlF?=
 =?utf-8?B?U2pkdGVTRFBUcjZOeWNBS2hpSCtQYTVVbWN4ZG93VjBPV1VIYkJzRXU3UHU0?=
 =?utf-8?B?YjErTlV0cUhBVWZnU2dNSFFEK2hxVlA2WXc5RGhoVWVHbWJadTllL2lqN2kw?=
 =?utf-8?B?V0JZZWRRdFZ3MHhxMmJkandvYnp3cHZ4VkFBWTNJQkpQMi9hNzA1cElBdHpI?=
 =?utf-8?B?bGdJT3BKRHAzajlUVTBtT3VpN1o2bzEydVBLWXo3QWZwUlZGYUtXZW4zNGZm?=
 =?utf-8?B?dnBOR1J6U0JvY3V0WVV2dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6188.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1hqOUFCbkQrbkhCM2JzSlVRRHZPQzNCUFIrejNaeEI3akpwczJ4dVpLdTVB?=
 =?utf-8?B?U0hWVk52ZWFmc3BOUklmY2p2TFFCQkdldVY4SDNmVURNR2ZodXM2SWJzM01W?=
 =?utf-8?B?ekxTektEc3VYTkV5ODJlZ0xzNEhPMmVyT2VkcmF2MksvdjhTSEdteTlGOXht?=
 =?utf-8?B?Yi9LNUJ0NCttOExCUGxZbzA3MURYQVdMdUtPZkNxejJSeGtHODJkUWJNaXVK?=
 =?utf-8?B?bXB1S2VIMi9xeUE4d24reGNnd2xXWjN6Wm16eTBmeFRYZ2tiazNSeVpKZlpR?=
 =?utf-8?B?dytucU51Wnh4eDZnNEI3ejNXZmpLWnhvUWVBem1Ra2JSZjc3VVA1NTd5TGV5?=
 =?utf-8?B?RGxYaEZvdkNWUlpUYk9tMlAzdDY1Nnk5Z1loanViU1VxNWJHWWNwS1BvdWRB?=
 =?utf-8?B?ZDY4SUdpWGRGZHZpZThtS2VtRHU0VzNNY2JscXFMazdYc2dtOWlONFREQmRl?=
 =?utf-8?B?dHRtaWZrOWJKSFdKOWVnUVJLbUY5aGdkc3VoOXJPR2VwY2hCNHAvbFhLVzdZ?=
 =?utf-8?B?TWtGT3VSTGZ3cEdzVTRSUVAxeEFPSTJVS0ljUGVvN2NPMUZ3bFMrcXFpZlRx?=
 =?utf-8?B?NTNvNU9Mc2N6aHZidGIvNkZidUJDc1NDQ1lpS1laaHRFdjBIVGo0QW1IODhT?=
 =?utf-8?B?bFlmeERUYTU2RVVZQlpQZzg5L3hIMEk3QXBaMmZ6cmdIUEdQTWJxZG5qL3BQ?=
 =?utf-8?B?VEltQzhVQzIrSU81Z1RCbkhBeUg1clpWZkFPZ2VENi92a01ycWtVZ0dKUk1q?=
 =?utf-8?B?aFNWTEhIVi9jZDBSK3hrTnVxYkU0OTBkQ2ZSUldXWUozUll1Qk5iMkxPREtz?=
 =?utf-8?B?bHIwREQzdUNQYlBZZmxUNXFVenhleWg4OFBIcVdRMDZjb1ZHbS9sbllObjRj?=
 =?utf-8?B?RmYxMzFtWC82Sm1DUHFleWoxZFBNYnJscWNtSWd6OVRycFBZZlJGMzlmckNP?=
 =?utf-8?B?dzlvSDY3VU02WTErRHJHb1YxSk5oNUg0V1lUbTFwRDFvbGJ6aVdNU2MwQ1k0?=
 =?utf-8?B?SGNXcTNCeU1CTnVHaVptWFovSUJyZGNkeVc1cVd3TU5UMmpXT2MwbytKa293?=
 =?utf-8?B?MktJYlNhdURCZ3Ryc0tOdmhTUkhSZHFWb2NOcjZ0cmpTL05wOTRYNytlNWVp?=
 =?utf-8?B?NUY5MGRFUHBHdjBpNG1PNkVYR2IvNTVIc05weHdUZ1Z6V0JkOVJRUDNQOHlF?=
 =?utf-8?B?bitQK1N2M1NBeGN0ZkZITlhZZFFNWXZhMjhIUXRma1dkWXNraE4ydElzek5p?=
 =?utf-8?B?Z2VzR0hvNXFBVEtOL3NMd2xmL0x0VVpaZGozQkZ4cGdCbjFsdWw3T1hxdHRv?=
 =?utf-8?B?WVBKS1Q4QU4zNVptaUVuVW9PUDh2a2FnQUNwckgram9DblJoeldQSFcrbGN2?=
 =?utf-8?B?ZElBcHdUWHEvVHFhRnllSjFlSmtVVFZRSTZjbkRGbFhyNS9mVHFzSnlDcEhr?=
 =?utf-8?B?K1FUblBqQ29RdFhXcW4xZlVraDdzNE96cGxMS3RDK2t0aUhkcDVjZGVIRTdZ?=
 =?utf-8?B?d3BsZmlvakhkKzRtR291eGdQTkZYeGFWTmZyV1hIN010UEMzNzZmUGZwVmhx?=
 =?utf-8?B?UFBRZk8xQWEzZkRjOEs5TVQ2cjNWbE1hK0x5TzE4V04rWWx6MGZ2Yy9FLzlU?=
 =?utf-8?B?cTJjV1FiL1VWWWdpbTltWXZpdjZxd0xpdWNsRWF3NmV6RGtKcVl6d25Qd0o2?=
 =?utf-8?B?MVR1S0cxVE4wdEpFUmp5dC84UkY3ZGNvVmI2Y1VuYXpiY2lVY1ZWZnZ3N0FQ?=
 =?utf-8?B?cmgzSnpSVUxIWGRvS3h1QXE5SW14dE42UDZFVTVRdUhVeXlmYjB6YkJFMVcx?=
 =?utf-8?B?VlRDUmFuMmxBeFdXbUhlQWgweHRUTWxCMGFuV2tvUjVrbzRDY3huenBnT2E2?=
 =?utf-8?B?dk1pTWlDemVoZTdqK2xDTW5ySXJ4cTJWTGxPZ3M0ejBXb3pUOTA2aFRnakMr?=
 =?utf-8?B?NnRBcjU1eCtRbzRweW9UZFBEQlp0bkRqa1N4ZEZKVzIvTSs3bWl6TW9kNFV1?=
 =?utf-8?B?c1JlNngvdS81YUlwRWIvK0RRQ3ZSSTVhak5kSDZxVVBLeFNaSVBsaFdERjVq?=
 =?utf-8?B?bmRGcjBiZkpzMzRZSXNoM2pWVVdoSGNhcW1OVVlyZUJqMXdyZC9jSlZSeEk1?=
 =?utf-8?Q?UvGm6y6RM2QpxNtIURkbPsjT5?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4037dc2e-482e-46dc-ad2d-08dc9a8eeac0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6188.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 12:02:59.5849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mKimQC578maHRgc4Dfz+j7D4u8pzRcqb7ow3eeq650KsRSMPRtGlXPEN0a2LmokmWP+7jQZHess4lqvEReODQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5198
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

On 6/24/2024 12:05 PM, Daniel Vetter wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Mon, Jun 24, 2024 at 09:28:29AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 24.06.24 um 09:10 schrieb lukasz.spintzyk@synaptics.com:
>>> This brings cursor on DisplayLink USB2.0 device on ChromeOS compositor that requires either crtc'c cursor_set callback
>>> or cursor drm_plane. Patch was tested on ChromeOS and Ubuntu 22.04 with Gnome/Wayland
>>
>> NAK on this patchset. UDL has no HW cursor support, so we won't implement
>> this in the driver. Software blending should be done in userspace, where you
>> have CPU SIMD available.
> 
> I think for drivers which do cpu upload and are vblank driven there's
> maybe a case for kernel implemented cursors due to latency reduction if
> the blending happens as late as possible. But udl just goes right ahead
> and uploads, so this doesn't help I think. damage tracking should, but we
> already have that.

Sorry, I don't get what you mean here. This implementation uploads only 
damaged primary plane area (gathered in 
udl_cursor_plane_helper_atomic_update) and uploads it to device in 
following immediately udl_primary_plane_helper_atomic_update. No full 
primary plane update is done in this case (which is done only when 
plane_state->fb != old_plane_state->fb, please check updated 
udl_primary_plane_helper_atomic_update)

Sorry i don't have hard numbers for that but this in overall should 
improve cursor latency (especially for move events) in which case whole 
primary plane render is saved and cursor update can be done without 
waiting for next vsync of the primary plane.

Ihmo this implementation can be useful to test and implement atomic 
updates for cursor plane in compositors.

Anyway thanks for your(Daniel and Thomas) responses, if there is 
something I can do to push it then let me know.

regards
Łukasz Spintzyk
> 
> So concurring here.
> -Sima
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://urldefense.proofpoint.com/v2/url?u=http-3A__blog.ffwll.ch&d=DwIBAg&c=7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=0p1mI1lUPD-etxZm5xwnMe2dJnw8yCkW8EVTCGmBDPo&m=M1yfa7XuJVH9rCMPSuFfUD51RJsC3N6CNXSv9yDKmfmSUijg5Z3ngLzUqKBnbTgJ&s=Cs7RKpEwGAz4cdSnl3jqFctOKhaOpoHPGw3tSRPW2OI&e=

