Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA66961F7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 12:08:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C0410E87A;
	Tue, 14 Feb 2023 11:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2109.outbound.protection.outlook.com [40.107.105.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B1910E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 11:08:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+mjBzHHLZqmPuqJ2grI08bhKlI7ndDc0qVJs+aLlxMS8eS8TSvxjzUj6IsV3D2UZNLAGf1+wd1JvJ+ERPxWMflKAc1CX3yx4S1nC7hvBOiD+t0UL4jaCSxdPUI/f6TqGE2cWEaor0nOU3iK2uvnu9GHB4R22xsDW5WDTbH/+DfKuCPnprUM9NCxIsNWOeouQ5RDdsL7EKGu9PQbJGzxx6TNa25305cICsp/8Ea1jd/NePjVLDX041uy4PWeaNATmgXBIx2YfWhTBeOwECMlTqEELraYCjxYhPhJFnhj2Q3uBtu/12arAu4ZRVXGo54t2w6Pd22p4FXcfvMKNpfrmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=976QNozTn9DP6Y+eAmMRBdp5Cn4rp3K63F8bsuPxJMc=;
 b=NAPk15KxY9IzTjb0U/babcx0LUE4U/4Zlluul6rHYgyT+5V9Kq75TlsfaFog+nSMzkSiKjiCajVXud41+TsPIc+3thuu5eFqA3+OhR0AJormgoGtRiN9ivHBntHOh4/dhFEhKjk1EJmO+g77BapUgu2pGOuN61TXKcnsNrNSvPv0S0KwbFq+QpCUecsm3oJ3A2G62Ju3wqWxiOYrjZHayMzHrbel0bwOVzPjnzdtHObQNX+P3yeu5t5SR3H0uHYdx/DfC/sFVtpPnM8aPgn7QfrcBgJsBNKghN1CxY4n2Mb94ZDtLAzmqEngcFyOHSBMWqKYOBGD1s0MEukBJH3t6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=976QNozTn9DP6Y+eAmMRBdp5Cn4rp3K63F8bsuPxJMc=;
 b=CBFH5ZDzRrZKG21FFX/QD4783y79kq93cShJlMZf6kOhPjI40Xmdyk8OwP4z8wH3gx+mouJL8TN6PN65G72hSkUDSqmiFCxQUZNCr2lAMCIr83VBsNEAph4CahTFuEeC5hGgHDLO7NihvCOwGrnkiOtGBoOgLfwTwJhH5GFwlfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by PRAPR10MB5448.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:29b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 11:08:25 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a%4]) with mapi id 15.20.6086.023; Tue, 14 Feb 2023
 11:08:25 +0000
Message-ID: <85ac61b6-1fff-0f16-a92a-af9eab81a099@prevas.dk>
Date: Tue, 14 Feb 2023 12:08:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US, da
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Marek Vasut <marex@denx.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
 <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
 <c9dc0b2b-8850-6227-163b-85c53c5d72ef@prevas.dk>
 <12d5568f-c12c-970d-0f78-17d6dc7c0c1d@denx.de>
 <6ceb6866-f8a5-072f-3d86-895024fcec79@prevas.dk>
