Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 432FDB3E446
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 15:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9F310E459;
	Mon,  1 Sep 2025 13:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SjrxwAap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1B810E116;
 Mon,  1 Sep 2025 13:13:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=et1tlG3ytT8GpL2JGVRmnhwh+1cEcucQHFPaREw5eGNcT8jwI6gmFtBMv0OC5R/aYhVlHZJUVgF13MYPWkJ4XbGWqGd1Z/I4eOgQ91JtnF1WzzOSWoPmd+T2fQBnfemYx4YHKGRoj2dfTd4jsabnCNMC7OJJxAKnHHc9DZtpduj8+ycm+JH4zB6kWi5XtMjUUT8/xAgg6kxTaanaCgnshTSeratnJt7lGyE+M8ulZoOpMwkWLZViQPCLKvKMGHJ9RdVmKPSQ2SMAmzw2z63tz6BaRTzg3XlCUESYv2QSysWp4QWCIBlckEogxMu8SyPaoh7lnenrHQGXXxdDcYsM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdzhZF67S6gUVCiIg0r+zPTC2ALxiL630I1Ylm1vleM=;
 b=MTVAjL/9ETh0d3jl6WT6/gcGRdk5AQCjyJvVpD99gIM5HU2Cz1ACy2qwFpwtjlXMwP4iXxBvPDJOgw7ivR7mzHJ/YXW2of9xIYVMswqvm5OMmF7NHLmDo90qEgLNCwEg4Qc1BVJDD/MDbxLTtRHrUivNWaT5kGPbR6TbM1wLi/CQeDZzutq88DwFLFv1KL/wfrS1nyPx25Z2CLiK1dbNN00M3v6U3nr4muXvYTO3SkVj6xACxKJnQBySzkt4Pvc8vskGPWL/eKLPV985P0Q7gTOzmmrrZfwlsjsaOeu0JCO+w2ECdI+xTE55D8zcjh2xoWfigm8VZFsyQqu+SMdSQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdzhZF67S6gUVCiIg0r+zPTC2ALxiL630I1Ylm1vleM=;
 b=SjrxwAapvr2Ue8MRFmgu9yEYweQEEFZESHebwNRr+814s9GpoergC8XTc4jW2hjTZMegiR3uWqYPEmKEKP2mjlMdhZza+dyYQUxuEAIxM+GGlbocjl87+B7sL2xQfaFjlMI1duq7MKIuTSybOvY6Q4RPqhwk+0GZFHBF7GreN3vOaiQ5V0VeG/gzLSu8cXWPZcCPatpbdgWBix3KbbmPQL23HjVNBx1kE7mAx8hz5JdGKKz8gH0T04in8VkNjn2UoAAw1wVLMMJedDD5RsV75sh1H1BbTPAS853Opeb/jSs5vLdcHEFyNyoscRvWIW6B3IrTvVoB3Zv67iQ9fhedRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB7711.namprd12.prod.outlook.com (2603:10b6:208:421::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Mon, 1 Sep
 2025 13:13:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Mon, 1 Sep 2025
 13:13:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 22:13:14 +0900
Message-Id: <DCHHNSM1VS76.3ET66BZWUXCOM@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH] gpu: nova-core: take advantage of pci::Device::unbind()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250830133255.62380-1-dakr@kernel.org>
 <DCGNTYLUDMUD.2OVROKOZ97QWP@nvidia.com>
 <DCHEFFK24WF2.2RGNO3JUNLCUR@kernel.org>
