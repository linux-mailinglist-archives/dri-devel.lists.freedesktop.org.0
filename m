Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBQDCp78nmm+YAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:43:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFD01984D4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:43:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C56710E8D9;
	Wed, 25 Feb 2026 13:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KIFElGYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013018.outbound.protection.outlook.com
 [40.93.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B4310E8D4;
 Wed, 25 Feb 2026 13:43:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyBjuopLN80/6uwcsYDlm4+NPsSeaz0+273KbRCpk2CeIIVdQ0Q7+8CRNnIs5xwmFQZ3Zimvml0Tqp+UVdVjmUOKCyS8SOXVwCkRx4+reizFtfPhL/XaoGaXwdgA4a8Hrp/axCmATCReERuA1KQZ3yjqzW+fuYlcZmk2vtq+j21eEmQUhBBWgZaZZfTfe+drE4IIuegoxQroBC9L2wb+LwUq4vKeYC2Qf2uR2KG7MX0RGz0OUUXB8D9AreSRCf5z6jx/lDwHQziRgMHemtETCwzCv83vZYn9+BK0BcXjsL5PdUzB1stKpGM8zrRbdScM7uyenv5u+PffNgFDkS9bRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoBEYsU4AXFFhNp6BFaV/AtOh6SJHLEqTlUQe439oac=;
 b=RQZmy7FgTiHpTBJpSFQrq5hgZVS3kf/pMk6/iHAgbYV78SXu48ke14RrZB8NKsZdccwlMemYMrQHs/akRfYna+X3DX3ysbPRqCMjhGk2+gCPMyg9AWCVwyYksvIWbNDUCSmwsAbNq/BrOXfpWHbsvkP4FEGUuWnQ/81USrcvY1DwhhRubsK1RTdBsT3SLn2Ytm48bv/um2gw8OxJl+vTUCYa2jDRyCY5yvph6uQ36pMbvgjr8uYXhPJE9qLmLkrJ/Dobi9MjodirmtG4lsGSpmG2AgTFWT7ZG9o3cIIZF0RlDFsX/qNOQ9AoXlxxJQLzLeq/2rFraLO/Ph8ARWjpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eoBEYsU4AXFFhNp6BFaV/AtOh6SJHLEqTlUQe439oac=;
 b=KIFElGYl9cowC/1ou51AU25ZzjvFUcGANIzuA1TEKEMYai67qQEHExaJa/YmqzYB4K1Tjxx0N9TBuVvpXLByG1WDGtBDWROES5Ol/SXB+hgbAzJGdfqDgkYWDq4Uwt5tz5Njt4BO74uVa1i7IDGTex8pCZPeZv0bhvKXWSFuHBwOVQSTcca65zFDeIL8KeeKkv/VJH/wvUTSEmD9hjgZob8+D1Z1zknDJasfrTOm9lIKNN5JUVxDWO+NtWI87nHS0W46FfTWgtLnZabsQxyL20EVCvQLYNavE4Klycc/M0WDMwg+5YgLyp+Gv9IwwnC1pzUSdRbV0XDuHLZ7OgEf7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH0PR12MB5679.namprd12.prod.outlook.com (2603:10b6:510:14f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 13:43:48 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 13:43:48 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH 0/4] gpu: nova-core: gsp: add locking to Cmdq
Date: Wed, 25 Feb 2026 22:41:47 +0900
Message-Id: <20260225-cmdq-locking-v1-0-bbf6b4156706@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23QwWrEIBAG4FcJnmuJYzQmlNL3KHuYjONWutFuz
 IbCsu9em5wKPf7CfP4zd1F4iVzE2NzFwlssMaca1FMj6APTmWX0NQtowbYARtLsr/KS6TOms/Q
 aBnAIBBREHflaOMTvnXs/HXnh662q6/EoJiwsKc9zXMemC4N21Hs9gfGun7SxGDrVWgLrgDA4c
 tog/NIzl4J7nbF52dsoGGTKG1Zu4b2XkpuWrQT27Ew3aIT+LW3RR3yuX77+z4AajqUopzWmG67
 1BHKDHXJTb5Ux2oY/0Onx+AHnwi+kOgEAAA==
X-Change-ID: 20260225-cmdq-locking-d32928a2c2cf
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0254.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::8) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH0PR12MB5679:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b338267-5264-4eb7-8d77-08de7473e6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: JBUMs5XFegBFRNkoCTw3myPsG47lq3qOWkng7MFnhfXgvrF7Rn5CzO8d6GKN0dXc5iPPM/8xDFm1riCVXyjLS98qfcv9v0d+MHhV/VoC/7lFA0geAg3FzAyZD7SNI9xg+IfmI64TxrWPGv+9T8UcO1LXnr44q8URghg+bjaZMEoeov1PlRi7u+37hPdQBONrN7t9AaiVyLGkhpgxSR7oFHqa3hAl0VbPRK/0N8DB3n5wwLvCg7NbyC70692+3SxsXmU+v/jNG8HrtmZ+fOZADrh/2vA94CfcsONOxdfpWLoq+8+2kdekdqaBIhSED4d/YrgvqOFDdOVx+Id9hHbpFazyKDxHkEbzFk9ITjZvPar/Vp6sThdlcVXNwAzZqFBmVCkjU1wbOMppqdvn9hzJ4YyuKzEas/4E28l3FOACkMzOqfqAt+s6irhgLDJFeNx7lkmrYbcVTWrbGf04BlfBTxBM9En85BnXz4rUJVqmEnsrU+uAWliQukYyNINli5x6A8UeLjvAeTw/MOongPsHF/pWZmw+k5YwawGF1QlZDNT82X/sPcDskXs79o3iTsa6b8c4uGnBCR8rii8eUk6eU4xP0cw0FQfcXwr+Ht2AtuMW440xCZBMSwr4Ym+VWWFSfZIV0xPsdJhbtCFqo+Nr+v2fjYilIo0U7Cf2wX7NY5/5UCoT+fbt226w7MJjk+oPVUq6TsQSfmsDCiblTBXTi3QtooCS86nZ4YP92M6PmNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFR4TXhXeXF1QU9sZklaUjEzQ09MbElwSWt6bmh3dkdkeVUycDBybTdIOGhs?=
 =?utf-8?B?TFNOckM2YWltMUVPa0oxVFV0RXlsTzdYTWk3dGhKVEJsSTlaSG9Zdlk5SXV6?=
 =?utf-8?B?enJzMWttQlhyOVk4bVJ4QzYrQmxycW1PTkF3a0VrUVM2dS92MlVzSmVNVkMr?=
 =?utf-8?B?TGs4Nzg4bzdieXljVld5MTY0TjNqSC80K2RXbDhtRGJFUm1pV2ErdGNEeW5Q?=
 =?utf-8?B?QWRCQ1p5blovaUhBRHJJMVlwalpOTHRaWTZaeHBwdDhseXNtYVJVRU5HOXo3?=
 =?utf-8?B?OU1abEpHQXRYZTNFY2M5K3FKL1VQeDVVWmd5TjFZRG9ZYmI1REx2Z1N3cVdz?=
 =?utf-8?B?OXJ3S09NR1YzYW9JdGFGQ090VFpQK3ErNzhaNlRNdnVSVm8ySGJmbVhJektC?=
 =?utf-8?B?bTBmQ1JPRDFnUTdaTy9oeG50bDNHRVVFOVNvWEZONnJjalZrWHErTkJqM1RT?=
 =?utf-8?B?bnVEeWdvRHVqK2NwOFpEcC82S2FvUmZDM0xGd0tWcUxGVnFNbDNHL1hrSnow?=
 =?utf-8?B?REhxV1ppL1dmVnZDRGFNNkd1bklCY2hrbG1JRzVPcmRNVWxzUlZSTWo5cE8x?=
 =?utf-8?B?cTVISmQ5cnFwN29rYjRDTGxDaTFyeE5jZDhtY1U2dGpEaStKUWhXNFpKQVRK?=
 =?utf-8?B?Nmg1RGlGNStaczMzZzRVVDd4TEpYeU8wN2s5RnVUS0NsNTRZak92amVwUVE4?=
 =?utf-8?B?cFhTcWpMTkQ5TkhlNHhuQndHTWg3UDJjeHFJMVpaZXJSZkwyVnRDT2pYWDVX?=
 =?utf-8?B?dGFpYkdRVW1tZkx5c05LTEZ4eFVkWmJwT29ESzBBY2I4VWpMOG16SnF2WUpp?=
 =?utf-8?B?NnBnTGx1Ykg0K2w4cnppNG1WL2ZhTjIrUHhyczRuRmg5MzZKWkM4NUxKbm5M?=
 =?utf-8?B?YmVENFZOUDF1WUp4TzFmYi9oaTJ0enY0QmFaVGxCR3N1SUkzVXJZYkdYVzkr?=
 =?utf-8?B?YlZhbTJ1SHJxV3lQRnEzRHhuYTBmbGp3R0ZHTHZoZ2d5QW9IL2lUNk9MN2h4?=
 =?utf-8?B?cWU4N1UwRENqZUkycGdtK0JHb3ZST3lmVnZVZUhReTYwUjR5Wkh0eXZlUExi?=
 =?utf-8?B?bFl4Uy9RdkFrLzhIVnRvWll1QXpSZEZ1MzYrcG9ldlJtcFV2UVcvaDN3S3Y1?=
 =?utf-8?B?TVVBWURCZWFNNWVWYVRtVGp1VlJQOVM4SGRHK0tjUlg2MEFzZmJUL1JzMkdX?=
 =?utf-8?B?TGo2MXoyQzM2czN1NUZZczg2eXlEYzVPZnhMMzRxL3ZoZzR5eS9SWGxPYWU5?=
 =?utf-8?B?L2Q5STlCREhpZmlnSkVVd2pRTzU2TzZTb0x2eER1cysyRnFvWVJaS3FWYU5E?=
 =?utf-8?B?dGJaeE1UQWRleXh6SzdLUk9sZU1sZ2VXMDlMejZSMVMxV3FtdnB2V1UxVlpp?=
 =?utf-8?B?ZVUzU2lrOXB5NC9jdXRtTW11V2psRC8rOVFmcktLK0JZa1VHcmErbjdPd3J0?=
 =?utf-8?B?UEh6bHJsWFVBcXRlbXhRdjFSVFd5NUQ5b0FJckpKc2piRTU0TWRwcFBTL0tH?=
 =?utf-8?B?OWdrOUQ3WnM0ZFprYlNRRmowK1ZVUis5WDd1eG9ROTZ3eUYxd1VRWExFL0Vw?=
 =?utf-8?B?ai83S09OSTNDOENLTGZGZVRzazFudWRSaENROVBNeGZKSzcvcFQ1ZGVzYlRx?=
 =?utf-8?B?bGFsajNIZXZodTdKOHBNbnVWamNva1J5SEtiM29sRzQ5V1FJMTZOSHVGWXRR?=
 =?utf-8?B?UlFsN1pMaUF1K0szK1g2cURRRDJwVnVic3NiMGJQMlpaQmJPS1BFSks3OUlX?=
 =?utf-8?B?OVhhTW5XK3ZFQ3lQZk9yWDg0VlZEcFdpcElPMVNaZ004enNMaExWcmc3NktF?=
 =?utf-8?B?VlY0bWV1b1EvdlZROEg0aVBBN2QwdmFHeWVsZXVxbFB0VnM1cXg1NlRMRmxS?=
 =?utf-8?B?eEFCR21oQWo0eDdWRXQrR1F3MzFqVFNiRW5IS1NkQTBNTFVzS0ViVHJZSVpB?=
 =?utf-8?B?WHFjUThHUGlyVTgweGNnY2lNOC9jYVlKMW9aZFM1WWc5bEY1bmUxWlJXemxt?=
 =?utf-8?B?N2IyQ0owN1pMZitJSUxYbXpyUk8rcUlSWlQ5bERIMllwZkJjL1c0TXJaanI5?=
 =?utf-8?B?SjdsVlNhNFp2RTJqK3lQRm5XeStYV3hPRDVxWmlzVG8vN0VaNzZ3UmRENlRH?=
 =?utf-8?B?b0FIRFRpOEZFMy94UXFJTUgxRXVva0g0b0JFVTcvaFVrWFFobk5BT1lVOHJ6?=
 =?utf-8?B?aHJHeU5Gd3NoTkd4MXVBYnFFdWpSVWNaYVhrek9zVzBONSsrTFZydzBwalF4?=
 =?utf-8?B?OEFCSDRMWFRXbTdKUHdiWU9BR2UvZ0p6T2RJQnEwR2JNS3FtRDQxWE81VGpV?=
 =?utf-8?B?WkkzLzRHTkNjb2VVN3puZUtsdlVHbUV3a3ZEK0taWHJEUVVpSDRPZEJiWFll?=
 =?utf-8?Q?Wv9xkvQUO5wi8I2rGZVcLCwEG6hmjH4hFkMvYFPJqd6HW?=
