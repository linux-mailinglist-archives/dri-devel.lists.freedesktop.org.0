Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B9BA89DA1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 14:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A7010E75D;
	Tue, 15 Apr 2025 12:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DOI1DNOZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73E210E75F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 12:19:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDJHZJzyAU/gPOJ5/hgLst3HaWW+49NRkExbu4NrTosk1bMMYyo6VgnNg6pBxPJ6egywh2KcjZcdjN8D6+NNzz+4Hj/ev3uTX0aMdSXFEQ9KCG/1DbVjQ+dg+HvOBufAZndfMzmk4jokjoY2QRhtBqH8C32iQBy/aQo4KgvmOrdDOQ54GCL/I0SJSuZNSQgIcxhZcghON3PxxhJuQXvvS/ng7ZH7VvXhdac6F2P3x4HzTx18iQGeOwTbmg29LSx+00IQqeSraw9Bo9Fsxyaw+eOXPydmj/tEtV5FDb2ZHxRBnQV7p55W+Fogf9PCDQc9eh2VdqdpTgcPjmjUDTXcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipNnr7Ed9LwalVEN4xkousAHOvB031M6nENTI0gczPA=;
 b=BlItQUcLBwh196lZ4u7B9mzcZhVamuihcHpOeM0N+vlj7bipy0zA2bmNDILYbeiUw2nIZbxelI15u3R/SDle4iPqPSt0X+GRrV6kvs6b+SJGqBQ0dgVpMIsVQ6S+j8MxgjyPY66lpx1rYI/QoMUf443s/M/MldTvXIFABIy3Qx1535cbZ1jEjfA6NuaUpH3+xFCX4nsioMgCT7fITWHp9rx9LpBO9m5RiudCrFsvdTcVNrWE2l8dUlUT2okXiphJUGfRDwCQww1YszceNl95KfllnTeDNUtswXiRhck5FzHJKWxJpLZafB/YxDACZKLqk54ys5i8J6wmaWvECarfIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipNnr7Ed9LwalVEN4xkousAHOvB031M6nENTI0gczPA=;
 b=DOI1DNOZ5S2W+0aOol3BcFu0n2ffMiQVpLmuDSPSyoBKWZ7a0FLCvibDJSNJ298h7HErB17OBDmTAW9CmZavc1T53R9IfvpfY+InNRS6Y5zMkVL8uTR4Ee6RXszxZaAU5uz2AqlhOPpHhBR5EME3r8HaNWxZmbU5nXIDqDXixfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 12:19:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 12:19:27 +0000
