Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO7NL1GAc2ncwwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:06:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB49776A6B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 15:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F8A10EAF5;
	Fri, 23 Jan 2026 14:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MzgEFntO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012069.outbound.protection.outlook.com [40.107.209.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422C210EAF5;
 Fri, 23 Jan 2026 14:06:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q/ywHBEfSdQQj2Vg5TP9otDWgb/RfELzzCW6XSsEWqEB59rIB/wkb03uZfvLyR36vn1p9Rg6/LxIZ0gWY1OliMObRjLTSPyUzFqCPDPljH/zfNOAT36BWABR3fbeTfQYd3QxmmlB2RkG5o8aX6E95AVRlsUL2QKg1J9+7C/7WxIY84Do7DTleT3Q6urKOHspI8+9LSodagJkbsJq6Wj1e4svqXOupqizJLWq2Ftt3yGdgWy+tchAqTo4/L0AytaueV8+m/xFnef8EC1JOq+EltStd8LC72kAHeBzgDt9AkGjpmvyFCXPsAINzFiyABQWj7qpUBQtNYJxWKQSoCguWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlKuxb3NVr5N4JuhhqShQZTN9k0DWMdm3MfXujuNGuM=;
 b=P/Pqho8Zw0Y9DobvuNqnSPtrk4XETK95cvzfTJayyn+ubNyzlYr4/LCqGg/W8ku4CbMjLqqIyCciWSkU2gonUztZuxt/DHP+/ri8xe/mWZguprrxJW2S0RYjL19GaVs6xr3QIB21W4Q7x0WhqJj6VT0iavEkkVql34uFhRJLqlQDNMrO7oIN+TGQI61MuqVmg3WOc6v0T5CbeX7PsWPjyfdEmt2xtV4e20RJ98Nw6hz78GVk8C/eEn/z0omyW9eplabRnNBSlLa/J/wagU/k8BdZ8ilHZWaG3Sm2Pg2Qd06gvALk314wrub3kRaolF93AfGhamDBSSE90kBrEN53WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlKuxb3NVr5N4JuhhqShQZTN9k0DWMdm3MfXujuNGuM=;
 b=MzgEFntORPzrwopy31RdRqZg2TlfG7UDHuQfFxzMWpj/ygejmEafDA+ZU5JjupMettkHvyaYhS0KEJE1xVcHxyy0HHaEPVapnKn4h+V0h50M07WpfJqow+i5OMvSh+hRWcU7oX6vFJDuZXkG21xEAo9gJDqrowIfoTIRLliq8uM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB8843.namprd12.prod.outlook.com (2603:10b6:806:379::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:06:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 14:06:00 +0000
Message-ID: <08594997-f0df-4996-a387-0276aa6c798d@amd.com>
Date: Fri, 23 Jan 2026 15:05:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] drm/amdgpu: remove gart_window_lock usage from
 gmc v12_1
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260122170218.3077-1-pierre-eric.pelloux-prayer@amd.com>
 <20260122170218.3077-2-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260122170218.3077-2-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0389.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da0818a-0eda-4582-84e5-08de5a88892f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXNPOHVqZmZlQVMwdGk4SVZOQ21NYzBKb1NFdFBuSUFjY1JMRDFDbnV6QVVi?=
 =?utf-8?B?aGg4NXJ4UmV1clJyd3hKdnVJdVBaR2ZqV05Kbi9ERDZhVmo3UkJGZGErQkdi?=
 =?utf-8?B?T1BUclZNanQ5Ri9SR1A4R0E0c0JqUWtFdnRac3pMcGROcVhsY1hyZmNDa2ZO?=
 =?utf-8?B?ZGRlZHFsclpUcnNKbGFqdGV6UTlEd1hOa205aUJQby9lOS8rMkxMZ3FZd3hJ?=
 =?utf-8?B?NVI0K1JnbThLaGFhczdCaTNINHZkbUlMOFkvOGFWRUw3SVE1d0FWMjJRcGFY?=
 =?utf-8?B?aVV0VHJOdS9WTFB4ZkJOTTh5aTVOYXMrR3VNTjYvd25DY1BUTjVNMmdNVm5M?=
 =?utf-8?B?QWxpL0wyM0JBTmtSSXFORlM0cWNQSHZyOGJuZzRKZmRKclp0ZzhWeHlkd1hw?=
 =?utf-8?B?dW9sbisyQ2JRSncwajU0MGxDYlIyUm04K3NhcXZ1ZjZUenFvRmRUR05XVHZ1?=
 =?utf-8?B?OGJsNWZDNGQydHp1N3JrMWFOaVZvcDcvRlhhbHVaNVNDVjFFY1pva0ZoUTFF?=
 =?utf-8?B?d2RmeXFzdCtQV0ptSkdTNk8rTENwODc1VnI2Z1hDclBIYmpsSXMwY3lyTjhH?=
 =?utf-8?B?WXJ5SjJoejVIczVmRnZCbUl0SzJ5N05iOWM4dUdBZnhRTFNCVEMwdWo3WVMw?=
 =?utf-8?B?M3B6eDRtOFF1eElNMWVaQWVUY21ucjY4UlRVT1pucUhNN2E2WDRwNWpUbC82?=
 =?utf-8?B?bVdLVFhpRng2czZJSmV2QzhnMkxPODZnN1d0VDZLOG8vUTZldVNyaVg5a2lX?=
 =?utf-8?B?R1RDL3Q2clZMdkZ0N3dvcHB2eXdaWTI4d2JRdGc2QXI4aVBseG5TT2M1b01j?=
 =?utf-8?B?T055dVJ6T29UOGY4SktqYWNuOE0zWGtXRS9iS2dCaEU0VTl6YmErdXIwKzYz?=
 =?utf-8?B?MU8yV21pNG03ME9oeWhPR092WWpJejlJZElzQndaclo2TmdHcVBacWpPVWRG?=
 =?utf-8?B?WDBtdlZ0b0lidnhNRzVmc2daRmd5RUhzSzJmRFg5NHkwUS9KaEU4Q3haK1Jj?=
 =?utf-8?B?bFM1cWllR25DS2tRY3ZRU1BERnZzSER4UjRVdlpWQ1FvNWxSS3REdm9uc0t2?=
 =?utf-8?B?TEZONzM1V2x4N2xLQmE0T01kTzBCZXorMWwyRG54SXFWTGhuSHhMNUdKZ0Mx?=
 =?utf-8?B?WUJiY3F4OFNOVTM1d2F3amt5a2JVcFZSMGlvZXgramVmZUcrOUp1cWFBZ3Uw?=
 =?utf-8?B?ZllWWldGby9TRkZKdmZUY3BwYk9GNTRQTFhBWFBRUFhoR1hYR0d4YllYRUZu?=
 =?utf-8?B?eTZXVW1meU51dmYrTCtlQWFyK1U3eGU0QjdVRlhobURjRnVWeFhFbFhrREph?=
 =?utf-8?B?MHI4T0xpYWJiVlRtYk1WN0pLdkFuQ3BBZ3hDbk9uR1FuS1BlYWJ4eEpJNlJh?=
 =?utf-8?B?Ukt6SWZwK2tsdTNiRFNjQkZNTE9pRVJ4SnphaHFGaG0vbjhSeGc4TGhIY2Q5?=
 =?utf-8?B?ajlVNUVyTFVnbzN3QmVNd0ttTUpQR3Yxcjd2cXdBRVRCaGNkUWQ4QStiZWti?=
 =?utf-8?B?ek5qUVcyNXVEY3RzbUp0NFZ1b3QwSFdSK2xGUVVmYk5XcEp4TGVLYURtK2F5?=
 =?utf-8?B?bjV3TElSVFJjZnVHRENDQ3dhNERDYW5rRVVWQTZLYWtkMWxZbG1zRmhKcSta?=
 =?utf-8?B?TmVHbGRETndNb1FKN0lVd2k5Q2oreDVqaFp4YjlsRzN6WEpMMmtqa1hmQVA1?=
 =?utf-8?B?UGpDUDV4QzNiczlOQmlHdDNhTm1CeE01VUpwNG9VT1lZb3RQMjltamhhcDVV?=
 =?utf-8?B?ZUZHTFo0ZzE2YXRhb1laSzRCbFVGNDBTL1QzWjJXSHdHUkk1TmFGSVB6ODJC?=
 =?utf-8?B?VUpybFhuanhTQU1tWEVBNks5d1hXY090Z3NwenFuL0tEMzJyN2o4ODdWK1cr?=
 =?utf-8?B?Wmg2UkFzbHYzSS8xV3MzU3doR1Ezd3VmS3h4ekFtamxwTWxVUzlpVVZMRmYx?=
 =?utf-8?B?dkUveUNnZmVieDlNVm9PTEtLaHptZXlYS2F4TmFJS0pValIzMUxRYjNnNWhW?=
 =?utf-8?B?cEhrb1dmalBzTWRGaGtVRlhLeTVCaDNkeEtQQ1lsSjBySjB2dmc3YnBIeEp6?=
 =?utf-8?B?cDVNaEZKc281YkV3a1BCRmhkQ0VIMEo2MXVUSEdsMktkZExDU1hVZGJvSDcz?=
 =?utf-8?Q?VXH4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVRvQ3pYektFbEZkb0dHd2s2cW5GNGlxT1Rxa01ELy9LdnFtVnAybk1KaTY2?=
 =?utf-8?B?NzNSbWhzdUNZVjRvb2hveDRtWlRqN3I2VDFwam8vRm9ndmJxbHNhaWlKQlF5?=
 =?utf-8?B?azhDaFZoUzRObks5QTMrKzd0TVpuLzdCdkpNM3ordE03RU9yZEVxQjllOFJ6?=
 =?utf-8?B?ZXZEaWxxUFhjYWJYMnZ5Nnh2VzczdEY1VHhiRHE3QjNVTDlTQ3hkYjZicVI0?=
 =?utf-8?B?bHAxUHdONzJvWVdRTDlLbTBpQ2VhdG04eU5Pb3NzUUtDZm9GTi9RSHY0OTY4?=
 =?utf-8?B?N3RIVVNKSWhhNGw4OUMvUlpkQnB1REFZcmlzTnhhOFZBekJ0Rkkwc0FSK29U?=
 =?utf-8?B?b2xtNG9qWFk2UGMrazFFTEhqQnMzNXBzZHcrcS9FR2M1SjZrdHhZUEcwYmFn?=
 =?utf-8?B?a3M4RUY3cWg4YTlMcWpPdHlrZm1mbkEranhKSUs4aHA4OVFmWVFDTkNqUjVS?=
 =?utf-8?B?Mzg1eWZ2R2lYMDg5SitnY1NYYS81dGV1dmtWVGVCWTJ3NktUd1dCbndSbzlE?=
 =?utf-8?B?SjBodXN1SDVMOXIwOGl1dyt6S2x2T2RkZ2tNNURVZDVTallvTk8zTGQxUmFn?=
 =?utf-8?B?SlZHNjRXWDhXc3EvQzd2UzFhWEZjcDRJNkdwR3pxN3lHNHZ0T1FnU0kvbkdq?=
 =?utf-8?B?Y2hWOVkwSzFjaTMwQWRpR084SEN3a2pUcDlCQVZqTi9oeFV5V1MySENacEdG?=
 =?utf-8?B?eFZkTjFNR3hOcUJaT0gzTXFKVGNvb1dzNmoxUEJwVE82NURiNzdsSTl0U0dM?=
 =?utf-8?B?elNTdWxlTDhTa3pIQXI4bXc5NFFOY28vUmhUZGF4dmNWSDQrZWk2dWJLVzVO?=
 =?utf-8?B?VGRveE9SNDludUlTa2Exa1dyT2NOTVJJTkpucmwyc3Zma0p6WElKejVGdFZT?=
 =?utf-8?B?OHJzSVd1T1VvU2d6Y3o5NDRBZ3IrbVY5OWdUbHZhUHROcXR4YlJkZTQ1ZVlO?=
 =?utf-8?B?WVVlcXRldThMWEtuZ3ZHSHV0ZGt4SjdhWWEraEVXOVFobnlmSTR1UlhoZm42?=
 =?utf-8?B?b0JQbDhXM0RxUmxrUGRqQXI5QjZCMmxyV1Vwa29ucVZUY05XbjNVYzRBOWRE?=
 =?utf-8?B?OVMyUElWN2ovcTlqdXZ2UFFrRUNUVTJKSmovQVh5NFZSK0NGZ0xreHFweDZS?=
 =?utf-8?B?dGd5VlRTa05ocHBhdzdnMGwraUJHbjhOQW1rdUpETlgxK1IrTi8zOTdpZFZh?=
 =?utf-8?B?bXJqTlRwemxDK2MxaGpxTUhXa3lmNFo1L3l1a0VnM2F3OFJYUEU2RkQ3QWR6?=
 =?utf-8?B?SGJUMlg1eWwzZkdpQmJIRVVFbXdwZGVuaVI4ODZrSTBGK0NGL2ZRd1orUERJ?=
 =?utf-8?B?ZjZLejdUV1VITGJFbmFKSnVYUkd5SkhxSWxNaUIvcEJnVEtrQmswQ05oVXox?=
 =?utf-8?B?OEpLbTdRVkx4SGJYcW50aGVLcjQ5NG1jYk5zT3FiaEpnNEFDQ09zMktTT1I1?=
 =?utf-8?B?a1cxY1haVFdlQzlxMEtYeDVjN3R6ZDdxN0lvL1Z4N08wTmE4VUtDL2NRR0cz?=
 =?utf-8?B?L2thQS9kNjd6QzhWTXR6TFFnZGI2RW00dTl4QkkvKytMMDM5cW9aRWdJSzNs?=
 =?utf-8?B?QmV3NzBCbmNybmxrVU9mR20zR3BpR1ZjSTFBVzUyQjZhQVRxdndyTmZYNGlo?=
 =?utf-8?B?YUw5Q3d4eUkvVC9sd3NIbnpjdEhnM29zeE0rNzVETytCdGo0aXVNbkpWR0R6?=
 =?utf-8?B?RVlLTkpzamdKU3VCemt5Ui95dEsyaGlmM3d2RmxrM2Z6TWhGZnlPUHEweHZF?=
 =?utf-8?B?RGt3MXZZQjNNQ1pZSFVqQ1l1b0FTOWUvNCtqVU03NGNzazNTSFFQcFpwMFBa?=
 =?utf-8?B?WDJDZ1lHMWhJWVpQVS85bmtHdEprSWJPWTdoSkdnZVNRdUpjZU9IQmF6MHNz?=
 =?utf-8?B?UllTZXlEaVpzVXJocThhMlZ1UDBLSHMxb0tsZGZKa2hFa3ZReEVIZ1lDR3Uy?=
 =?utf-8?B?aS9aY2QydnZwd1A0NVdvbWpQQk0xS256MkdEK1RHTHR4SE54ekl1ZjZ0QXBa?=
 =?utf-8?B?M1NENGxTZGdWSDdORTFBTUpQckJUK1MrdlVKZzhENFZrUXU4UEVQSUEzQWl3?=
 =?utf-8?B?bnFIRHZJak5YMHNNd1Q0bHpCdmZmQVZ2UXp1aXd3WjkxVG9WeHVSVkEwSldK?=
 =?utf-8?B?elJici8yMDlMRjVnL2dUc29NWW5GSi9Jd0NzTUJhck1ETXZ3MFMzMTBabDFp?=
 =?utf-8?B?aWZKNCs4ZDRTanlaM0J2TTFTVHR5ZTVPR0VuTFBoMndjWnkzTEZMQ09nUGg4?=
 =?utf-8?B?YmNjekJrVXdLNm9EdzlyeVFRQnVUaTRYOU5vaUdRZDBPdjdPN2RzLzA2azZw?=
 =?utf-8?Q?R1w5WCILhQHg/p7Il5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da0818a-0eda-4582-84e5-08de5a88892f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:06:00.0752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxQeAdmehESWxxjCumyBFCapOPAc8rwZsVpnnzozGadCm+zp75XIT88WNj3jqOY3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8843
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DB49776A6B
X-Rspamd-Action: no action

On 1/22/26 18:01, Pierre-Eric Pelloux-Prayer wrote:
> Same as what was done in commit 904de683fa5f
> ("drm/amdgpu: remove gart_window_lock usage from gmc v12") for v12.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
> index ef6e550ce7c3..dc8865c5879c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_1.c
> @@ -345,9 +345,7 @@ static void gmc_v12_1_flush_gpu_tlb(struct amdgpu_device *adev, uint32_t vmid,
>  		return;
>  	}
>  
> -	mutex_lock(&adev->mman.gtt_window_lock);
>  	gmc_v12_1_flush_vm_hub(adev, vmid, vmhub, 0);
> -	mutex_unlock(&adev->mman.gtt_window_lock);
>  	return;
>  }
>  