X-MS-Exchange-AntiSpam-MessageData-1: 36Q+Jg4zVsYlPA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b338267-5264-4eb7-8d77-08de7473e6e9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:43:48.0358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSWIKkztvhht0KgxuJQp9SDNhxtX/r99aJIAGpo8Lr1gvecqQbzxviW1lyVVPGexzmYXeMTQAwBAwnOH0Upffw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5679
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 7CFD01984D4
X-Rspamd-Action: no action

Add locking to Cmdq. This is required e.g. for unloading the driver,
which needs to send the UnloadingGuestDriver via the command queue
on unbind which may be on a different thread.

We have commands that need a reply ("sync") and commands that don't
("async"). For sync commands we want to make sure that they don't get
the reply of a different command back. The approach this patch series
takes is by making sync commands block until they get a response. For
now this should be ok, and we expect GSP to be fast anyway.

To do this, we need to know which commands expect a reply and which
don't. John's existing series[1] adds IS_ASYNC which solves part of the
problem, but we need to know a bit more. So instead, add an
associated type called Reply which tells us what the reply is.

An alternative would be to define traits inheriting CommandToGsp, e.g.
SyncCommand and AsyncCommand, instead of using the associated type. I
implemented the associated type version because it feels more
compositional rather than inherity so seemed a bit better to me. But
both of these approaches work and are fine, IMO.