Message-ID: <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
Date: Tue, 15 Apr 2025 14:19:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250415092057.63172-1-tzimmermann@suse.de>
 <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
 <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0265.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f2fa961-cd6e-4a7c-2023-08dd7c17c3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anJsU2lsR2k4UU1vQmZhTGRqTG44L3JrSkRXSDlDak1WSGt5OXZLbGFjK1hZ?=
 =?utf-8?B?L2h0SUtaUWVEUlFpN01iVWJ5YU5aYnNHVXdZcVhmbm9PNzNXY0hJckZjcDBC?=
 =?utf-8?B?YWJwM0xmVnhaWk80bFRkOUhqSGg1Znh3MjJmY0N2NGhVUjVxVU04M3lzbndE?=
 =?utf-8?B?Y1NqRFBHRGJNcGNBb3IwUHJzRVNFOW1PK2ZHYlVvUlhYazFlVWJpVVoyMDhs?=
 =?utf-8?B?UjYyTWorUDJmV1diTHpoWHdOMXlkaFRXZXNqbURwT1JDOWhhZjk0ZFp5c2t4?=
 =?utf-8?B?R09PdDlTS0dJTnc5ZHlrMGNDckhTVDVqaEVURC90TEVraXcrOFNMS0N5bWZ3?=
 =?utf-8?B?aVVHUzZqS1pwL3VpblhrcmpnZnJBbm1pMm83UUZXRHB2MUs3TEZaQ0hCSGRF?=
 =?utf-8?B?d2dqazN6dmo1MGVZREdiWjM2Nm5waEpkRGJrVVovMC9YQ2lRODQ1ZDVuY25U?=
 =?utf-8?B?Q29SMGd5TCtGdU9ITUp3YzVnZHhpcVdiWUZhR2REWGZMVDhqM1AydWVZdjVI?=
 =?utf-8?B?RUJlVDQyc2Y1S3VWclNhOHl2MHh1bncycldVS1FTY3ZjNkRLNkpUZGV6VDRL?=
 =?utf-8?B?ajNreEZPTkxqaG1uN2R4UlpaNXl0bVNLY0k1aWl3Zkh0dm5KQ2V6eXg3WFRT?=
 =?utf-8?B?RXBHRnhhZm5LQUMxcktSY1h5U0RCVHFncTlNMG9VdHVSanhXVzNaK1pPcTRw?=
 =?utf-8?B?WS8rcUg1dXdIZy9KSUV3LzkzQ0xEOGQxNWFrRnNlTURKNWdWVkJmRzBWbGlq?=
 =?utf-8?B?d3FZVTBJUGJnYmgxWWtxM29oV0N3TlVHWG9wZFU3N29DTTBlc2MybWtyVHYy?=
 =?utf-8?B?TVcrb3ZPbFZTdVBzY1ppNDJzTktzUjlnRzZ3eU1FTFlSZjFXZDV4T0NvWmFq?=
 =?utf-8?B?ZzlheTAzM3lQeXBKb3pzbnBmeGJlaUd1ZFY3MVVHWVR5eGtsZWQ4b2l3ZVJ2?=
 =?utf-8?B?Ty9jMGpJTE04cFQ0eE1QNUpjMGtSbUVFZGQxQ05wTkw5RmNmY3VSb3V0UHow?=
 =?utf-8?B?cWx1YzRnNEdoUUJoK0ZTOHhHYUNpSExxTjI1L2RQT3UzM2hsNGlVdFNLWW5Z?=
 =?utf-8?B?anVrWkRGUytmSjJZVGpya1dIOXRNOUdyVnR3S29mSXpqelNmT3BmLzBZRW5L?=
 =?utf-8?B?Z0R0Q3YycVEreWJNQ2U3ajZKRG90RTNFWHhxVEJEVDN1cDBmUk9JM3lmNVZa?=
 =?utf-8?B?SElLSlVwMFMza0k2bVlEZ0lnZUVtQy83NlEvU1ZmMXBZOEhFZGJZMFozclBL?=
 =?utf-8?B?c1ZUNWFyRTFqejNvVnFLNVJkZlhjbkMyaG5hcG1BNXhQUS9sUmliV0MxcGI2?=
 =?utf-8?B?cUZLRDQrcHVUYUJVRnNZM25WcDlscHNJMmcrRm5lZWpReFlzSHJYK2NpZ0lO?=
 =?utf-8?B?SnpvMzUxOXZsMU1mK1RWUTlEY25UWVFwQ2ZRTXYyOUdCaUMwcmpINGNINGpl?=
 =?utf-8?B?RjBwSEMzYXR2TU5XVEhhMmdnb1pPNko0ck9qVXIrdEE4MHNHa1lIcld0a2V2?=
 =?utf-8?B?eEdGU25DaDgrQmFJREhyZTBHN1IrNFNlWW9NQTRKcldoR0FUZUxObjMvczl5?=
 =?utf-8?B?ZFVnaDZnai8zcFhldjZPR0xOWmRuT2psTVVjeVd1bUJnelhVNnp5K3Vhbkd2?=
 =?utf-8?B?VWVMcTNvTmJ1bEZhamdjeHdKbmk0cGFyRm1hRHdsM3FtdzJGSWF0cDVyZnY3?=
 =?utf-8?B?WGtTU3dHOUdrMkxZeVFrYnMwdnBQcEYrS2tPbUpoandMa3p0ODhNaGEyeDJI?=
 =?utf-8?B?T2tqa3NVRzFnV2IxSnVGdE1EQWJLNzNQaGlHYXYzWUs3eFYwQlc0Um84OVpQ?=
 =?utf-8?B?TENVZ052cFdnM2tWZFh3U2VnNXdZMlpiWU1qc050czIwM09aQXRXVVlaNkxZ?=
 =?utf-8?B?b0RRNEVyTmVwMUJxeVlDYjErbm41Rks5UkpDRGhDSFFvVC9jSDFhODBFUUNE?=
 =?utf-8?Q?iBApS1K3IiA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnNqYlJvZ3pkSTZXRityemQwekJWbUJ3YXhXOU5IeXowQXNNY04vemZOUnJt?=
 =?utf-8?B?NzRXbDR6RkNjTVRoOWgvbjJzTzlkcFU5VUV1andjRWxDcjI5OEdxSGtKUTZt?=
 =?utf-8?B?TDRHNXBLaTRvVWoyWE9LNjlLR1c4VlE0dm9LU2t6ckZkMWlSUHRpVTRoVWE2?=
 =?utf-8?B?amlZeW1EdENaQllZTFBlT3g0SFJ3emNSTnJvMGRQcGpVdmc4UTlFSkJPeHlJ?=
 =?utf-8?B?MDlhSFFxT2ZOY0JpOWVDNGRBMnN2dzZmeFBISC95cjgvcmRaWjFRN2VWYzdE?=
 =?utf-8?B?WmkwMUVVNjhXdmdGbC9nc1dlSGtnNStUYVhRd0dicGxFTDhVdGpYeFBkMDht?=
 =?utf-8?B?YXVQam51RmJ6NzdYUlZPK3ZDM245UmE4RUxHWWIvU3FwVDJyRERSMEZSRUlN?=
 =?utf-8?B?TVdQL2N4NEpKTGI5dHpxZWdsOEloT2s0MGQ4aC9LRERzbnNJMStIbis4b0Y3?=
 =?utf-8?B?SjlwRFFYOGhyNTl3UkQ3MnpsZlZZZkFBVStBU1hSM1JQZVNGOW5KSjJkMEZT?=
 =?utf-8?B?RWRkQWRJV0w4N25QL3dZUUlMMkE1Rnpxci9DbHQrRk5nQldIbFRyQmRMT05O?=
 =?utf-8?B?c3BMNnVHbE4rdG00V1ozcmdRZmhDeFFWeG5yOSt6R3VlRC9QL1RMWlFyOFVY?=
 =?utf-8?B?RWlYaUpmS3d6TWNJYjlPVmhjU2s4c3pNd1JHa3drY1JtTGoxc0RWZnhoSEtq?=
 =?utf-8?B?Y3QyUE16c1c2b2wzK3pVdStVYkFIYko1Y01UNVJQUWFRODlLSmVkT3FsZ1By?=
 =?utf-8?B?MllpOUgySUxYNGc1K3lnRjNlRVFHRWVPSjdtR0dzS2dNaHVON3Zkb2JWa2wz?=
 =?utf-8?B?aFprUUJJYUMvb2RDc0JJSmp4aDdWZHJOcHBhbkpDS0Y3dVhQejJ0VG9WZm5Y?=
 =?utf-8?B?NzVHZmh2ZWNHQ3FUKzNvVHluYXcvYWMzazBLNHlJalcvNXBZR0tVSi9FenFi?=
 =?utf-8?B?cUpBSldpUEtVbHpjWlh3dENXRkg4b0llaCt5UGRkdXQ5b2crM0dMdlVHeEdt?=
 =?utf-8?B?OWpYcUpLWjdiVVlCSlJ1Q25mcDZmSDVvR2hkQk8yQitZWFhxL0RGSGtmdWtn?=
 =?utf-8?B?bjNoWTVBbWhGcXYxWmVCWlpNdWY3UHgvTnJzdVR4VmVtekc2NWozdjJjZHdH?=
 =?utf-8?B?WElyTGRrb2UwZTZ5bFpsdGJWbU54cThTYkFnK0cybnJGNmVMNzJDSWpBUTQ3?=
 =?utf-8?B?UGVXMmtaY2dtVWlmbVovRVAyL1QzR2xUQVhrT1JpaWlXQ1B1dVd4TGJIL0FI?=
 =?utf-8?B?RThYVXYrd3IvMDhJUEhQMzhsY0NJNWxUNm1RYng2RjhVUGRLUDFRV3hQbDA3?=
 =?utf-8?B?RlQzekpvQzdTcVJkZXdicXRZMG9NK3lRd2JxZWRYMUYzL0pKZlUySFpTbEp3?=
 =?utf-8?B?OU42UTJEN0xPazRnQllKQ0RhU3ZsWkhFSS9CU0ZMVFJ6RnhGam9UUm9LSng0?=
 =?utf-8?B?cGFuN0R5T1o1ZVE0ZnBmSW55OXpBeTF6ckoxOEZ6dnp1Z3pYMEI2ZUVVK2NN?=
 =?utf-8?B?TDJGTGJRWnRONzZkUE1nNUN4SWpiUDhmTVhETEMwY3U3SUl2QWdQdEJPRzBw?=
 =?utf-8?B?SzZjdmRuQWNVWFVPZVJCUFF3L0o1RWFLamR4QkR3L2hUbTJFL0UwT0plbVFl?=
 =?utf-8?B?Z3dsUW1lai90Mk9iVHZHd2IraUVvRHFXMDNkS3lTZjBZQ1NZdm96N2lnVXBZ?=
 =?utf-8?B?S2F4N3FjQ0tpUUF4NFB4V1gvR0VXWUp6U2R4dmx6Wm9VNVNKSG15Z0hEQ0hL?=
 =?utf-8?B?dFBGNy9jZk1GSkU0VnlSb3RWb1JYRnBIOFdHV0xrS2tXQnVTMzJSdDNvV0pP?=
 =?utf-8?B?TjlvMUdKVWhkbmp6b3hPWEdTZWRPeElWVTZLQm43R3A0aEpxeEh4dlZmUCtF?=
 =?utf-8?B?MmZTaEM0aUo3bHJoeDJvSlZrWk5id3g4Y3I0ZzMrTWRpTWZwV3pEK0RISGRL?=
 =?utf-8?B?YXhKZnRReDZ4Nmk4UDg5R3Z1VmJrMEtoQmc2Z1hWcFlOMWdWRlk1L2hhY0hq?=
 =?utf-8?B?RlpxYjE2cFNKWkhVd0lyY3QyNTNJRnZ2bkhHckE2U3ZyRzB3cWYzUm51OGc5?=
 =?utf-8?B?MVhnZDJiWEhCeFJQQlV4RmQ3eVRGclRtaGxtUmc3dlZDeTRIcmxpNnNudldY?=
 =?utf-8?Q?Ufyc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2fa961-cd6e-4a7c-2023-08dd7c17c3f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 12:19:27.2641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NaYRrSRKQ9bVewzF8DTcYTieYwBKN0rYZnatoRBowlzBxXNg1G4rvcwPycDe+BW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276
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

