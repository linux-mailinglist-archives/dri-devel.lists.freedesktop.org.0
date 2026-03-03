Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEKHNgiqpmnPSgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 10:29:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA4F1EBE11
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 10:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C2610E16C;
	Tue,  3 Mar 2026 09:29:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MtvD/Oo6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011003.outbound.protection.outlook.com [40.107.208.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E7010E16C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 09:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqOTiw9dC9vacMsBsE6JJRgFlBmiKO908eDLrvNna/LtWH6d2HWAzT0yFd5g7j5SY8PTfEJE1ZBhiwB+mpRtLtMupHkJ/JdgHj2bzFAjRgxeRiT4UY2hOQQXfCNozegU0ueBhVsYQb/T9sj+NbQ8SSvf7hLWt1kw6oYPCZNS5HnkprYkzr19paXxuqNKv9k+koz3wze3Jg/OYz6bx9p7SA5IZyJ2mc7Mj41oA13isnPlOt5XkpcK60QXQgSbE86W6DTsCWPA9+DxDGiR1oblmQiXa73FLHK0ZzLwgzVokYqCIQSFE5E9Gqr8ws7YQMzHlrjaLnUVb7Li9VhQfxBK1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMEVSB92DM7gVhYrxXcrL4vV0MAc0+TXf4QcxGDZU84=;
 b=Nmn2lrY3+wKtKnlxBT2uUr+GAK2k8DUk9ecjBlhVb/6jv3zG0FkqFfna3nYvS5BWAVq2Q9AvrydGdA8Hqag07js5R8U1syE0gJjqCX4rt5bP1up49SYHGPZBpY3XRfKjEt6my3D0ZBVKGjEDdwu0Nvcdaf0lpcmfsgsKSePJs2fGpJYE/ANs+4Y7ZCBWQgFtj2xzaw1r5cifLHDlvkZrQJFJ+CvnjBiG5oS3Qz8bGFxU/UkWuWLxXR6q9L9KmUIlOfFIWI37BkKpRX40rVM+NlP4kd6UsMtazVTbZiDvmaZsvQXY0PQqKgMKTqOuD2Q+7tmLQ7Pso0O4tP0ccAC0fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMEVSB92DM7gVhYrxXcrL4vV0MAc0+TXf4QcxGDZU84=;
 b=MtvD/Oo6qM7cqyeV5aVubAbytskoyvDcpOp40ABg0PnGEjwzg7lrQ+aRtWgndl5qpqMwXSSI/u9AnPNNbhIDrNQIEhPJ7XbGbncGy2oS8iQFqhTfzBMgdJkFW+6pMjR7hwW/q5BKFD9UWy+Ag+Nw3bXWCT01bypijoGQXYIFKf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 3 Mar
 2026 09:29:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 09:29:35 +0000
Message-ID: <614c3c39-1e11-4da4-b5ac-b8a6432dac7e@amd.com>
Date: Tue, 3 Mar 2026 10:29:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] memcg: add support for GPU page counters. (v4)
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, Dave Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, tj@kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, Waiman Long <longman@redhat.com>,
 simona@ffwll.ch, Suren Baghdasaryan <surenb@google.com>
