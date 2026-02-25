Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Hw9OcX/nmlAYgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:57:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9F1986F2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:57:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52CF410E02C;
	Wed, 25 Feb 2026 13:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YGKzM6Vz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013022.outbound.protection.outlook.com
 [40.107.201.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6347810E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 13:57:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAEFWH+2lbRN4xk/GHAYEedA0UNoNiw91XUSisRCM7TiztZocgDIZfILLSyvEoFJ6mVCa0RAf8rIPAr2dQuRz0kbdGm3HqF4185EQFyucsP6hV35WUBiSZ9rGhSJGCoSQ7Y3aasqS06rhY2hOMYlwVpxhCNx27qdPBjoKl2P7ox1oCmhEWryXuh876uRG1c8G5uj5Q4/ClUYdYRJoOg96EZmZeuUgyZjh3AZaNPxyOxdOQ1k4PtibVYNiWw4r/ZcmystWIx/M+xS5hrEaMXzVoGi0PSk7rMrIlPUme6jmVLf82fJOtWOT4TZJKUtGMyBW4asnwTmyF0um0WsC8lubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+AtBGH2aomS0L7l9v6WqAFrrGT3ZjGjqcK4WZaa0OE=;
 b=YXqvOnLBjuTnFx/j+zScgbaOqyI7q4XhrzcU2Brhqd/tEOMrV1tj45BZ8eeyHm/f0Xw/QNCR/nuBaa0y9nZ+u/7HZ78/MsxXHeRS9K9aZ0MIr5J9d1iewikdfXR6Z7iStwG2V4407x2GxfHJ3Q9iyPDUNaIDhM5TZ2mRXrAzOW6r7cS7nijTkLrJhDhpUxHvFWQaqwmXGi1TUWl89fikLwChJAhItExgJTCfIb29mZwDM34tpbSFLTDv6ojgj/lyR5hLRX+B2n5eXSVlCXKe50Zms82FWxt35aQC3KuK858WyU1g4iQt/gGGpmEL7AJgvlVFQJOw3eKyyWpuOUquEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+AtBGH2aomS0L7l9v6WqAFrrGT3ZjGjqcK4WZaa0OE=;
 b=YGKzM6Vz7BEemVaXwX8iCM6mUZje5A2APr7XMNJkq67odiJJyMWQzpb23Rgq8IYiKdUTwuqanLhvsfha5wqCzH0u6Nrz65c9mnpchkhoJZyGUXzXxA3aktQq5SN5UoQMjKk9PnfuYOJbTE/DIrgMKmfgjyjUbcFMkH/o+Eg5eqo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB9346.namprd12.prod.outlook.com (2603:10b6:8:1be::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Wed, 25 Feb
 2026 13:57:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 13:57:15 +0000
Message-ID: <d215b326-6f17-405e-b9e2-9627c17db00d@amd.com>
Date: Wed, 25 Feb 2026 14:57:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 0/3] Querying errors from drm_syncobj
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Yicong Hui <yiconghui@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20260225124609.968505-1-yiconghui@gmail.com>
 <3491d5f9-d08e-4193-a983-45340af73745@amd.com>
 <7300ad7c-39a5-4424-b4fd-9d3f97083f06@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7300ad7c-39a5-4424-b4fd-9d3f97083f06@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 914d1e58-ff3d-422e-90ad-08de7475c858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: NvfPIuQDrDO/7kWsiGr9S4MQ1n4yutwkP+W39YpBmBLK3Li3Ta7wYFJEqfbdbKUtHJFCD0I02UtiyD2xdcg33vsjkU2EJviTcuiAyow87A3pgBoqCMNSRcNcve4AgtxYBQ9XY2bzAsNvSb3yQDXHhJucab319O3G0tffoPBjNXNLgxmSpmHIHeyq20k30G2smwo5pQ0REBOoYEnyJ0cZFHR83W0lurr8u9Coyr2ta2i+ULqmOvpVS4EA5R3dSSv1ppbiqiePOTJZNo7JzKj2Xz4/rgYaHI67cuIJX630fH7eiJ8EXEQ5GFT/UVXA0Si+stRWve/UI66Zt9waU9esRkNjk3BfpeOa6Ah0hNRuAgp4xplOaAjah3jaoOTiw3y/yUOdorCwmg+jQK9SsfC/L801HqMbaVxLJgavOioj1UdRThozWRXJJOijmRu+JhjE6fftF5pT849xzmE2ElFy48WqG8SnYo9TwZ2CNIFfz8iWgrz7p6x1yeTFbUB/p/0F2fdUB8p0xDZRw+hbQnNgPcz/kdgq83Q84rqMz+RrXcakSWweK3BjZpHoUY9nYom35ZFd3Aj+ecjwTLRViiVx23KbWX4eWcYKz0gHehDtUE8sBPB7/v/JqCf7GNNd9B9qfoyWnWeH/QSKC2yonHmuxLrHI3ejHOZOgUHGpIi73/C1twSzE+Gy0jEOC+qNC4A1wgNchzkXZjdLGKzIePDwbtisq7iOSbP5Rac0lLrouVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjZNR2gyTWxWcS84eG5aRkE4MzZTRFZkREQzZ0kwVmpFYlAxdjVYQmd6RDZ4?=
 =?utf-8?B?eC9vQjZuZEhYOG5tTkkxbmpWcDZBL3JYU1U0L1Y1dFAxVkhvUzl1bTVMSEVa?=
 =?utf-8?B?cFJrZDNya2x2TWNOd3ovVHhLNEY2eU9Lby9KV09rUFFrQXVjOHB6WjdwNU1O?=
 =?utf-8?B?a1VhcC93VGI2bWJueE44aWVBVm9wYXRxVFBtd2Y1L3JvUi9ZTVVVdnU0RVZn?=
 =?utf-8?B?VWhXQlRLQmN3eEl5WXlZSmpqWnZyTzhSQ2tlbWtpT3NJSkE2Sm5ZZkNORURU?=
 =?utf-8?B?UGRzVnpqaFpUY0c3c1Y0YzNTSWZOOTBQcVFlSEg3MEFsZTB0alFvc0tpTFF2?=
 =?utf-8?B?Nk9aSWJSb2E2ZGlZWk5UZjNTUXNtaUZpanU2UXczZms0bWdibVhMRDFtRTUx?=
 =?utf-8?B?OHl0TVUvSkYybDY5anEwbmdJaGg5OWVROEpLcEs0UTl3c3FucGF2dzlzc0d1?=
 =?utf-8?B?SG1WeFVSTHZOc0NaMjJWVkVwOFcvQjU2WW9SV3Ftb2RwbWlrNVVyN2pMRmNj?=
 =?utf-8?B?d2RINmtjWEcxRm5uRWxKQjVpSXR4YUsxNmdwczZRNTlkZS9xanl4ajVjbllO?=
 =?utf-8?B?OFBJNDVjOWVjSDY0SndNaUxieDVZNmpWTE5mUUliRFp0dk8vUncrR1ROOEp6?=
 =?utf-8?B?eVd6ZzdBV0ZDcnh2ZFJkU3BVaFJXZk8za2RSRDIxVWFNUVJIZ3IvYkdtVzBQ?=
 =?utf-8?B?eEpKNnJ2SXRsSGN4TVI5c3FQanVlKzg2TnNVNW9QeWtoeDFwN3NacVdpYmRn?=
 =?utf-8?B?RGx2a2NUcFhFNTArVHNTMksxMUJ0dk9mMWJVZy9paGVycFZNaWtqWFpYWmNB?=
 =?utf-8?B?WkdENE4vam1vTGkxS2wxVjhNVkNoOHNCUkd1bjlJWEN0VldsVzZLcEhlQWVz?=
 =?utf-8?B?OTRvbXg1UEViU0g5VWNGWGNRKy9OTFA4V1dMdG9kMEUyRXpITnpvK3ZsR3NI?=
 =?utf-8?B?VG1VVncwbkdvUWJlU2hlZ0tUbjJaWjZxdDl4dXJQWkVxZkg1WkgyYmNZVCs3?=
 =?utf-8?B?NUZ0UndSU0s2enRLbGE0VUdaRFE3a08vbDNwYk1lNEwyQ203d3d5VExkeXR4?=
 =?utf-8?B?SHFJZSs5L3VRTGhZRHYzQzQzSHExc2crdS8zZXRaWlYvbm9kS0s1Y1ZMdGc3?=
 =?utf-8?B?eEpHb2hFcjdXOHphTzlWYlJ1aGlTWlNZK0piZ093dmV5TXl5OHhpTG9nb2c3?=
 =?utf-8?B?dnpLL2tiUUxlQll3NEllTXNWUVAwRnpuZW5MMUdiOXdaL2JzVzh5VXMrY1Bt?=
 =?utf-8?B?d3pMa0ZrT3JJa1FhNU5sMVZLUm52U3h5VFc2N1pHSjVXNmZZNkV2SlNTdnh6?=
 =?utf-8?B?VHFNanN6SXorTjVKeDhpckN4Sko3eDN2bTd2WFA2bkM3UDNpZEFjcVlNZmNE?=
 =?utf-8?B?TVFua0VmSWJ2Z0NCUDhRbFcrQXR3aitZcUdYR09TWk1CMUx3V0dDYWh0NjFC?=
 =?utf-8?B?NlVKRDJ2MWF5WmsxS3lDa1lBem5QSXVDclRoRHlYU2Q4Y2FGUytsN25lUklj?=
 =?utf-8?B?bkVTN3M2TG5INHYveUNYMlJERWQ4dzJIbTI3bW8zdTc1UzJsVmdNdDBra1p0?=
 =?utf-8?B?aVlSMFBCRWg2UGFjTEJtV3loWVhpLzZ0ZFlJU0tXTzZyazFieG9OalhBdUFr?=
 =?utf-8?B?QVRicVM5VmJwM2J1YzNIZVpRQ3ZzQkQrRTRuQVkra2FxVEVBZDA4OUxINHRX?=
 =?utf-8?B?MTlMQXJlQWRnOStHWnJWVEtTalJoWU0rTVNrWHhkVzRIN2FtRmQwUVFBNWhW?=
 =?utf-8?B?VU9EZFVtTXJUSmhmeFpBYVdCZE11dTYyOTFSdGxPbUhGZnB5TjJoajAwNyt0?=
 =?utf-8?B?RlJzWnFyaFRXeXJqV0dpUDRtbktnNElCRU1XNG5BYXBpU3FZa1JCR2RzRVRr?=
 =?utf-8?B?TDlUREFuUUpNODJsK1h2U3pQaENSZFRoMktuOHgyNElNaVBpZ0NXYUozT0RJ?=
 =?utf-8?B?V3N5QXNwUEZuaGY1dkdYZ2QwU3JxVlE3SzZTM2FrVkJsOFhLYU5xN1c5NXhK?=
 =?utf-8?B?Z1lLVFpRUVVXcitiaUFralJONGorUUUxVFI4U05aVmlHZEJWZ0hqbG9XRHR4?=
 =?utf-8?B?TTN4RURVWkRmSVNLNlV6TjY2YmlZL0hWOVE0clZHVWFFTnNQbVpxSFJpZGdv?=
 =?utf-8?B?T0dFTWhDaXF4ejhVL2JxQS9zbjhzOGdGNlN4VStIV0VSaHRpUGY0Nk1KdEF3?=
 =?utf-8?B?Wm1zanR1ZmhLWXI3NmR2c21CcFVnMXlhTkMxOXN5NGh5M2FUekMyVHppSS9p?=
 =?utf-8?B?cStkUDV2bGFRSWY0ZDZpb2psNElKY0tIMU9SQyt6aWRGTVB4NjUxL1VqaGhS?=
 =?utf-8?Q?6Sz7bv/GnlWQFdxekB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914d1e58-ff3d-422e-90ad-08de7475c858
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:57:15.7101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkQKz+v+OPUZk2Xh2roOjoYJuTHZ2n2V7iGbNPcroBzPp+uFyKo1XqZ3teH0Qwu8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9346
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[mailbox.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:michel.daenzer@mailbox.org,m:yiconghui@gmail.com,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com,igalia.com,kernel.org,linux.intel.com,suse.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.968];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gnome.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2BE9F1986F2
X-Rspamd-Action: no action

On 2/25/26 14:37, Michel Dänzer wrote:
> On 2/25/26 14:25, Christian König wrote:
>> On 2/25/26 13:46, Yicong Hui wrote:
>>> This patch series adds 2 new flags, DRM_SYNCOBJ_QUERY_FLAGS_ERROR and
>>> DRM_SYNCOBJ_WAIT_FLAGS_ABORT_ON_ERROR for 3 ioctl operations
>>> DRM_IOCTL_SYNCOBJ_QUERY, DRM_IOCTL_SYNCOBJ_WAIT and
>>> DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT to allow them to batch-request error
>>> codes from multiple syncobjs and abort early upon error of any of them.
>>
>> Patch #1 looks good enough to add my rb.
>>
>> Patch #2 looks good as well, but I'm not familiar enough with the code and have no time to wrap my head around it to give a review.
>>
>> Adding a few people on CC, maybe somebody has time to take another look.
>>
>>>
>>> Based on discussions from Michel Dänzer and Christian König, and a
>>> starter task from the DRM todo documentation.
>>>
>>> See https://gitlab.gnome.org/GNOME/mutter/-/issues/4624 for discussions
>>> on userspace implementation.
>>>
>>> I have looked into adding sub test cases into syncobj_wait.c and
>>> syncobj_timeline.c, igt-tests for this and I think I understand the 
>>> process for writing tests and submitting them, however, these ioctls 
>>> only trigger in the case that there is an error, but I am not sure what
>>> is the best way to artifically trigger an error from userspace in order
>>> to test that these ioctl flags work. What's the recommended way to 
>>> approach this?
>>
>> When Michel agrees that this is the way to go then we either need an in-kernel selftest (see directory drivers/gpu/drm/tests/) or an userspace IGT test.
>>
>> Not sure what is more appropriate, maybe somebody on CC has more experience with that.
> 
> I'd advise against landing this in the kernel before there's a corresponding display server implementation making use of it, in a mergeable state.

Yeah we clearly have the rule that this can't be pushed into the kernel without userspace code as well. 

> Otherwise you might end up with the kernel having to support UAPI which no real-world user space actually uses. Been there, done that myself.
> 
> 
> I don't have the capacity to contribute anything more than advice at this point.

Oh that is sad. Do you know anybody who could work on that?

It is a clear improvement to error handling and I don't like to keep Yicong's work only on the mailing list.

Thanks,
Christian.