In summary, this patch series has three steps:
1. Add the type infrastructure to know what replies are expected for a
   command and update each caller to explicitly send a sync or async
   command.
2. Make Cmdq pinned so we can use Mutex
3. Add a Mutex to protect Cmdq by moving the relevant state to an
   inner struct.

[1]: https://lore.kernel.org/all/20260211000451.192109-1-jhubbard@nvidia.com/

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Eliot Courtney (4):
      gpu: nova-core: gsp: fix stale doc comments on command queue methods
      gpu: nova-core: gsp: add sync and async command queue API to `Cmdq`
      gpu: nova-core: gsp: make `Cmdq` a pinned type
      gpu: nova-core: gsp: add mutex locking to Cmdq

 drivers/gpu/nova-core/gsp.rs           |   5 +-
 drivers/gpu/nova-core/gsp/boot.rs      |  13 +-
 drivers/gpu/nova-core/gsp/cmdq.rs      | 240 ++++++++++++++++++++++-----------
 drivers/gpu/nova-core/gsp/commands.rs  |  23 ++--
 drivers/gpu/nova-core/gsp/sequencer.rs |   2 +-
 5 files changed, 182 insertions(+), 101 deletions(-)
---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260225-cmdq-locking-d32928a2c2cf
prerequisite-message-id: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
prerequisite-patch-id: bd2da0d580038dbab7ef06c0508d157873796ff4
prerequisite-patch-id: f834078971a3a46babe131251353184ffd7ecc38
prerequisite-patch-id: db5049ec7fe4348eed9e54dd5a2c07c697a54c81
prerequisite-patch-id: bafdd38cb9aba355a796232e07d5bbcd6fc59ba5
prerequisite-patch-id: 72a8d4626458707ae4ed632c629ffb6728cee032
prerequisite-message-id: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
prerequisite-patch-id: 20003099ca19d81b6255c5e95148f6584c108a29
prerequisite-patch-id: d0f59ef489346e978a222755f9fb42dfe7af19e5
prerequisite-patch-id: 8844970d0e387488c70979a73732579ba174b46c
prerequisite-patch-id: e138a94ed48fa8d50d5ed1eb36524f98923ed478
prerequisite-patch-id: 4599a5e90d6665fa3acb7d4045de5d378ac28b4d
prerequisite-patch-id: 7975f5bcaf28a99202d86d755fc256cd25be9cc4
prerequisite-patch-id: ee694b609c76628508d12fbe9b8b5a8a9354bfc4
prerequisite-patch-id: 1bb2f05c6a409a39421586e8148f82fa62ce6875
prerequisite-patch-id: a932945cb83fb631ebff3ac76ffff4319cacaabe

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