References: <20260224020854.791201-1-airlied@gmail.com>
 <20260224020854.791201-8-airlied@gmail.com>
 <ee914ffb-5c3d-4d41-abdb-5ed02db326c6@amd.com>
 <CAPM=9txUuS-qzA+gX2DvTuYR2OZ79RG86FuDA6czkpuJ_SR6KQ@mail.gmail.com>
 <4fddf319-50c4-40ab-9e36-04d629a8855e@amd.com> <aaWZrTZGsxxjbBYv@linux.dev>
 <8efef755-e429-4cec-bef4-b15b3f9f4632@amd.com> <aaWuoe_CQwbtcxEY@linux.dev>
 <63dccd9c-f2e5-421e-ac3a-a7c13cec9121@amd.com>
 <CABdmKX0=xPiwXgOHskGkE9Umj5=NrC=7OtngJjrm=mtOZmyzvA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX0=xPiwXgOHskGkE9Umj5=NrC=7OtngJjrm=mtOZmyzvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 93c9fac7-31f0-4558-1a58-08de79076238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: xSe9oyCDTeoGPSqWU2nUl0+RHxk7wtUSR2xNLoLSoB2ohPaSegevYuHqysG3QlpPJKOjNEdw1ip/Zgsq/OJOtpeHYaC9IA6wXNYcAUBUQl+DHlVurBQLr7CkxqP/lpB9PrzENg6/o+DDPHFziAgcFn4XUI+kdZVKADeXd7usXxbarKCjxosU6GzL0VT/edGe6Vl0q0wSHGHJiu14by2gIPWWRMgGzyp+XktVyygUAvT/ntIbTF1Mf6fjZSF26RYsLW0vHdObQ0LUf7gd2s5LM1NJh+I5HrGpbuwkoNoruXu/z0iz0OZ/E4Wu2pDmLsnhKi0uV86ofwrTO42SZ0QLiNyfwwIZPlYbPORcedtX8nHaBN3Kb4BRO5GY0XwGHvfn7Jv7ihtLVrPuN7cOf8QtkmOcqHvQ8qS3NWFZt/ST2osRGNpoHUNISbuVPHBF1ff9/Q9UwX5vm92JFQHAdCCPzOLoRuNxvIVRCob0AYL0uNMXa9cIuvi8WmDykmLg+tpOjvsOwVApeCR9QjfiiwPou0z/xMRt0JK2hE7hT5bIbYfS5jUHBmAGqqnJW8RB3LP2+ZhmkoMIfL1Q8kMTcSYBYe+YCaLK3cvHTdUY+E6nz7jIReUtfXF9v3k9anCoRbq8UGZYfBe+GS6HRL83pXyrZetZBx5Y5DZmFyw1SN6fKBbc4GARjSWrSxKUm433uAKp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGx5VjRBaUV5TnlibUNTUXRnaHIvMEt2V3ZTdnAxMldpQ1FSS3RiRmU4OTFG?=
 =?utf-8?B?QWpndjRhWEQrU1F0WjVzcERIN1pOVmh0RGpLeFk4V2FOZ2RqbGtqTXl1NHUr?=
 =?utf-8?B?aGxiNk1RQTFGcWlPQkVtdmlzWFMvblJHNWQreTFyeE9JbzJVU2F4djlZRjZt?=
 =?utf-8?B?TWhob083VG1EYUllNExXVWIyUmJUdUk3ekFQMXJZQmZNelU0cmZ6WG0vMU80?=
 =?utf-8?B?M3BNbFo4Ky9BOHRqMktiRWorSW5uWVFPcVJlTmNRUDljRFBNRXJac0NyTllN?=
 =?utf-8?B?d01Dc3RjKzFsaklyZEtwR2h4SDQ1QXFXMnQ0TENPR2sxenlFb0FlblZXbDIy?=
 =?utf-8?B?VjVJRlk4K25Scm01S0lYRHVuRXMycmRTTlUzeklnODNVNFcrc2pFZ2lRcUM5?=
 =?utf-8?B?WEZ5SWN1OWRLdFdwS09JOW9sTHRLQ1JKQVZqdWNzbTZ6KzQvZCsyclcrMS95?=
 =?utf-8?B?QnlRdTFWc00zKy9KcDhycmRqb1hIejVVMVNINkUzaGNuRmRHb3VvK05EZEdm?=
 =?utf-8?B?bkNwVThjNUF2M3NncUlQM2tMM3hrekFSbmg5UGo0bFlvc0d1cjNsQ0ZWdlVK?=
 =?utf-8?B?V3NDQlhraE9ocExaL3I0MkJxMmNOM1ZTUUIzeXpZUm4wYUNad3YyRENDR2FF?=
 =?utf-8?B?NE5FOHU1K0Z4bUI3Yys0SFFPYi9XUmhxcEVBa2VRTnR6SDA3Q3Y0cDBpamIw?=
 =?utf-8?B?Q0haTnpibHF4TGJDNXJ5R3hHZUNGUjlBSG1NK2YzWlg1QWZGUWxFYXVZR09s?=
 =?utf-8?B?ZVVFa1hWSTR5aEpzRmxtaUwrckdleVpMTGowVjY5SjE3TzVYM3pJSy9ES1Vr?=
 =?utf-8?B?ejF5Wi9EUFQwSS8zTTMwdzlZandkcTdwYnNWOHN0K3R0K0pMaWtTREpZdUNR?=
 =?utf-8?B?dTZGVldZU2tXVFdaQVllNzVQTXdEbkxWRDQrbFlmS0lTQ1Jac3ptZlFOcmFs?=
 =?utf-8?B?RjY5MHowaksxSW1KT1NOcjV3aW56Rm16OXVZUmsxZ1FvMnJaTlZxSTZMTS9Q?=
 =?utf-8?B?bzJTdjcxUzhqZS90TFd2K3dVbXVtLy9LRER3RmxEOUhEYlpYZk5CUFI2VzNn?=
 =?utf-8?B?UVZMcHZZWnVvVXlLUlVBYnppRWlKcFo2MVV5QlduTm43a1lXL1c0ZHF2S0kv?=
 =?utf-8?B?dVcxZnJNajVFb2czR2pzZ3R1dVdsNENaUUJhbjQyTjNPWERGM3BSaWRTQWhO?=
 =?utf-8?B?M2VBWWQ4Mm5tbEEzT1p1emNnQm1JNkZKbXF1ZE1mOUhybGYxNmRNSWp3ekFM?=
 =?utf-8?B?Q1U3Mlg1Y0phZUVmOER4WW05WVlzNjJ1dWFIVzg2WGVqcjJXVmRyejZ2a3Yr?=
 =?utf-8?B?M3JPRUJ6OGcvWmg2RTZyUWZoUGVuZWRoamo4TkxhRlBYYmZad2pBMXVtOGR1?=
 =?utf-8?B?Z2RIUG1zQ3gyQ2lHMzBpLzM1UXhuNUYrbGxDTlBuaDRJdHJoSStvbDhVcXBY?=
 =?utf-8?B?WkxMMjIrbHhMcDZNZ1VaanRxNDg4WXNuaGYyNTFYcGEzcU00Q0FGTVR0U3Zv?=
 =?utf-8?B?TG96V2tPSU9HQVBPRjNUUWc3KzJzVXZHM1BMdUkxYUNzbDIwNG1ydDRSdllo?=
 =?utf-8?B?R3J6aVdEQThiMGhsZmJwbmw1TC9iaSs1M1RVdmZGaEZOanRxdEEybkl3dHdx?=
 =?utf-8?B?TStydzUvWkdyWUkwOXFSbzJ5SHlEcUI0TU5MQjhHYTNRM2hiN1hOSis5Vkhr?=
 =?utf-8?B?RUNkUmRFbk9mWThIVjhNZFRGVnkzSjFZTzIvZDlzeG1UVVhBNEtEQmxvdnJL?=
 =?utf-8?B?UXpoVTMyaEtpeWtmREVReGtqbk1ya1JMQ0J1d2d2OTZzOGpYYlNlei9QRWRO?=
 =?utf-8?B?b3UyL1VaYzlFOWE4Mk93OGhPV2c4NlNiRTVJa3FOM1o0RTgwY0EyNDhHUy9a?=
 =?utf-8?B?VU1pbmNzVkZzVGQ1TG96Y2VmWFRVV3krYmNBa0dFc250czE4MFVtSGUrOWQ1?=
 =?utf-8?B?SStRS2krNWN1eE9ERGlNZVVhSGlFYjU1dWlxVnd0N0ZJQTdtaHZJbWZ3eVU5?=
 =?utf-8?B?MFptMWN0aU1iTkd6UDRLLzRNYzlOcGxnVmYyWnFOZ1YrcGV2TjV4bWhMckV4?=
 =?utf-8?B?OU1qeTFhdXJxWG5yVkVySnFGaG9RT0o0QUlTc2pEeXUvL0JiQTl0MnphdjZF?=
 =?utf-8?B?ZmcyNGhxdnM5ZmZKV25jSFRUbng3ZHdIYUNTQkxNRXVGUmNrcEFkNjFpeG9H?=
 =?utf-8?B?RklDejFjUkhqR01zZFh6TU5lTVEwWElrUlVhNy9ibk5oN3UzRDl1MkZ2WE83?=
 =?utf-8?B?WmJuOGkwajBveWFKVUpzbCtDNGZDM2NORkNoV1E5S2xnbS8za1dvZUtNWVlM?=
 =?utf-8?Q?BuIO26hczuXtMQyRCz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93c9fac7-31f0-4558-1a58-08de79076238
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 09:29:35.5524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yl/m5rOmBHcUdz1pswF5hB1KEnRGQCh/zLrZ3/ezhbv1G3wLBucaEjo5YGcxq2Eq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635
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
X-Rspamd-Queue-Id: 2FA4F1EBE11
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:tjmercier@google.com,m:shakeel.butt@linux.dev,m:airlied@gmail.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:roman.gushchin@linux.dev,m:muchun.song@linux.dev,m:cgroups@vger.kernel.org,m:david@fromorbit.com,m:longman@redhat.com,m:simona@ffwll.ch,m:surenb@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.dev,gmail.com,lists.freedesktop.org,kernel.org,cmpxchg.org,vger.kernel.org,fromorbit.com,redhat.com,ffwll.ch,google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,wikipedia.org:url]
X-Rspamd-Action: no action

