Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0756A76C01
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 18:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468EB10E151;
	Mon, 31 Mar 2025 16:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G3VvyeS2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08DD89F01;
 Mon, 31 Mar 2025 16:34:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnhWVs1545+km0e5mcFSQMVm/dJdXTGTlBuq9vYEd9xzl8iLCO3YLKg08fCi0VKrkS0OPVWgkQ8kBAi9xUb0+YCA1iqoSkBQgXn1k2WmqRLc7a4iPNO3g9yAFvAOKKFXypeFBwor7JbhXXxSUs8zhHGDvQG0P+jx61ncnrE0BkPAJZ0ILG73cd+AESZbXdIt9s/3zkzdyvgOkq3sOFDol6HWzBcE0K8X+Y6fZJgF6p/Jn97F5dS20tczok5P2gRaBgPqQipZlHW6TzvTSIvyJXqXSt2qMS0XlzqKqcIJ2ic1CLRsm2aKX4fmqDz/V/v7pGXX1CdXQHr2gbgcwSeTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYfaSnntdkhmoFBbUFT+pP7y4D2l87OGDY/O8Pgllek=;
 b=Um7wJqkwmyg1y5mgDqOY+xOArWlrUUF6rTYttOIn/7QX1lbzCfstYD1U1Or/M/b4Fg5OtUUGqsCVBkRE86TIveD96sRSKVRhrR92fQbnHigQXXyBuS6jVaiNSdhMAX//fifISQLofZWNULEszuC06H+tPaKdDwXqw3U6m2jUKqrINe0M0gX/VbmWUznz7SnZKNKgERd2Iha7ARUX3M0snJeUNQ3u+cOZCVGol6Xzzi4Sdlxf7PZKHmiMy/5avXcTARznRqAyYkOwMo1gH56spLICFaMzoSamMN3PM55RlCm0VhLgwQ0WlvqMRL0wJLqf0Fo278Iwm0hnYEVPL6v0yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYfaSnntdkhmoFBbUFT+pP7y4D2l87OGDY/O8Pgllek=;
 b=G3VvyeS2FQlEQCDVbUchpl56hS8rmtVezXwG1ZcQYuardVf6TsZ+ResQUA2s+iov6jsSeNYBpiTqbNzoxieU5DZjKyGkbOjgYMVQkrvrdLcFjbiKRSLFsEStWis8cCxEIxSr2w3lwQ3JB9r5kjzCzw002w418WQ5ESlHrrniD/w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB5653.namprd12.prod.outlook.com (2603:10b6:510:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 16:34:19 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 16:34:19 +0000
Message-ID: <e6bac4d3-d445-48d6-8121-39895a09ccff@amd.com>
Date: Mon, 31 Mar 2025 10:34:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Shengyu Qu <wiagn233@outlook.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
 <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <TYCPR01MB843722301025CE5047BCFA2898AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0159.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::19) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ba9e59-301c-4ba1-6828-08dd7071e2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHdhRDJYVVRyU3NLUVV2Ylk5RU9JOWIySlhjczJDVTI1WE81K0U4NnpTTjdX?=
 =?utf-8?B?L1RmYTE2dHdrMEhDaThvbElwRk1Kc3hKc1h6ZENETnNDNDQ0SzNzeWc5eTc4?=
 =?utf-8?B?WFFsRTJZZzY1ZUtGb1Jtdm4wYkExKytMaGt6eDQ0VVhwNDZZSDh4aGZqMGc0?=
 =?utf-8?B?akNJVjJsT1RjR09mT2lkK3BxcmFDVEJQcnVSNE0vU2p0am5peFVqNHZQZGVl?=
 =?utf-8?B?SHdhZzVwa25jYW94cVhPbzB6YllwYURJWGsybitDSjlFdlh4OFJURkQvZWtT?=
 =?utf-8?B?NWJOajZScWFZalJXRm5ZUE1uODdEekZ2eHNRQmh3UVJpbnFXajFSTldKTUxM?=
 =?utf-8?B?MjlxM1p0MG1zd2cwNmRvckdTOVVKME9yV0xwZFUwS0NhUTVXaHhrT1JLbnBO?=
 =?utf-8?B?ckhicUVFbnFEekdscHRBN2Fsd1ZHS2oyelJHT2ZlYnFGYndCYzNVZmRjS0ZH?=
 =?utf-8?B?UjFaNFBpUFdlWnlCZFdkU2xIazhDNlM0RXdtb2hBZkVoT0Z4ZUhxckFuT1Nu?=
 =?utf-8?B?TDU0dnd6aDNRODVKUXNqdG5TNUk4T2xSaURsR0lZV1ArdTZBZjlkd25QWm9M?=
 =?utf-8?B?SmtPdGVhV09pQm5DM2xwYXNBSlJVR2xDODd0RFdrZWNXOWZrTmQvUmFVbkdy?=
 =?utf-8?B?ZWlra3NGbkJxK0hSRnUydG8rRDNMRm5vaXBiaVplY2R6dC9tQmZuZU11aXpa?=
 =?utf-8?B?c1Vqa0NUUXBEcW1CYis4Mk9FY1oxVkU3T3lnNnVvTFBSeC9pNXNGbFdMek10?=
 =?utf-8?B?aW9iVTRuZUJ4Sk0vS2FhTGt0SzQ5SGJkZFNGUFU0Q0NWY2lOQksrTVI2cHpz?=
 =?utf-8?B?YjBoUnlTK2ZRZDZleUpCWi9TdVVsUG5XWGg0dUlCMlpVQi9OR3AvNG9wYnV5?=
 =?utf-8?B?U0YzVVdFS1lVSkMxSG1nb09hWHFPWTE2bTJsbCt5ZGl4S1dUd1BMZy9XNk0v?=
 =?utf-8?B?Z3V5b1NUcHhHUDBrWDMzUnByeXpxcks2RmRZVWcraFh5bXNKcklqTVFDWFgv?=
 =?utf-8?B?aFkxTTRKaEE3R2YyYTRsM1QvS01UWEJQcWluckQvQ3BZcUZwVllHRHlIUGV5?=
 =?utf-8?B?RVNjWldBSEsyN09JeENHOEdYRmhDUzQ1NnBXQWszbm5xSkJKN1dPNlRGUzNn?=
 =?utf-8?B?bnZoY09UYW81bUhKQnN2UlRIc0s2dTFOLytYNS82UGt0WDJOS05YSjRKNk4v?=
 =?utf-8?B?dlJwSzdIWXl1OUJUdldob0dpMlNKeGdUUmpPZDhhQndRa3hmdWhmUytUejhW?=
 =?utf-8?B?V2w4c3VlaXVpNE9xSXo2NUtoVUp5MXhrTVF5N01YdzhreHUxMGJPcHhyZjRL?=
 =?utf-8?B?QzBHYW92RkZJeTVjOGR0Y0gvdGxjV2VqWkZwUjNSeTRPZ2doNnNYdTlOSE1z?=
 =?utf-8?B?NjlsTng5QW43MHdTdGNrWERPcU1NNE5senVwY0ExeTZpNGUvU0FnbGdNTERG?=
 =?utf-8?B?SDlJb3JmWHU0VTdqQW1RZkNVQ0tMOWVzdS9laXJZS1AxdUZTdG9waFZSckZB?=
 =?utf-8?B?Qk5yQ0RYZExJRlhiQ1ZhSlFXM3ZGdkFGeUl1WUFUNjRkR1E2aUNwdkFMZ2tp?=
 =?utf-8?B?SElJdlB6WjdYNkFHcVM1REx3NExQcExybit2RzdBOGFURTJiWVpsRWQ3NTNx?=
 =?utf-8?B?MHQweEI5MXc5WTN2SzkvdEZTTnNKK0lkOEZib2ZKRDlWZ2JWbm9VNHU4YnNo?=
 =?utf-8?B?RDBWWmFPNjdpem4weGxPbURxTkluSXBZS2VscWR4em1Zc1EwNWxlTzgyT1pv?=
 =?utf-8?B?TkxlK0plU1N3MFo0MklBK0xnQmhqUm9OV1JvTUN1RHJTd3EycXlFY0ZWNi84?=
 =?utf-8?B?MGxHZHhtQ043M2RxQllMVkZrN1ZOTjk1aEM1QnhOaEllakZaaGlQc1pFOS83?=
 =?utf-8?B?VE5KWnVnOVdUUkRldzIzTWxOeGNaZGY0c1E1VHhmUGdzdEdEaEEvTkV3N2tm?=
 =?utf-8?Q?pIIFo948HZU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHp6Vjh2MUt0blZRU25yMEsyLzhIQ2RtaE9FWXBmNEFDSGlmM2piVXo1N0xH?=
 =?utf-8?B?VHErNGlvZHh6Y3k0U2p5RmZLbmt2SzFCdkozV3k2VVpvMDB1cFYwYXRETFNj?=
 =?utf-8?B?V01PTWFwb09oS2dDamkrZXQzUFhXMVlCNzg0SEQzMURpb0VCVmpkS2ZiZm95?=
 =?utf-8?B?ckJEcmZsTG12WDNSb3NacmhKNmJSZDBQVmxFYnBsWStabis3MURyTk8wa3A5?=
 =?utf-8?B?QjY3Vy9DVmFJNmMzZVNlWkNMK3QyK1pFdWdrczc2bnZrd1pYS3RDaVRsQlEv?=
 =?utf-8?B?ejdXUFlNSlhXSVJHdzNzQXdFNU9mZnlwZkhsUE8zNWlCbGlpdzBMR3g3dW84?=
 =?utf-8?B?RnFvRERQUzhvZWhXc2ZlaGI1MlhDTjA5amhtbGpjK3N6bks4SDNqdVg4MmVr?=
 =?utf-8?B?NExiMzBYYXA3cmQvZU1UOTJuWmpKbm4xY1JmOURGQ2xkQ2daNndRSGpjVFNN?=
 =?utf-8?B?Rk14VG8vejRPc2ZyWmlZczNNcXFIYXpoYUpnRzg3Tm5wNUQ2ZndLVjBoZDV6?=
 =?utf-8?B?Mkpmdkd3M1J0S0ZWVVZ0NFk3N3BMR0VVcUNVaGh5cC9rTVgwVkpiYklXVzQ5?=
 =?utf-8?B?ay9kTXR3eHBaUFVqRktuWkRqcy9GSlRFMnE2M3R5S0drWllweGV6YkRTTUVL?=
 =?utf-8?B?dDM0aXB4YnJKL0FpTmRJdE55SGJWZlcxQ3BOcDJWdVErMjdhaGl6Z05CV2hQ?=
 =?utf-8?B?ZVBPenY3aWo5MEZFdUY0VldabHgvWnlRSG5OSitPbk8vdkZqQ0ZqankwT2RV?=
 =?utf-8?B?ZElZNXVSYncydTVTeXhTSG9YUU5ZZkNsMlYrN0RkYlpPY2lVZEFvOXRiK2lx?=
 =?utf-8?B?LzFEQldnSTNhNUhkVm0rTUV4bThiSGxnVzdqakVlZUhRTDBVUGdVN3dDMjVa?=
 =?utf-8?B?d3dFSDhnTDdUQWt5UDBVa1VsaWxXWE0xRTR5Q0RwWHYzdkQvODdzQWNrZVFB?=
 =?utf-8?B?bWtjaHM0T2JLY0VscGtlRGRweElUT1pnV2Z6Z1dESlpHZSs5dm9NajlkQ0xN?=
 =?utf-8?B?VzJ5WXZJWUxjVE9DTEJvUEhjOGg5eWNTdlE4V2tLM2ZwWUNvSStLZ3lpNnkw?=
 =?utf-8?B?b0RDVkttNjhhYjIzNmgwVDlaV2VEazhtQnovOHozMHRwTjBoUkswNjhKNVUx?=
 =?utf-8?B?ZUxZSWgrS1pYVVJFKzVJNHRhYXlLRlNKclVYL1ZVdXpnNWo3NlJUSEZRcGRX?=
 =?utf-8?B?KzEySGNLZThsTXpoaDRHOWYwVUpwVDRFdHNUT2ZQdUg0UFpvai8vTzdDMXV0?=
 =?utf-8?B?bGxiRC9Pa2RFR1dBb0NlU0ZiYzVoOGhiSTJmbHJNWlJYV1krUk5NSlQ1aDlX?=
 =?utf-8?B?NHl6VkY1b0pGTW82QTJMV3pUVVd2V09ZT05SWVhrcDBSZlRnbEdDR2IxZ3pM?=
 =?utf-8?B?Z0dNRmlkTy8rYy93OXBrOVhCYmRybnhCdkF2dkVTTzhRY3hxTlppZWs1UlJ2?=
 =?utf-8?B?M2Y2SmxxZDZ4V1EvcEU0M3JSVmwvT2EvM2xEdnJyb2NmeWkxUXoya1EzOGI2?=
 =?utf-8?B?Q21LWHI3L0VoazJpRWlMR1N2RFhUb2N4M1RvTXdBMDN0MzJFRHlqSXNlV3Bw?=
 =?utf-8?B?Uk5FM01hc1dsVGdTd3p6b3BXZDR1cHpvODRwNjVhT0ViV3ZSdlNjcjY0M2hZ?=
 =?utf-8?B?RWorajN1bms0MnJidVU3N1QzaEQvOTNlNGRCWVBRZU1qTXZsYjZMemdUNHA5?=
 =?utf-8?B?Y3JidVJkWE1qSVNlRDlhY2s4a3ZadUgxZUI2RTYxQTZ0allBOTNsVG9xbU1t?=
 =?utf-8?B?UHFRNTB6TVhyZ0EvSS96VUlRcVpIRGo4U3ROMzJsL0ZOekwvYVpTdEVQTlp2?=
 =?utf-8?B?S2gxTDcrZWtzQ0k2MVFlVko3NzZ0ajNLRTFlN2hzWm16endTa3o4dTBqZkl6?=
 =?utf-8?B?aVA1K1FVTTBrYnNtNlhEWGwrdmdsbXFYQ3RRUW9PN3o2VHBnbmVPOGNRaXhS?=
 =?utf-8?B?TVBBK3ovWEYyc08vQ2Y1Uk0zTk40STR1bHF6TjUxbmJVNzZYdUV4d0czbkds?=
 =?utf-8?B?OVBkZFlEVS9Jd000SmlkM0MvNGlLeFhQNkloMEhaQ0plbHJrbXdUaFdwN0F2?=
 =?utf-8?B?bldGRXhHdWhSVTBPaVBVajhpbmF0KzZtUXBqM3l5YlJrakxUUFlXMk1kbEN4?=
 =?utf-8?Q?XRzJsEiCxnn+CtHfGWcfe34xX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ba9e59-301c-4ba1-6828-08dd7071e2bd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:34:19.6190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4P9R0pdGWXYLmSS8a0uxpR4968ZhsnZnPfe6C2AwHkKIqk1yqZKq15kROVcSRBL/ILbq77MNsGeCh2Shu8YgNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5653
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