Am 15.04.25 um 12:45 schrieb Thomas Zimmermann:
> Hi
>
> Am 15.04.25 um 11:39 schrieb Christian König:
>> Am 15.04.25 um 11:20 schrieb Thomas Zimmermann:
>>> Test struct drm_gem_object.import_attach to detect imported objects
>>> during cleanup. At that point, the imported DMA buffer might have
>>> already been released and the dma_buf field is NULL. The object's
>>> free callback then does a cleanup as for native objects.
>> I don't think that this is a good idea.
>>
>> The DMA-buf is separately reference counted through the import attachment.
>
> I understand that it's not ideal, but testing for import_attach to be set is what we currently do throughout drivers. Putting this behind an interface is already a step forward.
>
>>
>>> Happens for calls to drm_mode_destroy_dumb_ioctl() that eventually
>>> clear the dma_buf field in drm_gem_object_exported_dma_buf_free().
>> That is for exported DMA-buf and should *NEVER* be used for imported ones.
>
> Did you look at the discussion at the Closes tag? Where else could dma-buf be cleared?

Yeah, I've seen that. The solution is just completely wrong.

See for the export case obj->dma_buf points to the exported DMA-buf and causes a circle dependency when not set to NULL when the last handle is released.

But for the import case obj->dma_buf is actually not that relevant. Instead obj->import_attach->dma_buf should be used.

Regards,
Christian.

>
> Best regards
> Thomas
>
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
>>> Reported-by: Andy Yan <andyshrk@163.com>
>>> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
>>> Tested-by: Andy Yan <andyshrk@163.com>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Anusha Srivatsa <asrivats@redhat.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Cc: linux-media@vger.kernel.org
>>> Cc: linaro-mm-sig@lists.linaro.org
>>> ---
>>>   include/drm/drm_gem.h | 8 +++++++-
>>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>> index 9b71f7a9f3f8..f09b8afcf86d 100644
>>> --- a/include/drm/drm_gem.h
>>> +++ b/include/drm/drm_gem.h
>>> @@ -589,7 +589,13 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>>>   static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>>>   {
>>>       /* The dma-buf's priv field points to the original GEM object. */
>>> -    return obj->dma_buf && (obj->dma_buf->priv != obj);
>>> +    return (obj->dma_buf && (obj->dma_buf->priv != obj)) ||
>>> +           /*
>>> +        * TODO: During object release, the dma-buf might already
>>> +        *       be gone. For now keep testing import_attach, but
>>> +        *       this should be removed at some point.
>>> +        */
>>> +           obj->import_attach;
>>>   }
>>>     #ifdef CONFIG_LOCKDEP
>