On 3/2/26 20:35, T.J. Mercier wrote:
> On Mon, Mar 2, 2026 at 7:51 AM Christian König <christian.koenig@amd.com> wrote:
>>
>> On 3/2/26 16:40, Shakeel Butt wrote:
>>> +TJ
>>>
>>> On Mon, Mar 02, 2026 at 03:37:37PM +0100, Christian König wrote:
>>>> On 3/2/26 15:15, Shakeel Butt wrote:
>>>>> On Wed, Feb 25, 2026 at 10:09:55AM +0100, Christian König wrote:
>>>>>> On 2/24/26 20:28, Dave Airlie wrote:
>>>>> [...]
>>>>>>
>>>>>>> This has been a pain in the ass for desktop for years, and I'd like to
>>>>>>> fix it, the HPC use case if purely a driver for me doing the work.
>>>>>>
>>>>>> Wait a second. How does accounting to cgroups help with that in any way?
>>>>>>
>>>>>> The last time I looked into this problem the OOM killer worked based on the per task_struct stats which couldn't be influenced this way.
>>>>>>
>>>>>
>>>>> It depends on the context of the oom-killer. If the oom-killer is triggered due
>>>>> to memcg limits then only the processes in the scope of the memcg will be
>>>>> targetted by the oom-killer. With the specific setting, the oom-killer can kill
>>>>> all the processes in the target memcg.
>>>>>
>>>>> However nowadays the userspace oom-killer is preferred over the kernel
>>>>> oom-killer due to flexibility and configurability. Userspace oom-killers like
>>>>> systmd-oomd, Android's LMKD or fb-oomd are being used in containerized
>>>>> environments. Such oom-killers looks at memcg stats and hiding something
>>>>> something from memcg i.e. not charging to memcg will hide such usage from these
>>>>> oom-killers.
>>>>
>>>> Well exactly that's the problem. Android's oom killer is *not* using memcg exactly because of this inflexibility.
>>>
>>> Are you sure Android's oom killer is not using memcg? From what I see in the
>>> documentation [1], it requires memcg.
> 
> LMKD used to use memcg v1 for memory.pressure_level, but that has been
> replaced by PSI which is now the default configuration. I deprecated
> all configurations with memcg v1 dependencies in January. We plan to
> remove the memcg v1 support from LMKD when the 5.10 and 5.15 kernels
> reach EOL.
> 
>> My bad, I should have been wording that better.
>>
>> The Android OOM killer is not using memcg for tracking GPU memory allocations, because memcg doesn't have proper support for tracking shared buffers.
>>
>> In other words GPU memory allocations are shared by design and it is the norm that the process which is using it is not the process which has allocated it.
>>
>> What we would need (as a start) to handle all of this with memcg would be to accounted the resources to the process which referenced it and not the one which allocated it.
>>
>> I can give a full list of requirements which would be needed by cgroups to cover all the different use cases, but it basically means tons of extra complexity.
> 
> Yeah this is right. We usually prioritize fast kills rather than
> picking the biggest offender though. Application state (foreground /
> background) is the primary selector, however LMKD does have a mode
> (kill_heaviest_task) where it will pick the largest task within a
> group of apps sharing the same application state. For this it uses RSS
> from /proc/<pid>/statm, and (prepare to avert your eyes) a new and out
> of tree interface in procfs for accounting dmabufs used by a process.
> It tracks FD references and map references as they come and go, and
> only counts any buffer once for a process regardless of the number and
> type of references a process has to the same buffer. I dislike it
> greatly.

