Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C34990E486
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 09:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C279E10EA78;
	Wed, 19 Jun 2024 07:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xtIsBF90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4979E10EA78
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:31:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ax0U8SUQOkU4K9AFH5oPHnVNTUAAqxbIbJBFMdsYKu0RepiCra9h9kTkaP71OUlZ6XTkE4SL5wO2F3qNaBjlzFRD7E94ENKcJ+37JgyKQj9N9TidDiZW8eUwtxpjQvmF67j1GJSkAFn88eyjJrT87jgawHjYOZvypC79Bien+pudrJ/EUUB4KkwbqMWFhElnHkXdE82evlZeGFSJ8XzNvBS+z0R1dJvUXDyYuytyMLny1U2Rzjs3vseAIUipnyggpSYr78ip0Sqbi289ly7vpPCbrKCFlAePhJ3sQfKDbAh2HQbPklr4ZwM59TFDgu+DTo0XjcyLNhwzwu6PPkwQ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvNrR+GTYGF30Y9iOccAGxsRHNyVf6gXTJUZybTO+ww=;
 b=VOpeJZtqiUy4uWAqPjsDWWMMd5j6rOSNYul5BKZJhlau3oNdK0S67OwQ5qBIlzkFJnbVe5xDkQ83MGaxwmtSuK13IalOdwoT/BGmMwzUjZ8sS0AKf5hieXnkBiVPQdt5Ilgk6ZQlSSwFa0evLf48D6MBHvWnzAu5SkMnLiMH3gUvjARDWKrtdAIctCSlXqiYE8PvW81hX9vi6tFfLlLPCUWrL6CTpWCte6E/tuF43W2Oe+TGy1gaKrgfW3Ufv6dIzOCPs5Jn61PC7h7KrYYKLKfsLz1YvFbOzZhthPrAmVqVCur4KRNUypl5TotgpuiHxoMu7K8/y12ZR9khXXQqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvNrR+GTYGF30Y9iOccAGxsRHNyVf6gXTJUZybTO+ww=;
 b=xtIsBF90vw5FRiuQfV2yFJ8ElYCchbW13DlFa3pAj0peYQsX1rFMxhiINQdEx8IlEk3Bo7TDVhqx20JGgoVNTigxpKZwSGGwm+hv63VTZrVygVKEwNMvtVpBQ75Lv+098zYYNid7RbmK+S8dkyEt8nPEWs3DQTXRXQBuq8TJeNs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB9056.namprd12.prod.outlook.com (2603:10b6:930:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 07:31:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.017; Wed, 19 Jun 2024
 07:31:26 +0000
Message-ID: <13ee25a3-91ef-48da-a58d-f4b972fe0c4f@amd.com>
Date: Wed, 19 Jun 2024 09:31:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Design session notes: GPU acceleration in Xen
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, Xenia Ragiadakou
 <burzalodowa@gmail.com>, Ray Huang <ray.huang@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Direct Rendering Infrastructure development
 <dri-devel@lists.freedesktop.org>,
 Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com> <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com> <ZmwByZnn5vKcVLKI@macbook>
 <Zm-FidjSK3mOieSC@itl-email> <Zm_p1QvoZcjQ4gBa@macbook>
 <ZnCglhYlXmRPBZXE@mail-itl> <ZnDbaply6KaBUKJb@itl-email>
 <0b00c8f9-fb79-4b11-ae22-931205653203@amd.com> <ZnGVu9TjHKiEqxsu@itl-email>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZnGVu9TjHKiEqxsu@itl-email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: e089b7c7-0750-4ff1-a076-08dc9031d3f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uk1HSThNSXoveG1XZ0ZRcSs3V0lsNkQ1SXJmems0MEdsWFd6R2dHZ0d0MTJ6?=
 =?utf-8?B?THpZNktzaHpmUitIYVNFdGpFcVNQbUNISlZKNFZjcnVXZE1VR3p5bk9WTGlh?=
 =?utf-8?B?c0Y4akRVTTJOSjRRWXJjTlJFOFFKOFR5eGRMU1QxRTUyeFNpQzRIdTNVcm1J?=
 =?utf-8?B?K3FCbklHdjRlcHNjRnU5c3UzZDhzbnpLV3FGeE8vUkxRU3I2RmpNWkxFbGs0?=
 =?utf-8?B?a2RwblFaZE1wMGU3YXVxckxiV1RoWDdnTEVJM0hRN0x4RTdzeEZLKzd6Ly9Y?=
 =?utf-8?B?WjBQNnUyREk5dFB6dHp6cXR1UjdYcHhXRHJiYmdHNXpSTkRsUnhvQ2twb3hZ?=
 =?utf-8?B?ZHZMYkplUlQ5T2crRnRza0swMEVKYmxJSVpVL2xRV3VLMXRFWXExL2RNbTBl?=
 =?utf-8?B?bmNRcEY3YUN6azVmUmlDYnpZNk5pZ0s3QkJuSVBZZGt3N3IrYWk0SjgybEt2?=
 =?utf-8?B?RFIwb2ZuWlBKby9YQmg2a1Y4K3hDOUZ2SC9EMy8zVGxJanV0enJhVHZPRElB?=
 =?utf-8?B?SjUxUERvSFJxUWppeTh5bEEzbVZ2U2F6M0l2UlJuNHczZTBzNXh6QkRVNFBU?=
 =?utf-8?B?WGwxMWRML0ZvbUV5ZHVITTdETXFWQWVGTU1UUS9qcTdtTnd2ZVgvaitmYnRs?=
 =?utf-8?B?aFNFR1BjNkNMWnBRdWQ5RVZTNmtoaGo5clllcXJMR1BxTEZiU2FMUWU1N0U5?=
 =?utf-8?B?MkhFby9HZXpqQUVONzV6U1pKc0szNmFWR1RkS2NmVVp2Vjg0T3R0UzQ0d2hE?=
 =?utf-8?B?Y2Z3ajdLQ3grNm81Qk45VjdxUzVXaUJNTWdBeGhJN29XN3FiSFpPR0d2cHhQ?=
 =?utf-8?B?NzZLZkI4WEY5Vzl1MzZlL0ppSng2QkhFdUVpQXJhYi9xZTdHOFFHZzN5ZTFj?=
 =?utf-8?B?SHcvaE94di9lMFRXM0lHSHVheVI0OTRZQmRIbndmRzZkMjRLaU9VbVhmMHJI?=
 =?utf-8?B?TDNMZ2p0REJncTRNTUJXdDZhWk9tUTR3NXdzYjlMRmp0N3ZaN0JRZW5BcHdz?=
 =?utf-8?B?R2gyNzJhVEx6dXNWb1Q2K1l2ejluOWlGYUdIakxTZzE0SllNVG1jcExiL2ll?=
 =?utf-8?B?Z1I1bDRLTHFwWUtISnhCYnlGeEZrY05HcS91U240MWpKL292RktZVlBBM0tq?=
 =?utf-8?B?Q201UlgreFUvV1BJcmlydWdjS2Rqd0I3RWtJVzd5UlJ3Y3MyT3pqdUVCVjdn?=
 =?utf-8?B?RHg1RU1DSjFWTmxBZDJoOWYwc1VGdkdJMkRNOEN3ZGpOVUJ2Y1VxdUJtdCtS?=
 =?utf-8?B?VUJBODJiTnVKVVNHdm5yNnVWbUo0VXJKY1VsaTNHcEdwczl6bkYrdDJOZ1hG?=
 =?utf-8?B?TzRUZjFsdm5vYVEvalhpNWd2QVdMSmppUXg4bkdYZDMzVVljZTFWdlVDUWVP?=
 =?utf-8?B?anhIRTN0TmYzc1lwSG53bHBpWnQ2Z1JZMGRPLzF4UTkveE43R2VzTjU1L1pm?=
 =?utf-8?B?Tzg5RFgwVU1ZdTgvN1JxZnFoZnpmTm1YR2NsUjgvdDJVc2FQQlNCSjFDVmRi?=
 =?utf-8?B?NlpDVlMrLzV5UGVLbVIvekpPeDFsck85aXVoR2hXQ3dlUjdtYTFFVlMxYWti?=
 =?utf-8?B?MmIzUHBmeTJuc2VtbkdtQno4L1BRMnpaTjRLT3JlUGovaEtTVTRFdEhZalhR?=
 =?utf-8?B?S21DRVVoVDBxRjBTTzhESUV5TlczUldHZENqdk4xMVhlMFNhOGRNNitIVVZ4?=
 =?utf-8?B?ckhoVVdVT1FESCtIUTBqUm9UTnZnMUdnbHFuMDVySzJLb0cvcFY2cDBTZWlO?=
 =?utf-8?Q?soP8u8JF6KOgHOycg0N++6Fp49o5m1E5DjkDsEE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzNJTWdPeWhGRTJNYnlSNFlJUy9BVXYwWU1WNGJvY05VOVE3L1l4TEE5UE1F?=
 =?utf-8?B?M2NuTEZ5Z08xejJMWXFVT1YzcVFROG5BMDNDekJjZmVrN2ZjZWM4TlJVUzNG?=
 =?utf-8?B?OXlYc1lJVThzaG9jMlo0R2VKOXlBMkxqdjFRM1IzSzBnbzNkSERUWCt6OEF4?=
 =?utf-8?B?a1RqNGtFdkZPSkZPWlUvTnRwSVZMdDdWZFpoZGpWWlBhU1QxNnNzbVdEV3kx?=
 =?utf-8?B?dFFabDFBZ09tV2VmYkFWNUlYMWhPakdualdVNExkOW96aUZiWTJWVElrbnBB?=
 =?utf-8?B?emJETHZUb2pmTnRWeUlMSjBvTEVnNWlwZjY0ZS94VmkwUGxDSkttdjljdXNa?=
 =?utf-8?B?YklJUExUNFpmNm9hM2hnSXg1QUFwMGpqOUl5eDJPMWlaSFN3Z0lZcXREZzRw?=
 =?utf-8?B?OWtEVEpiZWNidUdDWGNjVXA0VC9KUlBQZExPOElWWlM2eGdsWUI3eUNxVnZq?=
 =?utf-8?B?Umo0RjBMbGR1MGQxRlM3cktEeEdKc2M5SCtWM1pFMFRvTm0rKzZ3Q2hTT05U?=
 =?utf-8?B?QkNkSWdZb0VIS2MzLzN4Qlg4RnhvandNN3dXR0J0RDRhSS96cUl5eWdFMlM2?=
 =?utf-8?B?TkR0MTFSYzRoMGltVnJPaHI3NUJ0SFZFQXlRZ3cyU2tNc1VPOFFPb2I3QU14?=
 =?utf-8?B?MGJmY0dNU3o4TUwrUzFkemNCTzNXaXRNYUNoY2tmQkxXQTFBY3BLaGNKbXY4?=
 =?utf-8?B?UFhENTJyOTJzSFBCcWFZNVNZWFNGTnMwdUw3U0dYVytFYnJRL3V3MENRUzE2?=
 =?utf-8?B?ZG1lSlMxYWE3a2RJb0I5QktDQWRuUFB0RkpCZnQ5SGtSWFY3Z2NZZEVneDhN?=
 =?utf-8?B?QU92ajU0WHFGRzdOaGc2VmtmbG1QaGg1eDYvNmI5SWtueGozZjJLRzBkbjNQ?=
 =?utf-8?B?T2hzajNiTFNDTE1vVnlsS20ySGxWWE5zNjA4SHZWNFhMb2NYQ0V0bGVpNFgw?=
 =?utf-8?B?SjhiSzFucldoNWJ4NGRUS0llQjYvTTA3RmhBQzNsRGxCcXh4VDBROG9wSzJk?=
 =?utf-8?B?bWd4RVJHSDBLb0NxOE5MUUtDcHdWdTY3WGNiZERGQUlNSnYxL08zeXExN29I?=
 =?utf-8?B?UVJURVdoV3hPRXllK24vNVJqbzd3TytFaDVaQlRPcGY0YzBvZUZ4ZXJ0T0RD?=
 =?utf-8?B?NVdKdkNwUHlVZmcxU2M0NkJlblhxV1dPR3Nmc1FNY3NOQ2luZXZEQVJ1M0Jo?=
 =?utf-8?B?cGZqOERqSEpoOXBabC92VVhKdDBLU05WYi9tUy9HMXNUcHllak9aSS9XeVF6?=
 =?utf-8?B?WmphSlI0d21JZCtyQ0x4bXlmL0pXMTNLRnpKUnBwMUxxa2VYeDVPaHFCSm1Z?=
 =?utf-8?B?SmtEK21OMmhPNUl2ZWdhWEQ2dzE5cGpwNUxNb0xwUFNrRlVQeFBPL0ZlOFd6?=
 =?utf-8?B?amc5cUNVRXE0SDQ0Q1RoSmJOVlltay9VY0ROVmsyMTFhUU93M2lFTk9UczNQ?=
 =?utf-8?B?eUZXcGJhZDFEZXhSbGE1dXh0Z1VtVTRRU1VVNkdZR1orWGgwQmZrd2ZNbUNs?=
 =?utf-8?B?MkNXdUZQaENuQlgyVjRSN3NaYy9BUXN5U1RvaU5UamtqdXB5M3hVNGk1Z0FF?=
 =?utf-8?B?YWFtMGh2NS9pMnBvUUdmeWxQdkdzaE9vL3VpN2hXR0puMFBiZk1BYVMvNWlv?=
 =?utf-8?B?WHVnTFVGWTVxckc5ekxLWVdMN0NmcnoyTFNic3JpU0M1UmN5Z0ZWZ0NUUVlO?=
 =?utf-8?B?R3RzaWlXWWVoekV6blRoRUNFSWZhcTVFOHNuMTNGcnpQdTZKNTdqTE5uRXZB?=
 =?utf-8?B?amg4VklFOGZYUEtpd1dCZ3d1SWZRRzJBUEhxZG4xakpKZkVYQzdLWGVObGpK?=
 =?utf-8?B?KzU5UDdmVE8xeHIwL0xINU5KYWwzRUM4RE10enlXdE5ZdWx6QnhCUHJFeW9l?=
 =?utf-8?B?VDhZQmFoSU1pOGRPVnlkaTlHNU9pN3VManpQMmlUWXBXL2RYanZnRlFjMFVh?=
 =?utf-8?B?dTFwWStBSkxIR2htdHk1eE5yVm44Q0xyejZYRzBERWNqbkZxQ2xwMkVPeWlV?=
 =?utf-8?B?M21mMHlscTBld0NDUnU1cUNYNjdkU0l2aG1KOHBoS1ArL2NPRWdMcUIzRnlo?=
 =?utf-8?B?bWxncVF2by9oaDZBSGZGaStZVGs3U0pneTFZdlhaT3dPWmlHLzlBVVk3WERi?=
 =?utf-8?Q?dFqQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e089b7c7-0750-4ff1-a076-08dc9031d3f9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 07:31:26.8979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3D47eGQRecCqqSP5E4Bz3QnEc0yG4Dq/KLZSJeyv+T6Il29etBPBp8QA6+4Ff4jV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9056
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

Am 18.06.24 um 16:12 schrieb Demi Marie Obenour:
> On Tue, Jun 18, 2024 at 08:33:38AM +0200, Christian König wrote:
> > Am 18.06.24 um 02:57 schrieb Demi Marie Obenour:
> >> On Mon, Jun 17, 2024 at 10:46:13PM +0200, Marek Marczykowski-Górecki
> >> wrote:
> >>> On Mon, Jun 17, 2024 at 09:46:29AM +0200, Roger Pau Monné wrote:
> >>>> On Sun, Jun 16, 2024 at 08:38:19PM -0400, Demi Marie Obenour wrote:
> >>>>> In both cases, the device physical
> >>>>> addresses are identical to dom0’s physical addresses.
> >>>>
> >>>> Yes, but a PV dom0 physical address space can be very scattered.
> >>>>
> >>>> IIRC there's an hypercall to request physically contiguous memory for
> >>>> PV, but you don't want to be using that every time you allocate a
> >>>> buffer (not sure it would support the sizes needed by the GPU
> >>>> anyway).
> >>
> >>> Indeed that isn't going to fly. In older Qubes versions we had PV
> >>> sys-net with PCI passthrough for a network card. After some uptime it
> >>> was basically impossible to restart and still have enough contagious
> >>> memory for a network driver, and there it was about _much_ smaller
> >>> buffers, like 2M or 4M. At least not without shutting down a lot more
> >>> things to free some more memory.
> >>
> >> Ouch!  That makes me wonder if all GPU drivers actually need physically
> >> contiguous buffers, or if it is (as I suspect) driver-specific. CCing
> >> Christian König who has mentioned issues in this area.
>
> > Well GPUs don't need physical contiguous memory to function, but if they
> > only get 4k pages to work with it means a quite large (up to 30%)
> > performance penalty.
>
> The status quo is "no GPU acceleration at all", so 70% of bare metal
> performance would be amazing right now.

Well AMD uses native context approach in XEN which which delivers over 
90% of bare metal performance.

Pierre-Eric can tell you more, but we certainly have GPU solutions in 
productions with XEN which would suffer greatly if we see the underlying 
memory fragmented like this.

>   However, the implementation
> should not preclude eliminating this performance penalty in the future.
>
> What size pages do GPUs need for good performance?  Is it the same as
> CPU huge pages?

2MiB are usually sufficient.

Regards,
Christian.

>   PV dom0 doesn't get huge pages at all, but PVH and HVM
> guests do, and the goal is to move away from PV guests as they have lots
> of unrelated problems.
>
> > So scattering memory like you described is probably a very bad idea 
> if you
> > want any halve way decent performance.
>
> For an initial prototype a 30% performance penalty is acceptable, but
> it's good to know that memory fragmentation needs to be avoided.
>
> > Regards,
> > Christian
>
> Thanks for the prompt response!

