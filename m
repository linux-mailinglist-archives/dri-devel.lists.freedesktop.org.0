Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1997CA39D49
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36DA710E6B7;
	Tue, 18 Feb 2025 13:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l+Ts1ETY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B6B10E102;
 Tue, 18 Feb 2025 13:23:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrD7Vw+NPoR30+CKi4Kjhf5+N1+mUzvL3MhcjQ0M8UAb1iZyCU924Vc4TOlYgqwiAHJZGPfY5I5mBaRSfeZvFsvRYdHCcJ9SJLDD7xIKX6FaYw3ee2d7WlAoLzrcQw2TJQXTY75pCUzHHY8vC66/zh6RFyPo3fhbE8YBD+moZfcWNLMWpl8awRkdgn2dFmlBN/+SwnyLLzLFydChcRps08z+bYonA6YbwAXqY4zea16OS5VoBoiNnl/ixzI8/wKppNwsC9To+z8tAlPMNEYYJiYNGqDf6HpnVaPsQ5v6UibuGuocG6yTb+/yxL7lppBCrj0hrc40OWyW5w7pibOGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HnKLIkweBIQf9v3c0LtyIGAfLP1gWoi638Vh3ChZZ4=;
 b=WF0UzZesIo8SJ1suoprJ9cajCcKA4qwvYV7MpF6lg0ZUdIiWk3kGQ/3XutyejEKQaqBN+5d1gdPfhBSMUeNSDpI9AkP7ZP4kVsxl90JTR39PwItBkotTq5b6JTRLeMGTldj90Q3zwPbfXuqkXvJ5rg4tSeHC+uFdgUj7Nc250h4iLNPJ3/nXkBIlJRITemBOqlSdEYmi8MncGamC/frXScM7onUB1VAYieo2PfwXxgtEFhAE1nW1A1rGsu6CtSu36Co4Ja5bnjolLktoDTad31rEG+bcl515+QNE4B17YmQRs3yDw23w5g8CveeeT0Af5W+JZ84l9ZmWBGqBbPeBEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HnKLIkweBIQf9v3c0LtyIGAfLP1gWoi638Vh3ChZZ4=;
 b=l+Ts1ETYbqlynh0SOTTGVTIRtNIGPYshKdHhWSoqJw9Os3QiWyWJkpSZPqy/eq6U0fD4E1IfOBCMx05cfV3Ye5oa1I/7fHpZCwC3hoVFPP7t0jGDre8fqVGSenRqnUNLw6r8CEjVGkUpeaNhw/IkgzD3knkIHZioVRs7oBiDnmorEuaU5ryb0ZsMlDkWMWlyxwtcgKQKEEBCXP1PrYUxsUR6De4Ur8LctCIp+uo5B9axSz5cEF/9rf4l5MC8EGJuQ3iZZ9laDIDWbih9REt/k7NijijyTU7D/Dc+xabLSRDyks5w6XFXKFJIGfNTRokDQJ3IjhN6tWrfL9LEr6y1pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPFD525C5379.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 13:23:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 13:23:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Feb 2025 22:23:46 +0900
Message-Id: <D7VLRMSXR7P4.17VI1SABS57J2@nvidia.com>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Greg KH" <gregkh@linuxfoundation.org>, "Danilo Krummrich"
 <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7NaPYvuRF11uxnM@phenom.ffwll.local> <2025021830-segment-boil-5ff7@gregkh>
