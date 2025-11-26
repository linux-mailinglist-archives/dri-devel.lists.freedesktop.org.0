Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF695C8C414
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:51:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCD310E268;
	Wed, 26 Nov 2025 22:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5RYg49uV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013047.outbound.protection.outlook.com
 [40.93.201.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C1210E268;
 Wed, 26 Nov 2025 22:51:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DckkX/XG6goC47iHJgIQtxShXOF1ALgJ6bHWdxq37gUuusjd2H+zhGUlMUSdLSflqc3qcCGNYxn/DmDDsYVVQf4q9jBZd2/1F3Lzt4TT/NtrxFESz0UOxFAVN1NbwBtSvi1Be6y0ss20mkOqS5+gCahjbj0SEpaFugaxyJRGKxs1RI0pwhBEqD2tq+8a9nBP4uzbX7/KHmfL86ydyTKHvS6RUTFVhd7rPDQBntCLAJC2jK5gu3Wq1ch0oeHaHMLLsUV98jrV4GTm/9Hm5lcZJTGZ7Eum1nOaNFOvTm/Ro0L3UsIv/+3l0Hsfpk1SmvE+etBlZFBDoP7ftW37l8j0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n36z2321B/FkJt5UIHnojNIvbfb6hoeKMAdaHAVAxmA=;
 b=aA8hTXv0zZ/LlsYwhcrCZqapqSYlWSWyh6g+RskacGaQH3IcI2oxFTu983QG1gqQpwcFcwvGzptsnOcmnNcZ+D1DYfqR4adCRzJjo4QENm6EtyK9N0pTa7sOTPSFV3kZixiLDagJnynDRP4i7bdTMLAODeRzHtCDykBFZ+KjbXCU4GaRF8wTRtBud51GXgfA+KEUfgU9uXPTL5CrpkKQp4HjjgpsyZGVatzmdRUg2nHUykae61vnoJ2s8UNho4nodzNTPUWh+JvgxXU59N5UZij9wrn5iaqHEBUBrAszfRwhp/M4BgDC+IQZqd4z/C5rLkkO3es16zYF+PFXdxt9nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n36z2321B/FkJt5UIHnojNIvbfb6hoeKMAdaHAVAxmA=;
 b=5RYg49uVzjq23FvWl60R9zNcBeQ1n0GuC1r4QhqgkFmKz4ptfxsidVYCEyfW8/4OKSmwGR0C7wgGy57k+3P4lVBmNsfzyC43Lw0An6dV+deaEJyBJljMAUxUFHdIry1kGzEGlVn1atIM0cKvNCRjMM8F3IUXQRBWe5Ph+on7o84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA3PR12MB9197.namprd12.prod.outlook.com (2603:10b6:806:39e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 22:51:37 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 22:51:35 +0000
Message-ID: <0345e48f-ad99-433c-9ef5-4c0d587fe68b@amd.com>
Date: Wed, 26 Nov 2025 17:50:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 00/51][FINAL] Color Pipeline API w/ VKMS
To: Daniel Stone <daniel@fooishbar.org>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, xaver.hugl@gmail.com,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com, arthurgrillo@riseup.net
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
 <CAPj87rPoadOOTk0LbVb_VKFOOkSq0xG-PU8fRsLaaqO1kKFuDg@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAPj87rPoadOOTk0LbVb_VKFOOkSq0xG-PU8fRsLaaqO1kKFuDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0079.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::12) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA3PR12MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c57ef8b-3303-4d98-f342-08de2d3e5a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzVHdzgyWDRlNzZ6WkNLR1dxZHNPclFFYkFXWFVRWlVNNzQrWGNaOFBHV3JL?=
 =?utf-8?B?STJoVjFWdHRkMnNRUWRWeVpyc3JrSkgvVVRReHU2bVBuVjFYTDg1YWpheEVa?=
 =?utf-8?B?b2x2a1psT1pYTnkrZXRHWXlzT2xhRE1DZm9SeUkxTHArSnZwNGxlQ3pxbkQ5?=
 =?utf-8?B?Wmk1SStSYzZudk5yc29aUkpYb1JyMXkrNVFRNkxXbmJBUER5WUdxUkJMVG55?=
 =?utf-8?B?UTBBaGlrK1F4REVmbTNyNVZwWjczZ0JMOVhybU4rSUMyMUNvSkdmMWdhVzNF?=
 =?utf-8?B?VXBvREtEQ2xIejZodm1zdmhLNTlmZnQya3JPcHZHRmt0YTBSZU1UZlVTUy9V?=
 =?utf-8?B?RkZnREVjVzU4ZTdGdlpSd3lUNnk4MU9kVVN6QWZESDRURXdpaWk2YkVFNG9n?=
 =?utf-8?B?ZWhIK2tLUTNvWEE2Ky82YXk1dFoxeklqNGZMQVJBNmNlZHlZWVZIcElYeXN3?=
 =?utf-8?B?VDRPd01mSlJ6L3Y5TmZ6ZC8vcnV1VDQ2V2IyaDlWOENrZjdhOXIzMDZLUjlv?=
 =?utf-8?B?ZkMwSGo2SUFpQy9wNXNDNGlHc2N6M1BDU2RBRVRxU2lNaEVxazIzd08xdXJY?=
 =?utf-8?B?WTJSaW1kY2FaeEY1ZzJEK3FxUCtJV2loYlhPU29UV2UwMmkvcnJ1aVBpY2Fo?=
 =?utf-8?B?akY1NzBsOTlaaFpud1BSeVM3NDNCeE83TzlpbUpDckx5dWcyWTdsUmx5NlBV?=
 =?utf-8?B?RDZmMk9kTys3cFZZQnZMd1BwcU11TDQwNFJOZlZmbXY2eHpiRFVYM1UydFZI?=
 =?utf-8?B?ZGFrTEMxMXpHN2ZQQkx3L1ZOL1RuQ2FqYm1mcjJCbHI3SUJzb1Q4bzVBU3Fp?=
 =?utf-8?B?eUY5d1dHM2ZidkNkNFMwZE0wKzhOeWx1OURuVmVWWC82UWxzcHJBL0VYaUZ4?=
 =?utf-8?B?MWJBODA5cE4vOVdjV2NiQmR5TXJ2aVlVN094ZjEzcHIraWVIbDBnQlQ3UVc3?=
 =?utf-8?B?bGRHN2hTaUQzYlpyQlFva3BGUnBJSkJqYlRJWjlwSU13S25SNlBhbVd3VkNQ?=
 =?utf-8?B?ejFQb3Q1cHV3djliTUo2bDBVTWt3YjFmTkJBRGVPWTZ3SHg5Qk5KbjYyVzB1?=
 =?utf-8?B?dzZTcDYwRkFmTHRMYnNkY0lPQ0Y0MjhWbXVJZXhDVXJQMk9YanZJS05CSGdz?=
 =?utf-8?B?aTVjTnhHWldGNDRnYzJVZjJUck45WmlueStMVVZrcXlZTlV4c0lGY2Q1QWtt?=
 =?utf-8?B?djVjYnpMU1FWK1hwZzFNcVJOSGdUN2xyTzlvalV6aVI4ek5TMXprK3BqZE1K?=
 =?utf-8?B?MGg3R1owVDdVWDdNR1ZQNXp6RTVUUjFuYTBlSVVjSk8xMTBCN1h5YkJFL0x4?=
 =?utf-8?B?OFEzTENkVHd1MWljdFBBcXlCdjUzS1NCVnJyb1Rpc1VnNXl0SjFoNEF6SGdu?=
 =?utf-8?B?c3YwUDAzdUZ6TDFlb29vMU8xK0Jta2pEN2gweTU3aktLZitqWVBrSG5hQkZ3?=
 =?utf-8?B?SEpVZFFWclNYb252aWc3a0ZybHhWVjYvUDMxQk9LUEg4aVhrMXNxcTY5ak5r?=
 =?utf-8?B?RVZ2YjFrZDZDV2RHUHo5UExtS0RuVWhlbFp2NE8wZVNlRjdhQ05TSTJ4c1Mw?=
 =?utf-8?B?RVJxd2xBaWRNckhBWVh4SGUyZ1pmc0NlN2hNcG9FV0pqQ1p2dmt3MWhuMGh4?=
 =?utf-8?B?ZEZtcWtKYkpkai9yN2FVNmdXWkxucEg1NUtiZG5FYm9KRGR4ZGdqRmtoek9w?=
 =?utf-8?B?azUyVDFObTZFaXM1ZUUrK292ZDRINjdUL0dXS21WU1plVVFOVDNzbHRmMktr?=
 =?utf-8?B?d3kzeTgzTFlISFdKWU1UbjJuU2VEZjNEdW9aSkIvanBMN29icHhBRU9EZXBi?=
 =?utf-8?B?K1JBREFaK2FkMzBseXFQcU1sbDNGU1Y3MlVzaWhoaHVOUWUvbTNFMWlwZjI3?=
 =?utf-8?B?ajJweEwwK2pIZ2JsYklKVktnYndvNU11UFVwVkxDczRuUzdrbjRHKzI0SnEy?=
 =?utf-8?Q?UkKBBbuFpSe8kgpCk0JR1aZtyB/8ypTM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0ExUmVaUGJuWVJhU2s3b3J4R0U2cjhpNGxaa09JZVFZd0lsWDVybVJwWDRP?=
 =?utf-8?B?ZERWMkpwVGFQYWQvVy9sRDIwMFpZdG1TNkhWNWZwaHZlampLUnlUcmh6bERX?=
 =?utf-8?B?UmQvZGpkY0lKRlQxekJ6MGkvN2twajd3Nm5ZQVBFYVY3Q0M1bjhEYS9DNktm?=
 =?utf-8?B?d2t6N2NxU09jUmJkMHN4ZDhsZkZySmNQb3JMS3ZNSlFVNkJvTG5LTUpCN2ZQ?=
 =?utf-8?B?ZEcvaHhpenhxNXNsQlZ0SHR5ZC94aGZJMW5ldnVhR2wvT3R1NnZsdVBBK3lk?=
 =?utf-8?B?a1hqQXp0VEh3bjFlR1Bsa3E5dkVtdTduSjRKUTgwME1EbmVmd2RycSsrVEd4?=
 =?utf-8?B?eDV2TkpjR3o2RlJuTUhYR0tQaVo1cGllMUFXUDJHNlNONzdIRG5xWUo2NjEy?=
 =?utf-8?B?aWlja2Zwb1BENExjb3dLOTJPdTZNckVac3RuUW4vb1ZiRUE1bjRxSlVYTXlO?=
 =?utf-8?B?QXFrbzFYU0FuNzBRSHNvcWVtMk9YVGlDVUQ4eWM0QjBlZkxMWkFpVlh0MTUv?=
 =?utf-8?B?SURLd3BoYzFsb0RkckRkUzlIQy9xQ1EyNUw5a1ZmTThlOWFZYmxycm1lMCtk?=
 =?utf-8?B?dlpFWTF0R0Q1Y2YrNWlISmU2R3lWMVN3cUo3WTNSVnA1dTBmdW02Q1RhMmdw?=
 =?utf-8?B?bzdEdUJhWmFZRkZnQTcrU3lqQU1lc3F3MUZhaFU2cStZUmx3ekFrczF4enp4?=
 =?utf-8?B?U1F2a0MwMytwZHJpK0tVaWRuUEl3NlB2QmdUemlnVmVKclh1UStYMFZEOFhR?=
 =?utf-8?B?clhvNndWMVM4R2FyZnYraXNTaisxS2tRUG9pMkZMczNDTzBTOEJMVEJ1YzdQ?=
 =?utf-8?B?U2ViQ3dBYWIybHJ5aW9GeEFxQWpkd0ZkM0xwQXFNcjFQTEJ3bVRvREVoSWM4?=
 =?utf-8?B?TEJWQUg0V0FoRlRFL09xY3pkTlNNRlhLcEZUSkIxazJsL3NjdU83WDdWa0Qv?=
 =?utf-8?B?N29ncE0zZDFaSGE3NnJzYXdkZjFocU82cmxJd3hpc3pWVHZCQ2VzNUtHTGRO?=
 =?utf-8?B?MmwrYlJkcmcyd2tjbFcxLy9ZMnJoNks5WWcrcHpyWGtSK1VuVmhyZGRUSDR3?=
 =?utf-8?B?emh2bzdHVndsUmlBc0szbHI4OUJyTkkyTUlGeUVVaEkwSnU1TnNrTmNrTi9v?=
 =?utf-8?B?blJ2VkR5T2VSa05IbkhDUkpPRUZtWGU2ZE1OQUZsMU01WDU0bitPTXFEbmZH?=
 =?utf-8?B?cFo1YkpoMWJIZ2JZTFM3VDZOUjhoSWZubmdNYjBqVS9DaktKUmhQNk9OeGVT?=
 =?utf-8?B?Z3lFSUpNc0lIT2Q3WlVuamFGL014aXZVVGlBZVlHOUZWRkNnWjUyZ2dWMDBH?=
 =?utf-8?B?UVBZYkovVVBoSXdGa1ZXY1RwUDlQU1JiMndXWlRka1IwSE5IUytVd291dzlx?=
 =?utf-8?B?M2xOaGI0VENTbk9XblFqS2VwK0hxTEQ3blljKzMvOG8xdEthTTJjdER1Y054?=
 =?utf-8?B?ZVRET0txU2VtRUoyUnhQbXZoL2NFMnBJOXMxclMyQU94U0RzRDVQWEozNEU2?=
 =?utf-8?B?UlY1YWltM1hvemx6c21GVXZ0dXJ3endoRG54NDlJd3RCN29icFZLcy9sYWdn?=
 =?utf-8?B?SmJ0dTVhak96UmhQaTFXU0ZOK3hZK09mS0x2d3dYbG1Mc3NIeVd3R3hKYnJR?=
 =?utf-8?B?ZW4wYzZCOVE4MjdIeTdnODdGK3doVTlqUmpXQy9jVy9GK2Q2TWtUMzYzdG1P?=
 =?utf-8?B?ZUw4Zkh1RUlyZDFnaUlaeHJZVUNES2NHNTJvUkdtRExFdjVaTUoxZUh6am4r?=
 =?utf-8?B?UDc2MkZraFNGS0tyeDJiWFMyK0xHQkhETXVqOE92K3h2OGMwcEtSSE9scGZ0?=
 =?utf-8?B?UHRFM2FHOFFTWGZpVzVGdFF1NjQ5UmM0UEdxK2Z2YkVuN2loM0RzRzNsYkxz?=
 =?utf-8?B?LzBxempBNUJwbHI1bWxEazN1aFFJb2JBNGt0Skk4MGs0T2pHUjNCOHdEU0dx?=
 =?utf-8?B?ZGVTc01rU1JHVGFwOG9Nd0dUYTVKUkphdlFuWW5iNGN4MDZrTEVoZVg0OGJQ?=
 =?utf-8?B?NmkzdnRtdnpwem9kS1FQN2VnL21pb2UxVjgvSDVYcGVXdTJFVjFnWlV6NEF6?=
 =?utf-8?B?RXJwODhJY1dIVmx5ZEowZlA3anQxYVl3VXVzRzFYZlg3cm9KSlRDUXY0TURp?=
 =?utf-8?Q?rzRfTzK1rh/X2gK0UL/F9XFOx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c57ef8b-3303-4d98-f342-08de2d3e5a08
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 22:51:35.7932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skfblhk5t5voUQg4Vwk5i4yYTWkGPz64aDyE+izY5zSbPwaYe0YCMkEn0zqHI/aRv49WcOrmb98nlRp60RXThw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9197
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



On 2025-11-26 06:07, Daniel Stone wrote:
> Hi,
> 
> On Thu, 20 Nov 2025 at 20:13, Harry Wentland <harry.wentland@amd.com> wrote:
>> On 2025-11-14 19:01, Alex Hung wrote:
>>> Both kernel patches and IGT patches are reviewed and the API is stable
>>> for a few revisions. Does anyone have concerns if kernel and IGT patches
>>> are to be merged?
>>
>> Xaver, are the kwin patches ready to be merged?
> 
> The Weston patches are ready - they have been for some time now - and
> will be merged as soon as this series is.
> 

Sweet. Simon just merged this.

> It would've been nice if we could have had an MTK implementation to go
> with AMD and VKMS, but that's still being worked on. I'd expect to see
> that and another implementation early next year though, plus whatever
> happens with Intel's.
> 

Looking forward to that. Thanks for the update.

Harry

> Cheers,
> Daniel

