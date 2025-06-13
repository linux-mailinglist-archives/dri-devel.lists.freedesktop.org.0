Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FABAD93BE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 19:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F6310E1F7;
	Fri, 13 Jun 2025 17:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VcSV5wbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B800D10E1F7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 17:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rurAEWSS59h02zkAvvoPNMy9zLizcP87VDn90KUdoemhpR8QadKlvsWzQIcOATpqy8NczE8D/T9mgKCoMgmWQP1KBetbFsAgBCEskTIo+QIY1E2VekfY4iCxL63nH+7owH/xlMGrer7YIcQw/MC8ZxrcCnpouegAw1G8E+nsyt8Cxq7wW+dlm+lJO6UEec9YSKfZpQh9kRlY/7SECjElWFPf2MwABFovNPPxZSOWr1+AzgvHKQ8E8WTpEzNWktMsYOs4F+P27kLeADJVgcclVWrLdOh991kwjDC8F7AE+9q03mg9GOKnRV6pzwtXJb5JVuwfeXxa4Fpymc3t/8YZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkZ6g+fvaiZP3ooVBbNIkBsqlPYHPx6EpHs1N/uoKIM=;
 b=Dw9gtw5rfrZw36LhBPkLtdM8rKLG2Jeqiu5myObTazbqbNB1kL85RgGa62PnX4kGuRQgq1qLpBYk48tx63b1B+EFU/TqfJ+wr8FxdJqJ3LsUXFVXXGjvO9DMcn7YaMHB59wQR4KY9C7ZzuDWwTnGJmXGUwFhKGYLY6DxJKQvknJWxFMyglG62vM2ZBtilUR03/mmK6D4LShYudDf4qtzPfjTgVqgkgZA8lr9Mmi8Q/2X8Hlc1bcH3K56k+ikd5MH32JV0ty7b78VAbf0evws8tZyYMF9JRwSVjcmgvMtSd5PkGRS1bODpkNpOgkV61p6fCMB+qLQptb05phdlY3VzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkZ6g+fvaiZP3ooVBbNIkBsqlPYHPx6EpHs1N/uoKIM=;
 b=VcSV5wbjYwKBxsz1M3e+/AJFpEVpw7p0oDogV4fTrvyK/B3XgBTBCHCP791kyrgxpmSIli25vR38va8h4PYVPK9nHBzFXYSsq/6/y2Fhx4Towot78wVrQYTnmqsbeOoy/999vct80UcxzquipI6i8uiSlJd/bKqN8YnUrfw9Y7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8247.namprd12.prod.outlook.com (2603:10b6:8:f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Fri, 13 Jun
 2025 17:26:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Fri, 13 Jun 2025
 17:26:26 +0000
Message-ID: <0b0b8367-abd4-4982-aeec-08f8b95a286a@amd.com>
Date: Fri, 13 Jun 2025 19:26:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: DRM scheduler issue with spsc_queue
To: Matthew Brost <matthew.brost@intel.com>, dakr@kernel.org,
 pstanner@redhat.com, simona.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
References: <aExZdkcnBVvX1DCa@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aExZdkcnBVvX1DCa@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: 989c79a4-17dc-40ee-371f-08ddaa9f6cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MndxWmFnTUFMdXQxcWhiTTVOS0M0dkVOa1htRDhaNVVjeHRodUFIWCtudEth?=
 =?utf-8?B?SVNZbXVMKzY3UC9qb0JnQm9DZnNGRVVsMzRlZmpXOFNOQS90N3hVQThaWmtI?=
 =?utf-8?B?ZzUvOElFZ3ova1BGMUMrMzFZUmsrbTBiSnMxZ2MrYVJIeXhzZ0pwNnpmV1dt?=
 =?utf-8?B?bzFET2sxMkNIU2xtZllVR0JtY0lBRDk2VUVhWjU2SEZrMi9BK1VpNDZRckFD?=
 =?utf-8?B?UEN2ZXlwblc1K1pkR3ErSHJWRFhRUjh1Q0xDREEzY2VSN1UzZjhCMkxHSW9L?=
 =?utf-8?B?U2wrcFB4emo1S01jcndza3hWbytWUDRnZE5BVDBMYi9hNDV4b2NIbjQwYk1B?=
 =?utf-8?B?QXB5TkxCRWVyd2RoYzM0djljeHNXL0liZy90RktuK1dRQ2FZNmcyWEpjYkhO?=
 =?utf-8?B?eUxrSDdKY1crYkJhR1lDVjBUQUkvVE9Lb1dDUmpGazJqSFNreW9KWENVbUFU?=
 =?utf-8?B?MkNZbmhLWUlveENiTlJvNExxMlNLRG5ZWUdmRm14TEV5aXdyRFBlQVlTQXov?=
 =?utf-8?B?R0NGa1N3VGRUWUZKZjVRbXpoclpWQjIzT3g1Y0VoSEVtVDlwb0M5cG1Td0oz?=
 =?utf-8?B?aEpPd0xUT3BWWmJOM3FkeCtsb1cwaUdoOGg1ZjNoVkZ1NHp6Zm5GRHB5UUVs?=
 =?utf-8?B?OEpSTjRHMTRsUm41WFpYM3Qya1JGRnN3alNIVFVYckVibTJPV3A5empPY0FL?=
 =?utf-8?B?N2d4WjdPeC9jMS92My9KeW0xZGdKK0NvRFY3R2c0VVRaMTVZbndCMHFqU1RN?=
 =?utf-8?B?M3l1dUNkbncvR1djVEtXOUVWcmRLdkJTU2dqdnFUdE51TVNTKzFZNnpYc1Rk?=
 =?utf-8?B?Snh4Z05ibFBmSW5neUMrdEFaOEltNC8rMjQ4VGFad0ZCL282OWQ5V0doYVpj?=
 =?utf-8?B?Ylh6M01uS205M29YNmxJL3RFKzJzNmJ5SUFyOW5qcnMxK2ZDTTUwL2xDRXdG?=
 =?utf-8?B?VkRNcGM1Mys3VVRIZXcxZTdtcjBKVHd4VDVha3ZoVWROdWZod1lONnEvTjZJ?=
 =?utf-8?B?N3Qwa1MvNzBqd1hnK1prZUQ0KzdGN1dacGNwUGNVQmRxenh6Wk1PeDhjeElL?=
 =?utf-8?B?dlk3SVFTbWJ2dXJFU0pRWXNlRHFEcDd3WU9zdjhNREFDcGF0MEZORXVSTjV0?=
 =?utf-8?B?YlBoczBZZkpMU1JDVUYzaGlFTmF5QzNOQkh1SCs3QWRTVEtLVjExdkRIT2Ez?=
 =?utf-8?B?WWZ6MWF2eTJTM01ibmZ3dHNxeEpZOXdncERHQy8xTXQ4akpSTTlRR0ViS0I5?=
 =?utf-8?B?Z0pJSUhlWnJUazcvZk4yVVdBL1ZZN2pkb0hlajZST3kvY0xkTTBxSHFZV1Fv?=
 =?utf-8?B?L0htOWlZb3ltcG5jbFFPL0FleUI2L3N6RlJ6TnljUDh0QWZkdnJvcVNoUWRG?=
 =?utf-8?B?ZndkMkg3S0NRSDNyVUMyWE8ycUxUdEx2cEtMakFHeDE4TlBaNHdNcVFYQnhO?=
 =?utf-8?B?VURYTjI0MmFhcE5uanYrM0V3UGlTNTBnQjc5ZEZteUFSbTM4akgwVldJZ1My?=
 =?utf-8?B?V2VEcEc0VXJSVHFPOEh5dnRIanJQL3VqYVJLaUowUWZWenZ6Z2J4ajc5N21M?=
 =?utf-8?B?eVY1L0ZxbnM2UERuVUFWcUJXN2xHdmVLSkY5UGZlVTRQQ1FGTTg1S3AxcEx6?=
 =?utf-8?B?S3dWVnlKL1UxaU5vUEkwdTIrY0VrV0R6bGM1QUpIY3h6ZXZkUW1maUIrdEJW?=
 =?utf-8?B?R1l3WXk1TWdISFVveVdQNE12TkRsSm94dWxQRTAwS05iSWRMbnlnT2NBOEQ4?=
 =?utf-8?B?NUJtMGR1ZDBGN3hacTF4OU5ZTkxRLzVReC9mR2d1QWYwYmdEYTFGY0RlekNT?=
 =?utf-8?B?VElCU3lvRFg2TjV6dkt1Wm83VmNXQWhvekxpTlR0WEJSbXZ0WUdTYUlPUVF0?=
 =?utf-8?B?ckRVL0kzdmJPMmpBbjdxamJOMldGVTFvSmVZRFNhNEdSbjU5am04cy92KzB6?=
 =?utf-8?Q?wLZLLjfhh78=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm1WTUExSTJMN2FrUHR1Sllvb1FYd3VOZi9YRFpMTGtFcUxiMlNua2hZckE5?=
 =?utf-8?B?NFlQdUozNmtidHMzN0YyUkRkWVJTcFFZWVNXeGNYSkN0NGtoZmpJSEtVcUZq?=
 =?utf-8?B?TWpnamVtc2crVm9TbUtMdWRLUGJMV3FwZXNiNWxSWnk5UllnalpBS0czK3Q3?=
 =?utf-8?B?VHhjalVmdnRLdC9DVTR4RXNuS010Y0FnckhsYTJ0OTNhR2E2UFgrYk5wMGFY?=
 =?utf-8?B?cm5Vb0lyZFhoVXBITWNhYm5ieVRyenVXOFNobTBEUDNsNDJlL1pHZGVYQW93?=
 =?utf-8?B?aTNMb0ZhZGpnVDJJTkZtemduNFgwSStjbnNJR2svZ0kwSUtyOXBMZXFsdnRQ?=
 =?utf-8?B?UGdodkVMRGo3MjFsQ3BJTGhkVGhZYUNzcGJPcG1tWndwSVVaeDM5b0g1S2xO?=
 =?utf-8?B?ZDNEKzAxNmlaYVhIc2RjYWk4OXRLRGp0NGhYYkp4Y1NTYVl4OGZES0pxRWYw?=
 =?utf-8?B?SWZVeHpPSElyV0poVEZuWGdzNWFYc3k0Z3hJbGdndVpkZUpxY2JwRi83NENS?=
 =?utf-8?B?Z0ppUHBoSWg2alFTVXJnaEs3c1FyNE5odENBbU9zRU45cThzK0VsQ0lSRFk0?=
 =?utf-8?B?UE9GQXdEMy95azZDekpqOGdFOTJvV3JtWmJCSkpkOGJ2Wm9iKzQwL01zY2h1?=
 =?utf-8?B?cGVPdVV2NlpRQWREdU12bmZkSmlUOS84Y2V5VHIwTTBwUzdyNmZ4V045c0Q1?=
 =?utf-8?B?eWJCbjVXdStMM1VsL1hWRzlSWGx5MU9WUHErcVJjU2I4Ni81b3dnTll3c0Zt?=
 =?utf-8?B?L09SOGhwRUNMa3ErSmpvb2dxbGdkTXk5aUVncXRkczlsMzhaWWVIY0p2enI1?=
 =?utf-8?B?ZkFlWjd3OEZWdW8rTjdVeUpja2QyRE1aOVNrbllUZ1A0Y3FMMnFzU2ROa3hJ?=
 =?utf-8?B?VDN4QTAyYzRiRUtjVmRNUUxqRUt2S2M1MW5xMkJXeHFseHlyN0puWk9xNWtr?=
 =?utf-8?B?K25TMlRXMnVDN2h6Wm1ENjRzNUg5U1hKUkJEVU5PemplRXkxQmNDYnFwWDdy?=
 =?utf-8?B?b01QNmhLWlpZTHFnRkJjbGJDd1lQSVVMQjluRWZsZG4yanVraS9ZMVBCVjlE?=
 =?utf-8?B?WGhQc2w2KytKYmJVNnpkQVFWdDNSejhCMkFLY2F2S2ExVUlMYXVIS3FFVmlO?=
 =?utf-8?B?OGlXQ0k5MU1PZzdvTXdvUTUzVUF1NEVHdlBQN3FuUGEvQm43NlBRNStMSDRI?=
 =?utf-8?B?NFFIVFh5Umg4KzZ4WFpma3BTOVRnZTJibGt2bXNwOTd5Z0VraE9mNXVvOU1u?=
 =?utf-8?B?dlNhMDBnZjhORVhJN2FITTNhMGdmRWRESFU1MmNlVHQ4bGgvdU9iaElkaDl1?=
 =?utf-8?B?WkNrV0FhZ0VXcVhpMWFMT1NMY1M2aHZHTzl4bC8zeitNT1lSK3ZoVmtOVklC?=
 =?utf-8?B?RmlKRGI1QjZIUjd6QlI2N0VJdXpUUHY3VXZMbEpQcEpON2J0dU1OMjFOMExp?=
 =?utf-8?B?U0RRY2xlRlU0WTI2bk1OdndPZ3lXOWZwVTErR3NpMHRuaDMvZ25UYmNGbHcy?=
 =?utf-8?B?bU5sRTdGdnlKRTZidUVSc0pPakxJRlh2ZXFwcUJoVURMZWhCUlVmb1ZGQ0V3?=
 =?utf-8?B?aU5IOUFDZFQwdXhUTlA0b29keGVVUGNneFkxL21lc1RoRWpQZVhwRWNnQ0tB?=
 =?utf-8?B?MVdxZlh1VW9uT3BORi83QzVhZjR4RS95dGlkTExzbVpmU2M3OEkzQUVLVmI1?=
 =?utf-8?B?ektiN1JsYVl0Q21rYVpyc21DVDRRUXNKejRBZHA0WWlFQndJcmMwa2NoMzZH?=
 =?utf-8?B?aWtLYlZmbGZXbUI3Z2FEZ1JaK1R3ZVVQNXVoMEprVytnZHJvS2dkbUUvZGNC?=
 =?utf-8?B?cHE5TUt4NXdhbktZb2JtYjNPMXEvUHEveFZLWlZGQXJuQytmNEJtMno0aitD?=
 =?utf-8?B?UVZVQWdHUmhNRmYvNDU1QkJISnN6NE5zTEh2Ni9ERno5cUJJUnMxZURPKzI3?=
 =?utf-8?B?endZcTdWNWpPQ2FheUh2MmlBMHJzZllEY3RzOHJxM0Y3NnNxMWI4enZwcTJv?=
 =?utf-8?B?NDYwZFhTRTVwbnNJRFZvaW51WFd6dFNtWXRXOENadkpLVDBnRHprTDdYZGFa?=
 =?utf-8?B?dTF0VmdoRi8wV1BTeVdDNmEwZExpdEJLZ2x3c2xRYVJqTnBHMTc3RVBvVUJZ?=
 =?utf-8?Q?vLOtHSQYifAoW6Ud3BulVL+Do?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989c79a4-17dc-40ee-371f-08ddaa9f6cd6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 17:26:26.0580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4YEvf8CPo4HCG/M7DKzoVvoLAERewdJCg+VlTCVdryBvQKlDeVLAZLsF9g18pyC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8247
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

On 6/13/25 19:01, Matthew Brost wrote:
> All,
> 
> After about six hours of debugging, I found an issue in a fairly
> aggressive test case involving the DRM scheduler function
> drm_sched_entity_push_job. The problem is that spsc_queue_push does not
> correctly return first on a job push, causing the queue to fail to run
> even though it is ready.
> 
> I know this sounds a bit insane, but I assure you it’s happening and is
> quite reproducible. I'm working off a pull of drm-tip from a few days
> ago + some local change to Xe's memory management, with a Kconfig that
> has no debug options enabled. I’m not sure if there’s a bug somewhere in
> the kernel related to barriers or atomics in the recent drm-tip. That
> seems unlikely—but just as unlikely is that this bug has existed for a
> while without being triggered until now.
> 
> I've verified the hang in several ways: using printks, adding a debugfs
> entry to manually kick the DRM scheduler queue when it's stuck (which
> gets it unstuck), and replacing the SPSC queue with one guarded by a
> spinlock (which completely fixes the issue).
> 
> That last point raises a big question: why are we using a convoluted
> lockless algorithm here instead of a simple spinlock? This isn't a
> critical path—and even if it were, how much performance benefit are we
> actually getting from the lockless design? Probably very little.
> 
> Any objections to me rewriting this around a spinlock-based design? My
> head hurts from chasing this bug, and I feel like this is the best way
> forward rather than wasting more time here.

Well the spsc queue is some standard code I used in previous projects and we have never experienced any issue with that.

This is a massively performance critical code path and we need to make sure that we move as few cache lines as possible between the producer and consumer side.

That was the reason why we replaced the spinlock with the spsc queue before.

Regards,
Christian.

> 
> Matt