In-Reply-To: <2025021830-segment-boil-5ff7@gregkh>
X-ClientProxiedBy: TYCP301CA0087.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPFD525C5379:EE_
X-MS-Office365-Filtering-Correlation-Id: 5268d403-3df8-4396-e769-08dd501f7ad5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rnc5d005dU5wV3J3WUpraHhjWVcrZVB0U2lCdTBxLzk1emQ3cHVUT24wa1lP?=
 =?utf-8?B?d2w3THJLb1grUGxnY0xydFpxT2oyWTlRbUVnV05ObVdnWUZINUw1THFYalhw?=
 =?utf-8?B?Z2VzNjZFYnRRUVFYYloxT1R1c3hvNUF4bCs4bnliUlU0bHlSVVh0dmJ4M0No?=
 =?utf-8?B?R1FFL3pTbDM1dWc0WlRvZTJOZnYzeURqb0hzN1BzNkQ5b2pMcXZtUWlWYlFz?=
 =?utf-8?B?VWQ1RS9wcjR6dEFMMWRteTRVbzhVRklFcnBnK2I1alliOHpBOTkwSDI5MVJm?=
 =?utf-8?B?RnhGUWJBaDdVQlZ2Ri9wWWRpeUZ3dmFEVEJNOWxPUTJSc2ZaM081WFBWNmRv?=
 =?utf-8?B?L3BkaEJNQ001UUw0UkZQMWErd1RoN2NWangxWGhXdXBNb2tBb2dPSFRpQ3c5?=
 =?utf-8?B?NStJNGxiOXUvM3ZkN1hoUzhXeFhVbnhOQ1VoZnRxYnpPbzNzQ256ajBnZFFW?=
 =?utf-8?B?WTg3RTdSSTMzZVFqRnkxNEVIeEZYOHpmN2pEVXJnUjlDR0QzWDVZZ3l2WWli?=
 =?utf-8?B?Sk9sNGFOTGFickx5M2h4ZnY5M1o1ZTcweGhZbHF6SE1QQWhhd2ZBNGNtKzZY?=
 =?utf-8?B?b3R6Y2lkcmd2cFNCZ3lrbWdZTHNnaXl1blVaQnE4b3NPNFZibEJhaVczZDVa?=
 =?utf-8?B?U3c4WXNOMG1nNytHUlNwSWFQZ0xhODJaWEpyNEhqamt5eGNReitGN3VQdVN4?=
 =?utf-8?B?dkVRMnl4NVdMaU9lL05pOXVXcUVaZlpLODRYY0p3YUtvcnNCVHVMb3ZHY0ZX?=
 =?utf-8?B?SXVZQVA3WWtZUEZ1VVBQd1pLUVE3TUVhbTF0THBhQlFadHFPbmpmWHN1NVR2?=
 =?utf-8?B?dnBmRWNLakNFMURuY3hHM3hFdS9jcFFRYmlqaG9zUFVyVFJQdzc5OU5ocGVB?=
 =?utf-8?B?cGNsUU0zODJXazAxNTRBUjlXMlQwNUhDMHh2UGd0T0pGdm1lcTMrYzgrSU5s?=
 =?utf-8?B?dk9sbURaaE44Z2laY0FjVTloMnRaSFB6eHN3QndaU21PYWZLeGFybWVubVZY?=
 =?utf-8?B?R25lM2pzbWU2SVM0ZWFYZFpXSUpzb1RnbEkxODFNdXRhejBFbjVnekFhTXdX?=
 =?utf-8?B?NHNUMkhpSkJQMTl6aGVoY1pEZTAxNjdBN1NJaE5kR2g0QlZqYjZMNFBLdERj?=
 =?utf-8?B?aGtNZWN1Z1JjV21WdDRiaU5HekozMjJyVGZzRGo3em1CRkJwQmp4Tzc3VVQz?=
 =?utf-8?B?djg2M0dpNzYyYTR5SHczV0l3Q0VRYWswOWN6dFdBRXhDazlLZ2twazZDWENp?=
 =?utf-8?B?YStQdzVXQ1lrbU9tTUxJbkxObVJ4azBrdmsxa003NytnRnUvRGF6amxEOHhO?=
 =?utf-8?B?TjF2d0N3THFwUkJmdjlUdE50RU14aHp4VXZ4d0VlaWpWR3pmMnRkK3BpYkRr?=
 =?utf-8?B?bHNzOG1zZ045MFltL2RsdEhqaUFBTFZFT0k0QTZoOSs3V1VZb293TWZSc1ZX?=
 =?utf-8?B?dTdxRTV0aUR2MzkwRlE3WlpNMDN0aXdvZkRFbzJXMi9wQnY3TnpodmphWU5J?=
 =?utf-8?B?MXR5Q09oZFFpZ1Jpc3B1VHpmY1RuQWVqWWl1QlhXYi9TdnNoQ2d5cXlZRFVh?=
 =?utf-8?B?YS9iTzM2czFSV3NjSU80UXVSTkp1QWdPak9BYXRnSjFlaWFRblBJWEljUFZw?=
 =?utf-8?B?QnFTVitxOFVEM2toYkVxL0dyVjV1Z3hHeVMvWjB0Uit1RXExcXZPbTVaUTh2?=
 =?utf-8?B?M2tkMERjc1NrSkZsOUJsWlhmSEFHWVhQTHBXNG45WGpEdlhEOXJTNm9yd0tr?=
 =?utf-8?B?L1hLMmFlZGg5MERIakFsYXlpbXltcVpSVUtiMnllTkNVeGlHWEhxdUQ0OHFN?=
 =?utf-8?B?M0F6Q2s4VVBXb2hlUms1ZlBhanZDeCtMZVNwVGJhOXV5UmVsMjU3Mkt0S0p2?=
 =?utf-8?Q?i/xumttTrhduA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTZXaDRUZU9IOGJWY05GUW8zOUxvRU95Qk00TnQwR2FqSERqbnlDMjBwT1JV?=
 =?utf-8?B?NytQdVE4alBWUDBVSG1oRWlUblIzL0JldzFUR1E1SStLRGlUbWF4MmkxZEJO?=
 =?utf-8?B?K3dQeUxrN1pFb3hnVytueGFPSVpsY01nUTFFQVgwVHVYeHZidzR6c1pzNkF1?=
 =?utf-8?B?T2h4WDgzaFFIRXM0N0VqS3cwRGFabnIzdXlkazM4d2RvRTRxRzdZTHNhcHNT?=
 =?utf-8?B?cngwS0RGRzhZVDJldHJqT3JxU2MxTm1tVzQ2UU40dElqTXdidjNrd3VzY3FD?=
 =?utf-8?B?Y3pESXd6bWZjNEdUeGhsZnFJV01jVElPR05aem5mMVFuMFphRUpYNERFdno3?=
 =?utf-8?B?QkF3Uk9SUTBIUGgrWGxUMks1SU52eUFUTmVPSkw0Zm9OSmtLQmJhbmozUDFC?=
 =?utf-8?B?aXFNT1FjUDc4bktzZm5reGZFdGRPMm5vNHFud3lMRHM2VFBYU3FVbHBmbnZi?=
 =?utf-8?B?YzNyVWZvZUMvd1gzejBCYVdpbFhNbUhBRmFCcTBBdkNPY3FoZTB4ZVZmRG11?=
 =?utf-8?B?bkRWSkdMcy9zQzJDY05yOU1aQzRhMEErZXFHTUxtUmVjRFZxeXF2U01LRS9v?=
 =?utf-8?B?NUkyTWUrclJocU9zdzNoRWdEY0F5Umh4WXdPZlR3RVlsditBakhpbzFvRmln?=
 =?utf-8?B?ZXhkL0xLeVc5UVR0QTB4U29iMFl0NlZEM3pJY3laaDhscGdEUEFPbnM3SUh5?=
 =?utf-8?B?NDU5NGE3QnlpaExrQ3QxSGRWWTRsODQwaXRZaVBCczdXNk1LQWsxRlFtM1hU?=
 =?utf-8?B?eFl5djRDYXhWWEg1TVpOUk1WNmVITitaelpDaUlVb0J6T3I3c1NBMVY1N1Fa?=
 =?utf-8?B?eUkxNGtxVmhVUjVEV1VUb040QzRmLzdxNURweS9oTS9tSXd6M3orMUE2dk8v?=
 =?utf-8?B?VmtadHVjZEJTT2FIM2JJbHpCUVcxM0J3RWZVblU0NEFLYVd0Mlc5WS9rcWhl?=
 =?utf-8?B?ZU9WTEdtZElJYkNXK214dUlRWDU4YWdxOHZJcEhWcklNenRxalhkeHIrd1kz?=
 =?utf-8?B?ZlFCWFVhbU1PbG54RlJHVFlpbmlITlZhcnhXckxqK2JxUkxKejJKeGtxUFlY?=
 =?utf-8?B?bkJnaGRNdkgrUFo0N2t5WTBjRGE1cDdQU3F3aUlvbnlQRTJLMXZSQ1RWR1NH?=
 =?utf-8?B?elo2NWRTRE5xOHYrWVZJNTZRNUE0c3RycFZiK1JES2hjdnduK1llOWIxNFJR?=
 =?utf-8?B?clB1MnpFNGU5bkQzQVZYQ0RaSDh3a2c2dFovK2xUVUswQVA4bmFaMEQyM1Jx?=
 =?utf-8?B?WWRCOENWUW9obUk2c2ZqbGRhaVNVY2JjbWZobWtsemZ4T29UUzNJMmxyems4?=
 =?utf-8?B?eGVHMk8wMzl4SmdQSDIxZk85MUw3T0R2NS9jd1JORE82MWdoT3p2SkZENU5X?=
 =?utf-8?B?Yng0RFoxQU1Zc1hnK2paaDhSTUwrR2FkNWczRTlCbkhDUGVhWk5qTnZYd0Js?=
 =?utf-8?B?a0MvZlV3eUdoWXFBMUpjeDFiZm5UNFJ6eHpQaDg0aUdPa3JxMUV3UitkNHRk?=
 =?utf-8?B?OTlpQ2pzbmxMOHlhaGdHVEJhRFIyN1paZVVGZHBpcnRVZE5uajVkMUpta3Vo?=
 =?utf-8?B?L2JZWHJYblJHS0dmb2o3KzNvK2tST2xuUXF3YUljbzJMNVFMUXYrdXNQVmJW?=
 =?utf-8?B?VjRaZ1lrZ3FWM1NOdFRoVG5nR1NaTEUvMC9LUE1CVG9hdTN6WjlScGV5VnZU?=
 =?utf-8?B?Wk9IbzViNTJaSndlUmFQdG55NTRGM0h0bUdiNC8zNXduNTNkMGJzV2ZrWGxS?=
 =?utf-8?B?RDB1a25HSWs1aHhnOEdicUNWNmJMdC8zMG9nanEvalBjend3VjR0Sk43b3M5?=
 =?utf-8?B?Ykpyek43cFgyQ1piNFZGU2tFcUVwZVI2U1RCMy81eVdPcE9yMkIvV21XTE5C?=
 =?utf-8?B?WmMyTlkxd3VUVEZub3Z4UnN5aGhFdEIxUlNlQzNiR0o4a2FoZ1FEdVdrbFVu?=
 =?utf-8?B?ZTBSVWU5T2Jjby9KZDJZSTVtbUd4dHUzR3dpd0s0anpSVkpESHAzYVgwQmJz?=
 =?utf-8?B?YktGdzJyV2c2S3U2ME82YlQzMFFSQVhvVDVPd1FQMGt5NGJ5VC9RVHpLdmFD?=
 =?utf-8?B?ZjBROFYwa0hmUzRtc0s2YTBRUkJYWW55bjdhVWpCS0dlK0dGZmRuNERZRCt2?=
 =?utf-8?B?bUZZanVtbGFTVlhtRFVQTWkvUElEdkU4WTBtSkpFc1JMNmE5UGh6eFo1WjR0?=
 =?utf-8?Q?5tdzHG9Dke4D5lnA6tpOmPNNIUE0xTXwY+EYt1B6pMiD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5268d403-3df8-4396-e769-08dd501f7ad5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 13:23:49.2555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbZ24Gxc1aupGEwF/J/8x8ZU24Jvp8ofdYOneie4bUy6/mcSQ4AX9m5OeOuxQjKCZf+wns6K2SriWdEnfwN8fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD525C5379
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

