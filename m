Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EFD64C56D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 10:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7FF10E386;
	Wed, 14 Dec 2022 09:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2099.outbound.protection.outlook.com [40.107.21.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB8D710E38D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 09:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxiKnGGr0d9Kp/ClDdlqO2dEhbZZKlld+2AkokD/MEAUfGl5Pa85zq/DsbjoYgNMJljqlLOAWQyH0BKLvcdAXFxPxL6tg5dSNw1m7mK9/X683XIatDisHl8fHV1qGjCJ8iJO3/E3hzAqhZsI5QRcwjP7TVSuQGtVTK0WImni1aX9TXK7gxCeiu2MhKM+jAbOwO9qO/3Yd8SKgxC7gJxrOUAOgyWVFoXqBreBbyTR5AuiV+v3pxypM0xX68cWA2pp0Ydvld/+RqEH47bKG7iIjzLwDpauc6PpiO5NkdxsTk45Rat87iAjpuy1syjjZu2O15BB7V93ue8p4wQ6b2w2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iNrHj4Voe7HqJtxjgD5iZ9aSKWlFkvKJ+BILRRB/1o=;
 b=BugOWQgGWQnHW90itiaz9Ayrpud0mR/YbZjtC4/c4PldtuGhjYvVohDusIOho2h02DEEhO+dICRipB86TmS/DQWqEAM5nHKQyJ+G+1m76uy6bp3w9yM8B70e6Y8xn1vFmW1AQJx3unY7njXcDh1Y1FwcQPQUDTVe7GTipZ7wixWTBtp1lv1wx0tuKmJ5pckWi8oKzTdpk60YX0c185F2N3+cycyLatxjQz7p3Za6JyaRJFcCnjrBobPedKc9etGHCyRMs8hFLw1bE4z0agpTH3yfPzR14h+EfMgGrEaZT6t/A/oBpF06ea5Ab6ayNVSXGDj7iRedzbip3HVqz/Acng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iNrHj4Voe7HqJtxjgD5iZ9aSKWlFkvKJ+BILRRB/1o=;
 b=nd4pb4GMfheg60d+QwvP3cmjVuyI98qJVi4mFxojBuEYeHFXFpLecgIAVfdkLv8M3lPvNZhnS3nqus6k31X4jX8BqloxIhN5Ah/YkNJ2ITGuWPxEQwYWhC/jISKMJ7svvmqxXTM54ZwUKgjjYAiyizGfOFIKbKAWe8wbDQHRyFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM0PR10MB3171.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 09:01:52 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:01:52 +0000
Message-ID: <a676a8af-3188-28ba-9433-28976dcb529b@kontron.de>
Date: Wed, 14 Dec 2022 10:01:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v10 1/2] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20221212145745.15387-1-jagan@amarulasolutions.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20221212145745.15387-1-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE0P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::18) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM0PR10MB3171:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d0d438-f717-480e-a70e-08daddb1d7b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ji4obk9i70iBUu+WGcy1Ij8pZxdNgghBhXOXUgnSgQo4PTqHFDmoo5Dp4mvI+7JkAzEyL3f/wKrlSGnEfoSUEtt/BMOlYfhHFWm2fVoSMbmc8vlQMZM8r+hUvNp80O5xqSBTdwJZ7uyF4tlTpvNzfemjtAf/jQoqCYlHE/RkRpXF9l9sAWLQ22Qam6wjVVOidpR2xcHKeDJ9MhepgMo8M0dB3ZV1EAQWu/Er08yOBoCzLB22Rhg7zXSHwzF8baIoiGX3JA6JYFNCcZhXkNz70czbZEFN/4Y9S6db/miFCRMP30T3h/DcwMkEf1wVGg3RevLVmk35cyrRzRRFkelnjn/C/kjhksDQrVsGxJeQrdpwUsh2C+abjfZyuhvAPEKnx3Wdm7M2wHe0hogSo0/u80gptLcJZWLIoXiC6dtMpfcpKoTvY1lrp6cwZLXX9QRiJFJQphqZyu29NoQrBgZg//91rfHKu3xfPFpl78wTuQNXCWcs2HduwdufzcuOlE2dGpMi05mEhoivAQQirQM/uJe5/kZpkZfq0M5dq2nRk8fASQL8xFFuH0ZM4iJiCxsb5pvfPr8c2+0OO2tXujcTYU2T7AMMEQKC417hSH/ssKvhorWC16NeLOptU3Yvr3X7xrhGMsRgNkDQSyePNnut3RlYRVbdv33kIo8ljsL60C8v97Rh9yHCZULuiidvXZZVzxkGKsLgDb4ui8+0OupgNg0kbLCJCyhQT27NhI7GNqg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(36756003)(31696002)(86362001)(83380400001)(316002)(54906003)(110136005)(478600001)(6666004)(6486002)(7416002)(44832011)(4744005)(2906002)(5660300002)(4326008)(8676002)(66556008)(66476007)(8936002)(66946007)(41300700001)(38100700002)(186003)(6512007)(53546011)(6506007)(2616005)(66574015)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkgxeGk3L0IvSEhZKzk1VzZrUUVPaVRGdFZFV3d4ZFprQ240TjBlVmVveEpw?=
 =?utf-8?B?ektQbDJCT1NrdVlmNEhwSFp5TjdvNEtTVGpDUmMxWi9MenpJYzhFMVZzRzNY?=
 =?utf-8?B?SlRSSW5wcHQ1NFlLL0dVZXhoNmZhTkc4ZmV2ZGdML1E1bFVGWWpDTkJCSFIz?=
 =?utf-8?B?c2w2TzhubFFSWnFsNWU3MnBhRWhqaVNEOWFjc2lGRVUraEt5TVJkS1VZU1Rr?=
 =?utf-8?B?UXNXRDJ4RW5vOTB2Y21xMksxMmpadmNMTGd5NnBxQ3N5RVd4NFA2ZW5VRDRV?=
 =?utf-8?B?MHZsaGtXNFBNcEN2VDJ6RExHOXk1VTE3c0Z1SDdyY3BMbWtDTDBFTDQ2T0U1?=
 =?utf-8?B?bUtDZ0JOVUFkQTRhcHF0OW5uOWVBck5RV01YVEYycTJkTHFTRDNtNGQwRThK?=
 =?utf-8?B?VExBVUhBd3pzNmZBbWlyb0x3TXJxS1h3VVRVaDBOVVpYWlN1SUxQcGdJcEVu?=
 =?utf-8?B?NnhodW1hT0ZZZnZqQWVjM1BkWFhiME1kcWxvZ3dUZFlNL3AyRGFMbzgxNjUw?=
 =?utf-8?B?eFpWQTFEamtXK3pJUklza09pS090OTdaM3pOUG0rMGdDR1A2WERPYnRISXpt?=
 =?utf-8?B?dUlpYU01MEg0V0dxQ1VqRzlzbTU4WlR1b3RkN3hxTkJkUVV4NnZpK2J3M3E5?=
 =?utf-8?B?RG9mRlNzdWpLMFR0enR6MnNVYmVWRkJDR1ViajZIS0tSVHVRQ3phbkRFYURv?=
 =?utf-8?B?UE1qbjljL2cyRlIxQjZuUnBvTG9sQTQ5VkRpUEJoOVlBSit4OHFzemlxNXVr?=
 =?utf-8?B?Q0NtaXBMbHZpY0tReCs2K0xyRkF1OEtCSXNib1VIR3ZDNUJuaWV3UENuU0k2?=
 =?utf-8?B?NkVVNVhkTS9teUFzVmhxV3lNOGFiQ2VtNndEWkxEYlFVODB4b0Q0LzNJd1A2?=
 =?utf-8?B?R2prSG1yQmxvSmJreStMT000eEpadTNTNzA5SjFOVDZOMldhNDRuWm9CUThy?=
 =?utf-8?B?LzZRNldqZmZOczJCUHF0SExBYWtDYUUxRE1zLzlCR2hBbTg3NStSd2syYkk5?=
 =?utf-8?B?TWp4ZHhwUjBXbU9rOFN6Z29YWDYrVWM0Q3h1V05seGhCTnIyU1EwVzBHQzRX?=
 =?utf-8?B?VGlSWnlEbG1LNENkbVQwTFNlNmNoak1IdFBtUlZxS1BYdWxDb2svR284d24z?=
 =?utf-8?B?NUlEZGhYd1FkVGFVS0hMQVNLM2dia3lCWEtBejRKS0JGdEszNnZ2VDVHSzVR?=
 =?utf-8?B?R3ZWQW5oMXdJc2o2Q1Q5SHd0SzlGZGVoZjNPdUkrZ2I2QVVoc1ZzOWZJdHhP?=
 =?utf-8?B?UjFqeUNGWlFRVFpTcnNmaWFVV29OVW95M29RNUFOQXZPZUVxOTR3M0FUdTE1?=
 =?utf-8?B?ekg3Z3JGR2E1eHpPTktHVnN5WVA0dmEweXhBMXE1UDFVWUJOZTVIZlNaQzN2?=
 =?utf-8?B?WFJydUZxUS9HVXJHUFZSSHo3U2hxWUtxYW16VEhrSHo3ckR3Nm85Vnc2TVEx?=
 =?utf-8?B?V3kwbWZjaUs0YVBFQU5mVHVGRGwxR1k3RnhvQit4RFBESzVyTy9wU1VlOFJ5?=
 =?utf-8?B?VkJtU2xLdXBiRnVMSlg2U0prWHJGczZxNG1kb1BKNng0dDJmcGFxWjJwclRW?=
 =?utf-8?B?MkRGQm1RZXo5bDRmbTNjR2pNRmtCaHgrcGVUYWFiVDFBMVdta0RlQUVZdm5R?=
 =?utf-8?B?M2ZTZVhQNDErQmdsQ0JqNHlsTDBDU1FNWEJWQ3QwcFpsZHV6ZkpDNlVWclk5?=
 =?utf-8?B?R1BFZ040NjFpOGZ3cXhNUUxxS29lbWY0QXI5ODRrSzViZ1NnQ1B0SThnNFY1?=
 =?utf-8?B?MXp0TEJJQThVVGtYZnNxREdFYkQzSXJYZ3ZGaEwrZ0tqTk1IRnlTMDBFazh4?=
 =?utf-8?B?MENyVUh2QnpBeSs5QnBCM0pxSGJReFV1d25Gc0RKMDlTd01YYjg0NkNiTml3?=
 =?utf-8?B?NzFLZlFZa09TalQzTDRMdFNYTFE1SDQyVDhrUFU0Ty9XbGtEanAzZVNhYlBO?=
 =?utf-8?B?dURRTnB4U29VV3hJUHViZWRpb2RKc2FRL3VvQXNJNHlzbnBzWXZ1WEZGYWRY?=
 =?utf-8?B?UVBSQSs5ckw2dXoyWXZzcXlyNjAvMk9WMWV1U0R1Uko1RkpkczJVaXNzd25z?=
 =?utf-8?B?N3FVbXJVMmFDTXJIOERjYlF2dTNvNXovNHA5OVpnNDhLbGsxdEp1ZUJ5THVz?=
 =?utf-8?B?QXErc1lKL2FacnYvMys3ZkFFT2dwTHpMVHA4SitzOU82U2tBbWFEYlB0ZHpV?=
 =?utf-8?Q?ppTZ9neBadRnHJ/HPh0iEgwRXxCvXZwQYdBKicagh0KJ?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d0d438-f717-480e-a70e-08daddb1d7b1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:01:52.5134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExcyJlkNBnb1KyXlkR+FDXeWe+lxnNeMPLQI3AoYgjTvsIcynvB6AsXB1L3FtDXFMpLjMu2i/HT/KSAVjEYMOG2zl7EetszIQTrbJ9tan+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3171
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Boichat <drinkcat@chromium.org>,
 =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12.12.22 15:57, Jagan Teki wrote:
> HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> 0 = Enable and 1 = Disable.
> 
> The logic for checking these mode flags was correct before
> the MIPI_DSI*_NO_* mode flag conversion.
> 
> This patch is trying to fix this MIPI_DSI*_NO_* mode flags handling
> Exynos DSI host and update the mode_flags in relevant panel drivers.
> 
> Fixes: <0f3b68b66a6d> ("drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling
> features")
> Reviewed-by: Marek Vasut <marex@denx.de>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> Reported-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