On 3/31/25 10:31, Shengyu Qu wrote:
> Sorry for vague expression. I mean that I think we shouldn't register 
> DRM_PLANE_TYPE_CURSOR in the driver, as we don't have actual hardware 
> support.

This is not true. AMD has hardware cursor support.

> 
> 在 2025/4/1 0:26, Alex Hung 写道:
>>
>>
>> On 3/31/25 10:12, Shengyu Qu wrote:
>>> So currently we have to hope the compositor won't use 
>>> DRM_PLANE_TYPE_CURSOR planes at all.... Why do we still register 
>>> DRM_PLANE_TYPE_CURSOR in the driver?
>>
>> I am not sure what your question is. A compositor can choose or skip 
>> any hardware features, but this discussion is out of the scope.
>>
>>>
>>> 在 2025/4/1 0:06, Alex Hung 写道:
>>>>
>>>>
>>>> On 3/31/25 09:43, Shengyu Qu wrote:
>>>>> Hi,
>>>>>
>>>>> Thanks for reply. So currently we have to apply color conversion on 
>>>>> the background plane of the cursor to do some color space 
>>>>> conversion. What would happen if cursor and background plane needs 
>>>>> different conversion config? Or we just give the cursor a dedicated 
>>>>> plane?
>>>>
>>>> This scenario is not supported on AMD hardware, but software cursors 
>>>> on other plane types won't be affected.
>>>>
>>>>>
>>>>> Best regards,
>>>>> Shengyu
>>>>>
>>>>> 在 2025/3/31 22:28, Alex Hung 写道:
>>>>>>
>>>>>>
>>>>>> On 3/30/25 06:59, Shengyu Qu wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Do we really need to disable cursor plane color pipeline support? 
>>>>>>> I don't think we need to disable that if it is supported, since 
>>>>>>> there might be some user-defined colored cursor icon.
>>>>>>
>>>>>> This patch applies to AMD hardware only: https:// 
>>>>>> elixir.bootlin.com/ linux/v6.13/source/Documentation/gpu/amdgpu/ 
>>>>>> display/mpo- overview.rst#L101
>>>>>>
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Shengyu
>>>>>>>
>>>>>>> For some unknown reason, seems my mail is not shown in the mail 
>>>>>>> list archive, so I resent it.
>>>>>>>
>>>>>>> 在 2025/3/27 7:47, Alex Hung 写道:
>>>>>>>> cursor plane does not need to have color pipeline.
>>>>>>>>
>>>>>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>>>>>> ---
>>>>>>>> v7:
>>>>>>>>   - Add a commit messages
>>>>>>>>
>>>>>>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
>>>>>>>>   1 file changed, 3 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/ 
>>>>>>>> amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/ 
>>>>>>>> amdgpu_dm_plane.c
>>>>>>>> index 9632b8b73e7e..b5b9b0b5da63 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>>>>>> @@ -1792,6 +1792,9 @@ dm_plane_init_colorops(struct drm_plane 
>>>>>>>> *plane)
>>>>>>>>       struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
>>>>>>>>       int len = 0;
>>>>>>>> +    if (plane->type == DRM_PLANE_TYPE_CURSOR)
>>>>>>>> +        return 0;
>>>>>>>> +
>>>>>>>>       /* Create COLOR_PIPELINE property and attach */
>>>>>>>>       drm_plane_create_color_pipeline_property(plane, pipelines, 
>>>>>>>> len);
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