In-Reply-To: <DCHEFFK24WF2.2RGNO3JUNLCUR@kernel.org>
X-ClientProxiedBy: TYCPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:405:2::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: d89fdf0e-d713-4cf3-f1e1-08dde9595049
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkYyb1ovZUtVRXF1RWRXLzZHZ3BwaUhLdFN5b3NFdE84YVNTVHl0K3BYdk1o?=
 =?utf-8?B?VENJMFRwdXNaQ0dFdXdFbWN5VXMvVlEwZm9nWW5kQVFaZHREMTNtYmxib0g4?=
 =?utf-8?B?Wm16UHNLc2VmNUNLTHB4OEZacEY1eUx6emRuRWt4em93WDEvdmZyc0RIcy9u?=
 =?utf-8?B?azgzd1hSTzk5aXJZYWR0RzdvZnBHR0xKS1RQS2VLNWtHRysvbnJtQTRLNjZK?=
 =?utf-8?B?QWt4Q0VZTmM0NHFRdWptemdzSTdvOVVLS2RYZFBRNUk2eHFoRkVHREkweExP?=
 =?utf-8?B?VHRyVHkyc3l3UlZOT2VQQnZaanNEMWFoRFhGdVZSNTBpM01QVjhvTGRaam11?=
 =?utf-8?B?U1VyWTcvblRGN1ZKczlzSTN6amdybWVaMktPb3JPaklQMU9MWnlqeXUxWll5?=
 =?utf-8?B?d0hDNWYyVG4yaFpwZFlNNTNUL09EVnNFWjBSanVLSXo2TUcvTTFZTnNLOXly?=
 =?utf-8?B?VC8xb0pXQSs0OTEzeHBSZjVPODVzYjVEdFhZVG5rOWcvdEJoYUN3S3ZRUmJx?=
 =?utf-8?B?ekFOSEVmNGYvVUxxU0FVWmNRYmhSanVkd3Q2N3ZmakNpVlFOL2srU1EzaWla?=
 =?utf-8?B?WTBvZ3JkdmduMG9SbXhzTG5XWlRzbk81NmxhMDFrcmxtaU9rcEg4N1FLcENx?=
 =?utf-8?B?aHJhRVdRVk5ueCtWYlBLWUxNMk5UQ3dQSlFPT2wxa2ZjcWxoUEMvNWtuWno5?=
 =?utf-8?B?bUxiZGczSkk4c3dMOWZjU2ZIRFdmLzlDUFg1Y3BnK21KV1BmcDVjNXgwQlZu?=
 =?utf-8?B?S0dtVVJnSHJxSU9MRDZZQlp0SGJBbXJZTFZ5L3UvME1DS2dDaE1rSTJneDFy?=
 =?utf-8?B?ankrNFhTV3pxSXN3M2ZQSjQybjhnSk9PRmlPWE10aFRLdWxYR2Rwc1oyR3B2?=
 =?utf-8?B?V0pxaU5DN3dUSjRYM053OHczVEhhaTdJMGJhS1Y2MWFBWjlQSUVDWlJaUGhI?=
 =?utf-8?B?QXkwWnphUDZLbXNRQmF2OVRiaUxPaDN2RzdlcUlkdVdXaUVqQlVuMWlZbFZl?=
 =?utf-8?B?KzAwcEszaDljVGRES1pLdzZubkh3Yy9hd1BaVEpNVG9CZVlqMk12SmF3UVdR?=
 =?utf-8?B?NnhFZkFsRXdaZS9INVJFaEVaRVBmcmdQQU5ZWmYyUEJlYUVvcDhPcWc5bEZC?=
 =?utf-8?B?Z1Zsb25OQmorYkMvekVJaG94SmJERTV0a3MwaVM0c2hqaVhaWFlzSFkrTEg0?=
 =?utf-8?B?Z0tFNlVYVE0xaEhFK0liNmR5TmlmcE1lSEV0U2RFYkFISGQzdjdnTWtvRDBT?=
 =?utf-8?B?djNmdWlEUXBzMm9ZLzRQeDhDVktiaDdoQkxPakFxbWFNeGZjZFoyOUhYd1Av?=
 =?utf-8?B?RTE3L2xGWmdhRWxQVDZNM21MU2laT0ZDRnFTV2o5QnBTZVZsWlcxc0FheUpW?=
 =?utf-8?B?M1JZYTZNMzg5UXRxeG5WZ0czRVFSMW1Ib29IbGdaY09sM3lrMGdsVEE5V1Mv?=
 =?utf-8?B?cFo3NS9nTVErY2Y0WUNTWlpUR1F0Rmd2R2poajM1ZVRKVlY0R1Y0RExzZC9M?=
 =?utf-8?B?eTRtaWNrc01xSzRZSlZkcE1wR25QYnF6WGRuRTJBSWs3R2oydml4ZnR3elNr?=
 =?utf-8?B?UkI1OHFKY0JkTkVEdVk3UjFGaU1ISFFCckhYa3p1VUdXVHZ2am9EUXNTQ3dv?=
 =?utf-8?B?ZUgwQ1I5SFpyOFBGTnhNNG1JVUtHOEtYeEZ5VDFzdXZTTyt0aDNkYjRSc2tn?=
 =?utf-8?B?M2F0UGRKekpPN0txMktndmF0OXFRWDVUaThZZmxMbk9wdkk1dUtja3gvdHRa?=
 =?utf-8?B?YVZOZTRsN0c1elVQamMyTkg3bjJGd0xBdElQeVhpL21FaUJPZCtjQU9CUk05?=
 =?utf-8?B?NW9reFFKM0RxM2lkU1A4SUNxRU1TY0JoUHoveVEyV3dXdjIrdWpydmlmQlhP?=
 =?utf-8?B?aE80WlA0OFJHRzBEaWlXZ091MEMvQ0lqNHBtemxZWEtzWVE2cXpVOG9uL2Fa?=
 =?utf-8?Q?Z0wVmMCKkQ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0FHOTZpUDlxN3NwSWhFOGxweWNPSUNtUEIyaXJVRUZhQzhNOFRFVFFVaFRF?=
 =?utf-8?B?TXNhNVFlWU1iT1VKeHhqM1FudytvLzRReCtCY2g4RlJxOG9VMjZJOWFBRXkx?=
 =?utf-8?B?OHV0ZlBBODB2b2M0NWtQdVNSUDZsQ1JSdVhHeDZIdk1lZWQ5dWlsQVdFWWZy?=
 =?utf-8?B?Y3dZbjcwSWRBMkpYNmdRQ2VEWEpYWHRNR3RkaEU4Z2pWWU5QZC93R3YwNWhO?=
 =?utf-8?B?T0lkWVo5YmQ5eWxNYVFvZlh0SEpSMVNUbFd0dUZGMWwxNmpMdURQT0g5cFdN?=
 =?utf-8?B?bkRaU1hjMXQvV1VqazlSYkdMTmFvNjB4Zkh5K2hxYk9vdzhBQnF1alA1RlBO?=
 =?utf-8?B?cmQ4anY3ajc1SXNwY2JRaHJDb2hWNTZnRlZaSXBBSHY1YUFUWmFDVlFyd1dN?=
 =?utf-8?B?OE5mWTIrSXZET3dMUHdIUGx0VitPdHpJRG5DdElHN3FWQ3lWRFFFOXo5RnI3?=
 =?utf-8?B?NjJiY1dLWExaSGJhVXczai90bFRRcndzbXAvT2YzR1VTM09PRmpGZmFINCsw?=
 =?utf-8?B?UW53MHBTUjJvL0M0UThRYUI2d0V4RmtFeWdweERiczhudnZvWTYrbHdOOVVu?=
 =?utf-8?B?L01KVmIxWW9PSmxjY2lOK0NLc2xFUnBUcWJuQ2tpSjZ4NVdPV3k1ZjF6N3No?=
 =?utf-8?B?eTZuVUhFKzJuejJGc0d4SnJTZDFWd3gra2NJV1Z4UDZja0xNNUhXeWJqZEI5?=
 =?utf-8?B?ZzlUcUcyc1ZDVzRJb2QxeUs0UzN3c2VHcE9Cblo1QTJxN1UzRnFxOGYzQjJr?=
 =?utf-8?B?L1RiWkhuektLK2h6QW1nNDBPenExSEFubGhSam05OFRMZXpxVHgrQmlNWDB3?=
 =?utf-8?B?cVFNeCtTQVFCMkJqMWRKTjZ3SEFsSU1DeVBId05pWTBwVkhjZUIwTDZpZHZV?=
 =?utf-8?B?SVBaOGlSb1ZRZkNpamJ3UFdvVDJzaWltbkpjNnRqU3RTMGVYL0RZWkRTVy9t?=
 =?utf-8?B?czhtVnFROW5CeTVXNk5TY3ZCaDJOQkhLY0JUeUQ2K0swREJKNlRVdUJsaWVp?=
 =?utf-8?B?VUdkWS9wbzZoYmljRDM1M1pncTIvRzZwMC9yK3huSW5WdnE0OVdwTEROUEpC?=
 =?utf-8?B?eU12L21Kc0hpSDV5OTFrQ0Z6dlNpODM3TDc0dU9STnlDZU56aWcvY000UzAw?=
 =?utf-8?B?cjVkekZ4dGtoTHVLbkk0L1J5cE9ubElCYWNoN2M3aHBWamFIQXA2cFlMaHdW?=
 =?utf-8?B?WENjV3drMWNVSkNDSERjRHNsSGluaUdlN3dodG05N0tObnArVlFlOHNjeEFW?=
 =?utf-8?B?ejZITTdvc2ZFZVZyWVpRZmY4UFVWUTl6andlM2phN2xtaUl3SStvTzVvQndH?=
 =?utf-8?B?eEtaZFoweDc5QVFaQTFXRGdxaGtMOE00bEdvMHhFMUVYQmtRYlFQUDRWb2Z2?=
 =?utf-8?B?VTg1YUVOUGlpZlMwTzhNUythbGRIeWZCZ05adzY0c3FpWGNUQnVxd0tBNFIr?=
 =?utf-8?B?b2RVMDFUVm1oa1pTMlZSajJzTHJDUEcwOWROTTAzUjV5QlVYa3lnalpLTFYv?=
 =?utf-8?B?YmxEYnlRNTZ4aVlCSm5RUUdYQ1dMZVQ3M1RNb29WOTZQWElKSXVHTFk4Rnkx?=
 =?utf-8?B?RFN1b1JaRU9IS25GTytoVDBPZnc5MUJWQW9kdm92bWdwMmNrbzVaSWp6bmNt?=
 =?utf-8?B?REo4N3F4UzNJSnhhS0tRak1UV2czNTZreHhuRVhkQndwclFtVVJIdGU5cktn?=
 =?utf-8?B?MUN0aWpxYUNYVDVyQUorSUVZY25ycW5ucXVpZGdGZzdTSSsvUFI5dkpqMU9U?=
 =?utf-8?B?S240R1UzSlBoaHorcmZZbzJGUGp2ZzVwdmMzR1Awajh5R2FmZWl6UHdQOVN0?=
 =?utf-8?B?eDlCVFJXdFdhS3o2N3ZINTVMWlB4RG1Qd254T2tEZWdOL3lqQWJNL0owYkxp?=
 =?utf-8?B?YVJwUTVFWTFjMlorU2kyUENhQkVobmlQTHRuUmVIcHJESnRFRjJEdTNBY0t1?=
 =?utf-8?B?cFRnWDZSV3RZNzRwb2p4T2FUaWFkTjlqNzNvRzRyY1Z5aHl4ZngvQmx5YzM2?=
 =?utf-8?B?WVRtUEUwQlFicFZEUUlzWXo2cW1QeHpFNUtHelNoV25OMGF2UFdEYVJSU055?=
 =?utf-8?B?YldVbk1hbXFGTnI3cmRVRnBtbGd4U2c0OE1HMTRydUpqa0hBZVpKa2xXeVh0?=
 =?utf-8?B?WXFPWXBJdTFONndKZWFaVGtycnRiK2t6c0FZSncvRVQwUG5UNElhcUlvdW1E?=
 =?utf-8?Q?Rq3GoWUfzuMoaNEwzT1+cx1vs8Dk6x4XWgoA94SQT39C?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89fdf0e-d713-4cf3-f1e1-08dde9595049
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 13:13:16.9116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UMA2pquI0aMrXPY4F8bRx8qbPV1xP94KpJyZclrR8Sz56WZK+OdIai6KxDqPbL9pjPZvjEDUICa32QOg/K4Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7711
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