*sigh* I was really hoping that we would have nailed it with the BPF support for DMA-buf and not rely on out of tree stuff any more.

We should really stop re-inventing the wheel over and over again and fix the shortcomings cgroups has instead and then use that one.

> My original intention was to use the dmabuf BPF iterator we added to
> scan maps and FDs of a process for dmabufs on demand. Very simple and
> pretty fast in BPF. This wouldn't support high watermark tracking, so
> I was forced into doing something else for per-process accounting. To
> be fair, the HWM tracking has detected a few application bugs where
> 4GB of system memory was inadvertently consumed by dmabufs.
> 
> The BPF iterator is currently used to support accounting of buffers
> not visible in userspace (dmabuf_dump / libdmabufinfo) and it's a nice
> improvement for that over the old sysfs interface. I hope to replace
> the slow scanning of procfs for dmabufs in libdmabufinfo with BPF
> programs that use the dmabuf iterator, but that's not a priority for
> this year.
> 
> Independent of all of that, memcg doesn't really work well for this
> because it's shared memory that can only be attributed to a single
> memcg, and the most common allocator (gralloc) is in a separate
> process and memcg than the processes using the buffers (camera,
> YouTube, etc.). I had a few patches that transferred the ownership of
> buffers to a new memcg when they were sent via Binder, but this used
> the memcg v1 charge moving functionality which is now gone because it
> was so complicated. But that only works if there is one user that
> should be charged for the buffer anyway. What if it is shared by
> multiple applications and services?

Well the "usual" (e.g. what you find in the literature and what other operating systems do) approach is to use a proportional set size instead of the resident set size: https://en.wikipedia.org/wiki/Proportional_set_size

The problem is that a proportional set size is usually harder to come by. So it means additional overhead, more complex interfaces etc...

Regards,
Christian.

> 
>> Regards,
>> Christian.
>>
>>>
>>> [1] https://source.android.com/docs/core/perf/lmkd
>>>
>>>>
>>>> See the multiple iterations we already had on that topic. Even including reverting already upstream uAPI.
>>>>
>>>> The latest incarnation is that BPF is used for this task on Android.
>>>>
>>>> Regards,
>>>> Christian.
>>

