Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHTjOvd3pWkNBgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62A1D7BDC
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A04E10E496;
	Mon,  2 Mar 2026 11:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HVAaMsLV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0EC10E496;
 Mon,  2 Mar 2026 11:43:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMd/UR6shbc6hJgg8SK9mcZLr+vidiQhfWPJqBLSetKIOFofN9S0yw8AUy0ZOp5tqq6GstAZafc1dN6I/nxEMXQI5ygtoCS0fn40m5r/1VCkdIZy/TqysLSPOSue4S2OfPPadDyv6TcQ45U/lqYkV8fcecaJX1uPY6emc8836AdPic5Js9I42vDIW7oDPR8I68yktWuk7UH6xlDoD7e4gcaZQpBwlAPR3GSKZfINJ0z3FXdrBeDmJ/jnTw5G336FBKKIq5LMetr2zhp3qEwQ8BkDGuZrpadEF5QnodBLDpHxXCnYYV76mMbv0NP/LeYEd/3aucoI7CkD+jM173ydVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/C43wIqH54Zm4JpG1HZ+wUQ6D5reWdnglZXHt+WRwmM=;
 b=iXJgNcguwuCuh7Xs2qGTdHSsrltGaOrdJ0MMD7GjSnOwiXLEKtSuzynm1s/XwQK8u6mFyLNB1TuYM46frUtnXbWoquSiwLqSjGawfVH8aiGa/PjVxxRCFFEtORpQt5WEKmHL/h9kRS45nwREVdb18uSDbkbsbTmhKD6SddgPs4i02u3SfC88Y9BRz4LkEgBcySqEng0kSSpnLXRrjZp1+CcqFotepDFOTYpE8xUHVSuiA+zaVHDA6Ps5wrzM+lGoLiWLBHhzskUB5a7oQbnIZGOVtWyTdubhPaeDt1B9QIMU8rX5gNxNu7RW+mN35EaLA/F0OMHaIU+nF9IwUr3voQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/C43wIqH54Zm4JpG1HZ+wUQ6D5reWdnglZXHt+WRwmM=;
 b=HVAaMsLVEbV0H3NK6R2TZeOH2TKjnxX4oPA7xGoTYpwKkWPqRfegtTrbMvDdGucfcjYKGDGeKsvaY79cuACbg9wgD6j0qr+vnCc8azI5y+JvmoYdO5PJCdNl1cjFMi95pqWufwiQdjBI2bZzQD6UNgQsTPcfOvkNIV0pBaAuoCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SAWPR12MB999140.namprd12.prod.outlook.com (2603:10b6:806:4e2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 11:43:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 11:43:41 +0000
Message-ID: <7c30f527-abc4-43a9-a11c-9233015b0a59@amd.com>
Date: Mon, 2 Mar 2026 12:43:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Replace the dmabuf custom test framework with kunit
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: patches@lists.linux.dev
References: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0-v1-0a349a394eff+14110-dmabuf_kunit_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0391.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SAWPR12MB999140:EE_
X-MS-Office365-Filtering-Correlation-Id: f53124c4-3f14-481f-1952-08de7850f35d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: WNQHN4GFAi8mktbTG/FuOYRsNkMauQ4tp7Gjj5KFShMiP3SxagVQHWUYWgcJs41pCF6Gpn9FX7NwlNgbscnWCUZUFhI5TeMlODZNX4LbImwgy0tfnqmvQ4o2oHup1732RR9dKV381ZFnQ+wbLIQ3gdaNRW3DqihiskWd6dOTGmDRQFycfiHTOd8KlP8MNnzgAl7ZLo28v+Mx6pq6qNIR5Ua7JkG9bS57fMwSNj147z+3KOcpybe4Mtxg+MJIIBT29EiLhZ1QDiequ2o01jv5n5CkkgKi8v/h6FV6Si7gYQNrts5U/icxOAwJNLLmKQ2vKgEvp/tMpl3Z5qp5He9fpacQlLlfMPeIxcaqMJ/4OXQU5Ugi0A+xMyYb5keY8t4hj9O77wdVhIA5SVe1O9SENYyLhaR4WetNrYmEXTaNmesuyc/2SvxtRJ8bKk60hM805LhxZVNDSe1tx0pRNMKHhmAguU579s4cGu3703DdzopqMfi2rlRwZaJwzPrDuTZRU7RXYX7N/rbPAoZJ+Mq9JJx/1XBHGv5g08dMvNGhU1C+UGLey0u+AKu50cquYykluy0KOKZ3tEkZchcCN/jDKUoYvXDt/1v+EO43GydG1Tx5ttau6KYYDVj4dS5NxkjVu5fBO68wyY+K3DTR5KadQi7cooeIYTOnXrB5FUaNK7SdTm80jnHNizlvpNYD+BK6AIjEIkrJiOiSUu4ycv5PEWK1BrL0W5W7fKkDTjDuDtgk+5e8rkHNLZ0TrfIGInuduZSnKuALOPQw0692brrqt0tfuUkvCgJCujl6I0BiCow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFhEZm9tYUswcGRZSnkzU0dJbFh6aXI5Rm5Fak13YUdERTNEV2pNdDdUazlV?=
 =?utf-8?B?WlArV0lGNldxQkIwczJzQlZaT0xMQVkxZE1oaHF4c2xwZ2hWV1BHaVVkUXVC?=
 =?utf-8?B?dFU4ejBtb0xTTlBQWkVrUGlEUVRmYk9iTy9hSUVZSkhEOXROTHMvak1RSlhn?=
 =?utf-8?B?U3FNNGFpcGhUYmF3Z09nbEN0dEZ2S2tGTFhTMjVZQTVGdEJxdnFzRFVpRHdU?=
 =?utf-8?B?NExkbUM0WTV1YmJITDZaK0syaEtiRkJHV0F6QU1qelF2bXBHRzBnRkthUVBj?=
 =?utf-8?B?MEY3Q3B2QW0xQ1JOM0gvYXIwSU90dFpVR1hGUDBOTjYzMit5c3YxNlRWa3BN?=
 =?utf-8?B?ZzBmQkNQMlRadlV2NlVQdTFMOWtaRlpXbG16ekZ6Yno2QUlOMlhXVnZHUjQ5?=
 =?utf-8?B?MjVYZ2I5Z0FVK1p6WmpmNDkwaDdUdzBZLzVwTStTTVI2cWJWb3dncFFtdVBJ?=
 =?utf-8?B?TERTS0p5bnpPTCtReGVhc3NGaEN5WHVVRzJTamxRQ1JxQ2hqU01QbWhiT2d1?=
 =?utf-8?B?VFo4ZlVMVmU3TUZUYkJxVkhMSFVWam9hWHhDeHF3TXBSM0JKYkRNL3Z0UkFF?=
 =?utf-8?B?Z1hQSDRTbGlaU0V3M0NWR3ZodlhDczV3SkJkSUtDZzYxY2lpQ24xVlFnNHph?=
 =?utf-8?B?QXFWUm45OXN6Qk1KelJlY0FvT0ppcHdRREd3NDRvNzl3UGdpUm14TjArejhk?=
 =?utf-8?B?UXl3bkFqdmpibXBkWE8wbkx3Q2w2cmE0MDhMMVhmLzhNV1RLUXEyQThxVUgr?=
 =?utf-8?B?OUdpaGVSU3lLdGJLNDU5bzk5VFd4RGs5NXEwSjZkczAxRVNpSnlIL1BEMFpK?=
 =?utf-8?B?WnZBTzJKRXFIRE1vQi8vL1BackE1cFUwVUVhdmJLOUVIWlEzdFQ3cU9VdGdo?=
 =?utf-8?B?UWxFdnoxSEpxcjc5ZmNtVFhSbEx5b1U5dFBIT2s2alJ5VWtFa0NGWE9ka0hM?=
 =?utf-8?B?NVdlZUp5akF0MXdHekNLOTdsQjRPWkdDNDJnRVpMYm53cS9lTUNaTTAwc2ow?=
 =?utf-8?B?QUpzd2xtc3R6NU1WZkFMck5id0xFUUJzOEsrU2Z2cTNSdUlFbjFtK2xrQzIr?=
 =?utf-8?B?WFlmUWlrVTB4UjN6MldEaytBT25aTTBScWJjMm1weS9OcEhIZ0Z3eE9WSFVB?=
 =?utf-8?B?MzRLZ1FzbW9odXBTWSsyM09lRnBEazVOVCtvS0VUbUZaY3JxWE9aMmZVNUZY?=
 =?utf-8?B?V0cvcGkvWUVnbFZxOG1EOVNxVWR1RGdkdU5mLzRUaFIzTzJqMjljdEU1dG9Q?=
 =?utf-8?B?ZjAxS0NTSUdYamdrdE9zRFNnK1FtQ1NHQmUxZVdPbnJjSkJ6Q3d0L2oyQ3JC?=
 =?utf-8?B?M2hBalN1U0s0aGljUUg1cjl2dzJNeTBjOTdRSFVVTC9qWmZrS3lmNTU5QW1S?=
 =?utf-8?B?d1NScHNKYkdLUUQrbnkvUXJvKzlEb0NsTXJ1bGtZSXBIdzlrSmZ2VUpONVpt?=
 =?utf-8?B?ME90aVFmZTlCVkdVNHQ0MDllQkszd3B5WUhZQ0VkN3BEclp6ZGtsVXJZczln?=
 =?utf-8?B?Nzk0ekNYUGdBNVdnVkE4emthS0srMG45WG9LNzNhakRHZjBOL0VGc0NCS3c5?=
 =?utf-8?B?Q21PYlhVcm5oRkxlV2FyMmpHOGpBbkJpQnNXYW94SjYxSkJ5OStjL1U3Umky?=
 =?utf-8?B?a3dXTGhXUm1mTm5qb3dVbFZIV1hldFg1aWVsOGVMcnR0VXNiVVNLb1pUeEZR?=
 =?utf-8?B?L01qQW1uTHF4enkvZWs1SWVSVERjUFMxREpWVmNWREtRYmV0ODhacE91a2JC?=
 =?utf-8?B?Z0pzcGFtMHpmMnJxNlBYTzByV2lENldQaHd6UVVZS1JMRVBydFp5M0ZWamdU?=
 =?utf-8?B?OFBDbzk1WlVkblB0cUw0NCtsSlVOMkJUdWFPL2cvYVdvUFZBNkFMT0UxR2Va?=
 =?utf-8?B?LzNCb2JFdC85WEhKZnJFMTZHM3VETEN2Z212aGRjV0E1ZThVYjE5SWQvUUVR?=
 =?utf-8?B?U0g2M2QrUThrQWxleVVkMW5CeUJEZlFkU3A5OHFTbGdkbC9ubGdHTzJFekJN?=
 =?utf-8?B?VzA3ZU5XaEJzVS8vVEpETDJtMEFSSWJjYTd0S250U3NVVytpSXpmbUhZS1Bn?=
 =?utf-8?B?RkI0M2tTdGdsMWY4MzdYMklEeFVCcS9QRytldkZsYi9Db0ZKZ3MvcUJ2aU00?=
 =?utf-8?B?QytCL21ZVzcrRXhzcnVJaDRYZG1TSlZtRTMrNzhFem5pNzgwZERQdzBLa2J2?=
 =?utf-8?B?aERVNTdwRE9TeUZ3YkpyV0Z2R0ZPb01LeFR0ZUFEQmprRnI0YVpCVFoyam13?=
 =?utf-8?B?bnpEejJmMVk4ZEtNMGVpakVhUHUwZ3g0VmdsL0lQanppV3kxY0J1WlBaTHA3?=
 =?utf-8?Q?SxIGHX7q5E8mMDgjfq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53124c4-3f14-481f-1952-08de7850f35d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:43:41.2558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1h0o0D3pn/6lUYv7F6SOL82eu7kc/GJRN5GkHn+I3HdYgFGpvc64VcDlNWFtVXF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999140
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[nvidia.com,gmail.com,lists.freedesktop.org,linux.intel.com,lists.linaro.org,vger.kernel.org,intel.com,ffwll.ch,linaro.org,ursulin.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	SURBL_MULTI_FAIL(0.00)[amd.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 9C62A1D7BDC
X-Rspamd-Action: no action

On 3/1/26 19:57, Jason Gunthorpe wrote:
> Using kunit to write tests for new work on dmabuf is coming up:
> 
> https://lore.kernel.org/all/26-v1-b5cab63049c0+191af-dmabuf_map_type_jgg@nvidia.com/
> 
> Replace the custom test framework with kunit to avoid maintaining two
> concurrent test frameworks.

Oh, yes that was on my todo list for like an eternity as well.

No idea when or even if I have time to review that, but feel free to add my Acked-by should that go upstream.

Regards,
Christian.

> 
> The conversion minimizes code changes and uses simple pattern-oriented
> reworks to reduce the chance of breaking any tests. Aside from adding the
> kunit_test_suite() boilerplate, the conversion follows a number of
> patterns:
> 
> Test failures without cleanup. For example:
>    if (!ptr)
>        return -ENOMEM;
> Becomes:
>    KUNIT_ASSERT_NOT_NULL(test, ptr);
> 
> In kunit ASSERT longjumps out of the test.
> 
> Check for error, fail and cleanup:
>    if (err) {
>        pr_err("msg\n");
>        goto cleanup;
>    }
> Becomes:
>    if (err) {
>        KUNIT_FAIL(test, "msg");
>        goto cleanup;
>    }
> Preserve the existing failure messages and cleanup code.
> 
> Cases where the test returns err but prints no message:
>    if (err)
>        goto cleanup;
> Becomes:
>    if (err) {
>        KUNIT_FAIL(test, "msg");
>        goto cleanup;
>    }
> Use KUNIT_FAIL to retain the 'cleanup on err' behavior.
> 
> Overall, the conversion is straightforward.
> 
> The result can be run with kunit.py:
> 
>     $ tools/testing/kunit/kunit.py run --build_dir build_kunit_x86_64 --arch x86_64 --kunitconfig ./drivers/dma-buf/.kunitconfig
>     [20:37:23] Configuring KUnit Kernel ...
>     [20:37:23] Building KUnit Kernel ...
>     Populating config with:
>     $ make ARCH=x86_64 O=build_kunit_x86_64 olddefconfig
>     Building with:
>     $ make all compile_commands.json scripts_gdb ARCH=x86_64 O=build_kunit_x86_64 --jobs=20
>     [20:37:29] Starting KUnit Kernel (1/1)...
>     [20:37:29] ============================================================
>     Running tests with:
>     $ qemu-system-x86_64 -nodefaults -m 1024 -kernel build_kunit_x86_64/arch/x86/boot/bzImage -append 'kunit.enable=1 console=ttyS0 kunit_shutdown=reboot' -no-reboot -nographic -accel kvm -accel hvf -accel tcg -serial stdio -bios qboot.rom
>     [20:37:30] ================ dma-buf-resv (5 subtests) =================
>     [20:37:30] [PASSED] test_sanitycheck
>     [20:37:30] ===================== test_signaling  ======================
>     [20:37:30] [PASSED] kernel
>     [20:37:30] [PASSED] write
>     [20:37:30] [PASSED] read
>     [20:37:30] [PASSED] bookkeep
>     [20:37:30] ================= [PASSED] test_signaling ==================
>     ...
>     [20:37:35] Testing complete. Ran 50 tests: passed: 49, skipped: 1
>     [20:37:35] Elapsed time: 12.635s total, 0.001s configuring, 6.551s building, 6.017s running
> 
> One test that requires two CPUs is skipped since the default VM has a
> single CPU and cannot run the test.
> 
> All other usual ways to run kunit work as well, and all tests are placed
> in a module to provide more options for how they are run.
> 
> AI was used to do the large scale semantic search and replaces described
> above, then everything was hand checked. AI also deduced the issue with
> test_race_signal_callback() in a couple of seconds from the kunit
> crash (!!), again was hand checked though I am not so familiar with this
> test to be fully certain this is the best answer.
> 
> Jason Gunthorpe (5):
>   dma-buf: Change st-dma-resv.c to use kunit
>   dma-buf: Change st-dma-fence.c to use kunit
>   dma-buf: Change st-dma-fence-unwrap.c to use kunit
>   dma-buf: Change st-dma-fence-chain.c to use kunit
>   dma-buf: Remove the old selftest
> 
>  drivers/dma-buf/.kunitconfig          |   2 +
>  drivers/dma-buf/Kconfig               |  11 +-
>  drivers/dma-buf/Makefile              |   5 +-
>  drivers/dma-buf/selftest.c            | 167 ---------------
>  drivers/dma-buf/selftest.h            |  30 ---
>  drivers/dma-buf/selftests.h           |  16 --
>  drivers/dma-buf/st-dma-fence-chain.c  | 217 +++++++++----------
>  drivers/dma-buf/st-dma-fence-unwrap.c | 290 +++++++++++---------------
>  drivers/dma-buf/st-dma-fence.c        | 200 ++++++++----------
>  drivers/dma-buf/st-dma-resv.c         | 145 +++++++------
>  drivers/gpu/drm/i915/Kconfig.debug    |   2 +-
>  11 files changed, 394 insertions(+), 691 deletions(-)
>  create mode 100644 drivers/dma-buf/.kunitconfig
>  delete mode 100644 drivers/dma-buf/selftest.c
>  delete mode 100644 drivers/dma-buf/selftest.h
>  delete mode 100644 drivers/dma-buf/selftests.h
> 
> 
> base-commit: 41dae5ac5e157b0bb260f381eb3df2f4a4610205