In-Reply-To: <6ceb6866-f8a5-072f-3d86-895024fcec79@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0014.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::29) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|PRAPR10MB5448:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f05baa-045b-4c15-9512-08db0e7bcb35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzfpjA+HTOHwklFd2w6GqBuQkm9XRVZvGXiOGFCgj5w3Wl679k2qolEkhQneBOawetg2Ju/MJqxzPGO+T6EIHm9DaYsOus9I1yWbawLQDH09mc/769HveKWrNX37B0nWfFqZRDxSgH4OjymukOCuhceKDfEMDDoj2w2BjjxY5ZXseN1sAwn2uUsZZLKD42p/8jGxeWSVxEzACTIwce+LDBcQ5a+vD5cj0dDi4CqQ2sQQc+kkfOewlDyXpj3WU/Z+Iwlv9bcTs09PDAzFT12e0ewARQcIrP58HsySFbqNLrQFCCVRf2JxtO6oIXBHTXLlGo7IIpqSreqqdhwkpBQ/lQyK7r9RKqq2XbfHSVAh6yUMHwCBf9cXIW86VKgltJbcbPh2zRqk/0jt697JNACoLGPkUGqC3j25tYAUT8tqQRXvpcO2F41DF98QXGg2SNhAJ2FlNyV0jOwSowTlqPdEha7pFU1O67XytcbP2vMeMewivV1wVGIEav4n+TddQE8jyj/Wj3nkiF3iYe6xysVyz42K8dsNBRPLvPl+1yfWQ4nTk0t5sdiMBHJP9tzGrtlzpE6/ispugpyJ1yK78Fgv3QIZtdq4cOq6a7+k4ypSQwxsUCum+TZfEgZWnOgN5VaiI62ZW/yphJoeWgejdCst2jxHflff/qUpbPdC9IG+gma9FqM/cGYqGNGlP3EyVnKkt1ky+IwwezI232MaVd+54i1fVBn3ZACaX3EBRMYJExwpqxm+q4eBdS0YAGw65TQ1hwTKHqGOnSfiN4KxAzC9YA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39850400004)(136003)(346002)(396003)(376002)(451199018)(6666004)(52116002)(6486002)(6506007)(478600001)(83380400001)(86362001)(38350700002)(38100700002)(36756003)(186003)(6512007)(26005)(2616005)(31696002)(8976002)(31686004)(41300700001)(8936002)(4744005)(5660300002)(7416002)(2906002)(8676002)(66946007)(66476007)(66556008)(4326008)(44832011)(110136005)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlJvL3MveWVmVUV4WitsUmZ2Y1RyMjA4VERQYzBnTXJ3eWk1NFFYWm5BZ0lW?=
 =?utf-8?B?REowUGs3R3VId21iRXVobFpFUW1xTm5KVW5ka3gzODBKRFRIN3JuWlVMVzBP?=
 =?utf-8?B?aEpuL0JqWmlBVVVrci9HVWJRTEZ1QkdrZEJNbUFSRkhkVitYcEg4Z1U1aS9v?=
 =?utf-8?B?aisxN2NRUWRPcEU5RzRVcEw3aVVUUndaNWtMTzc3cUd5YTdNQ3ltc1o0bHBn?=
 =?utf-8?B?bUtyWUxPUFcvc3NwL1E0UVU1V0NNUCtkVHBhU0xVZ3ZGa2hoMlVsSi96Mlpj?=
 =?utf-8?B?M25mUTdUOWEzZlBtMWZjUlFXVE9JTVJOY1Nwa08yYWlMWFV1M1pHbkdGSStP?=
 =?utf-8?B?ZTBHNmhsTTBVM2pseC93ZDlPVXlSOC81eklQOU5nYU9HQ3cyVFhtdmhtQ3Np?=
 =?utf-8?B?eWRDVnMzeVE1RXpEcWxmSDQ5L1lIWWpZVW1mV1JNS0crL2RVc3I1dTFyc0pn?=
 =?utf-8?B?UE56K1E5NDBlT3l4aS9CcFk1WlV1L21DMkJIM0tzWXdPLzN0ZXNFWTlEQkt6?=
 =?utf-8?B?Q1hIamswb09lS213Nkp5cUF2L3V6QnlGeTZHNUsyWmlNTHZwb1JSSkhNcnlB?=
 =?utf-8?B?UlVJQWNFOWVmc3pRRWozZGJVV0dDNXloYzNmZHFzUmVMVURIY3JBaElKbVJz?=
 =?utf-8?B?NTJpbzNwU3BwdGY3R2lwc3lwamU1b0lZUUJVcm40cUxFa1ZJZzNqZ01ENFdy?=
 =?utf-8?B?R2ZmWVdDSHBuRDFYL2dWMzJNVCtlK25QY25kR09Ub3RlcnNoUE9mREhQV0Jw?=
 =?utf-8?B?Z0pqYWVrRnorMEhpb3k2THZmSUsrSjFSckRiWktSOHFzakQ3VDlqVTFiYUY4?=
 =?utf-8?B?MTlFblBFNWVPZElSWlFYN2ZNd2oyRGNMdHJFTklsQ21jMUprWUtPOG5aMVZi?=
 =?utf-8?B?UnE4MFNRUDFjOWJ6SmNGVTZVbzZpbFJkb1VsbWRQdTRzOEhtMWJFNFRwUVJl?=
 =?utf-8?B?NklwWVd2VFQ5WGN1VzVuRUMwMkJJbGhJSHBPWFJwU3llVEpLMjBqOTZHWHcx?=
 =?utf-8?B?SDRnVlFEdDhyQzlrREVFYnY0dFdSajY3bDRQVlA5MGdRMkZLaC9Kc2cwcDBV?=
 =?utf-8?B?YUw5WGtLYzFwUXNNM1FCU1pUVWszU1ptMHZWcUg5cXBNaC9DbGlQWmgyS0E4?=
 =?utf-8?B?MiszcVg0QXRHRmxXZ1hWVlpXVElNSURMdDYwc0lFLzR1MmpNK2ZaWGlwUWVC?=
 =?utf-8?B?QjJVS1FpZjdDenFnemFXZUVRUGtsVXQzUmZaR1gvam1jamluZ3Q1U0RQMmJq?=
 =?utf-8?B?VThRSjFESldCaU1XWDRWbWJacDU3cVZKazZRSGk4b0plRTNwSXVFSWNadmhl?=
 =?utf-8?B?SDk0dDY0enlydEdBc0FrdmJhSUVFQnljZGFOQmF1eW44bmNmUHgrR3JVNEVI?=
 =?utf-8?B?Mk1XbmZGMjhQYmU2RnUzZlVlVTljRERMSXZ5anBDMjRaRlhKQ3QybkZvWVBa?=
 =?utf-8?B?cUMrR2FoMWlmdk9lcGcyTGhFek45TFcyQmlwcFNSV0RSQUt1bXdVWTNGN1lw?=
 =?utf-8?B?SVJzNWFjeDZCcEo3RDJselNTZDRzYk1zSk5rbyt2MStQTmhKMVVnSnhvQjQ3?=
 =?utf-8?B?S2l1N0t5Y3JiWTlMZmJRb3h5MDVBejRqc1MxUUxETnloZjJ0SjdCZWNwUlBW?=
 =?utf-8?B?UkZaZUhXOXVlLzU0Rm1GdnZ2bHJYZFBEUWVGUzRxK0RiTU9QbUIzYTdwQUI1?=
 =?utf-8?B?eGlTRTdjVUtyaXRuQlRQOEJZZW0wQ1pBNVZUbmkwUWJyUWcxaTU2S29WZW9p?=
 =?utf-8?B?RldTNnlNMEZVN1U2d1VGTENNRjlJNlhoWUc1cGpCNi9Mdm1jNTZqL3llUTc3?=
 =?utf-8?B?czlWOGxFSHVTM1h6N1EzQk0wUUZVeFIxZ0JBY3JPUXc4RElVbytUdGc4ZXQ4?=
 =?utf-8?B?OHE1WVpveGwzTVJmZEhBOUo5U1RHRm1uOGZYU0psUFJVVUdRcWIveWVDVnh2?=
 =?utf-8?B?dmpJZkIwQkFVdjU3WFVTaCsyM2RXV2p4RHUyMm5Ed0svWGRqbWdwMGtNdDFS?=
 =?utf-8?B?V0QvSHlUbkdFc3hxN09zNEJDbjJJM3BkUUpkaGlMVUFORjNlU2VqZFFBUytp?=
 =?utf-8?B?OHRQMCtXSkNBNVlMM3NiUDkwdFBOVCtUcGZhdzNIRHR2Z3NybmZZYyt1VldJ?=
 =?utf-8?B?MVBwaTJ4Z3JRYW5LRjBkRVZ4ZEZYMUZqQkZnRThYRzV0NWw5T2NlYzJoem4v?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f05baa-045b-4c15-9512-08db0e7bcb35
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 11:08:25.7672 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DAS3WDoQcHbXnS2L3TTw36Q54r7ASliqnFGtrZIdABrnDsYrE0yxP4/7Iy1Fq2zE9Fp5ctb/a5gpAJajbYVc/otvSAQA8f1MSat/rSQixP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5448
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
Cc: linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/02/2023 11.55, Rasmus Villemoes wrote:
> On 07/02/2023 10.23, Marek Vasut wrote:
> 
> Do any of you happen to have this working on the imx8mp-evk, and if so,
> can you share the .dts updates you've done and how exactly you test the
> graphics?
>

Oh, and could those of you who have some graphics working with the
mainline kernel on imx8mp tell which U-Boot you're using (NXP or
mainline, and which version). I'm using mainline U-Boot 2022.10.

Rasmus