On Mon Sep 1, 2025 at 7:41 PM JST, Danilo Krummrich wrote:
> On Sun Aug 31, 2025 at 3:50 PM CEST, Alexandre Courbot wrote:
>>> +    pub(crate) fn unbind(&self, pdev: &pci::Device<device::Bound>) {
>>> +        // Unregister the sysmem flush page before we release it.
>>> +        kernel::warn_on!(self.bar.access(pdev.as_ref()).map_or(true, |=
bar| {
>>> +            self.sysmem_flush.unregister(bar);
>>> +
>>> +            false
>>> +        }));
>>> +    }
>>
>> Maybe I'm overtly cautious, but this method can be called from a large
>> part of the driver, leaving the Gpu device in a half-unbound state. The
>> `PinnedDrop` approach had the benefit of not allowing this.
>>
>> One way to solve the problem would be to make this method `pub(in
>> crate::driver)`, so other modules cannot call it.
>
> pub(in crate::driver) doesn't work, since hierarchically it's a sibling. =
:(

Argh. TIL.

>
> However, I can add a doc-comment to make it a bit more obvious.

Would it also help if we made `Gpu::unbind` take a
`pci::Device<device::Core>`? That way, driver functions that only have a
bound device could not invoke it.

(also, should we make the argument a `device::Device` instead of a
`pci::Device`?)