On Tue Feb 18, 2025 at 5:07 PM JST, Greg KH wrote:
> On Mon, Feb 17, 2025 at 04:48:13PM +0100, Simona Vetter wrote:
>> On Mon, Feb 17, 2025 at 11:04:45PM +0900, Alexandre Courbot wrote:
>> > Hi everyone,
>> >=20
>> > This short RFC is based on top of Danilo's initial driver stub series
>> > [1] and has for goal to initiate discussions and hopefully some design
>> > decisions using the simplest subdevice of the GPU (the timer) as an
>> > example, before implementing more devices allowing the GPU
>> > initialization sequence to progress (Falcon being the logical next ste=
p
>> > so we can get the GSP rolling).
>> >=20
>> > It is kept simple and short for that purpose, and to avoid bumping int=
o
>> > a wall with much more device code because my assumptions were incorrec=
t.
>> >=20
>> > This is my first time trying to write Rust kernel code, and some of my
>> > questions below are probably due to me not understanding yet how to us=
e
>> > the core kernel interfaces. So before going further I thought it would
>> > make sense to raise the most obvious questions that came to my mind
>> > while writing this draft:
>> >=20
>> > - Where and how to store subdevices. The timer device is currently a
>> >   direct member of the GPU structure. It might work for GSP devices
>> >   which are IIUC supposed to have at least a few fixed devices require=
d
>> >   to bring the GSP up ; but as a general rule this probably won't scal=
e
>> >   as not all subdevices are present on all GPU variants, or in the sam=
e
>> >   numbers. So we will probably need to find an equivalent to the
>> >   `subdev` linked list in Nouveau.
>> >=20
>> > - BAR sharing between subdevices. Right now each subdevice gets access
>> >   to the full BAR range. I am wondering whether we could not split it
>> >   into the relevant slices for each-subdevice, and transfer ownership =
of
>> >   each slice to the device that is supposed to use it. That way each
>> >   register would have a single owner, which is arguably safer - but
>> >   maybe not as flexible as we will need down the road?
>> >=20
>> > - On a related note, since the BAR is behind a Devres its availability
>> >   must first be secured before any hardware access using try_access().
>> >   Doing this on a per-register or per-operation basis looks overkill, =
so
>> >   all methods that access the BAR take a reference to it, allowing to
>> >   call try_access() from the highest-level caller and thus reducing th=
e
>> >   number of times this needs to be performed. Doing so comes at the co=
st
>> >   of an extra argument to most subdevice methods ; but also with the
>> >   benefit that we don't need to put the BAR behind another Arc and sha=
re
>> >   it across all subdevices. I don't know which design is better here,
>> >   and input would be very welcome.
>> >=20
>> > - We will probably need sometime like a `Subdevice` trait or something
>> >   down the road, but I'll wait until we have more than one subdevice t=
o
>> >   think about it.
>>=20
>> It might make sense to go with a full-blown aux bus. Gives you a lot of
>> structures and answers to these questions, but also might be way too muc=
h.
>
> No, it's not too much, that's exactly what the auxbus code is for
> (splitting a real device into child ones where they all share the same
> physical resources.)  So good suggestion.

Dave's comments have somehow convinced me that we probably won't need to
do something as complex as I initially planned, so hopefully it won't
come to that. :) But thanks for the suggestion, I'll keep it in mind
just in case.
