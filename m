Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0815635F420
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 14:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F07F6E8BC;
	Wed, 14 Apr 2021 12:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE32F6E429;
 Wed, 14 Apr 2021 12:43:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWgqux5zmbgxgUh8ZaasOku5aXh/2cyRrxZzF3euCDQv8KrAfhAeY2dzI3BtJGLyeC3hBHdcdJMOrOLjhf3JjoSQZpla7Ar+r9AeRoAZYQQguUChskF2tERRf0ORlH+yhwhSq7xEsXlN8BFBglIZtGKfJ53/qoQxkU1fMBDbxS/5agK0LYW+aVn+ghXxwQPu87DVrg40yMxN/is856eD6pMw2oLPyBGYpA59snkBpiLo6EqAc8nWsAmrC5ZQU+7fx9QvVc6Uc7+BDlul+UxBQs9vRwl6RuFEAa38LuSt33LH2neuIVoovgz4s1RjzfhXaZbEW51nL6tkjdXAFYwmaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WACDf+oghGzMc1HGzyJIN0OSK18j0vxarXTYLPGlPaw=;
 b=lpyGjMdzF3rOZMaPuYzV2xTvFFQmzZH7ncPfVrO7s2rpdTHI93UZKJTR8Qxiwxf+jpRFP1Wsj13aUpMXOtx7pdaYfyJ9q8Mhw1xmn81xUGV9gcKsq+1/ajFnaRnc9MNCFB3gsUoLi0Lu7w2RdVJ5VRuCwkezjidA1Lzm1VdCA0eXD7Qqet4L0wr454NxMZIIJq6MydedRMGyUZQ7jCb6DkbyDwp+iefTDMSRJ/t9PuPhf7Z4tBHc3ct0qrwZiuCE6vVe+5vqxPCEtbJhtj0uYjT8gmTZ79XKS2KqPfi1KPfHOPoGxpMQdxsUQgKQYnhyng0zcoJV9H+QoVEemlwXmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WACDf+oghGzMc1HGzyJIN0OSK18j0vxarXTYLPGlPaw=;
 b=g7i8d5lDsFp9N5qd8Y8TlTeYh8xp2mi4rcJCS59lK79lCgje6LmANz7fbI2KYlimHNCg32w0FgI9ERkCaJ3ah2M00v8g+DOgUDmXKE25aWES+3fkrQC8dzw+mxfkH1kAYlRbTeHxpQSz5jM6zRrf068vf2VqyLzRPKJwjep8UyY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 12:43:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 12:43:54 +0000
Subject: Re: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against
 pages_limit
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
 <20210414064804.29356-9-Felix.Kuehling@amd.com>
 <60d08770-e4f5-4e8f-0a93-2270ae02aa26@gmail.com>
 <YHayqD3IbupkY7b+@phenom.ffwll.local>
 <18a18e85-7b0d-649f-64a3-028376d8de15@amd.com>
 <YHbDQcr6Yl1Lljep@phenom.ffwll.local>
 <7ac3a5e9-abf6-6ea5-af21-25c04e984d57@gmail.com>
 <CAKMK7uFniPaRLpO9KmPe22xP69yahTwVomCE2FuMRG97_K_NVQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <18af0d4e-1ec8-a761-e4df-d4904755a432@amd.com>
Date: Wed, 14 Apr 2021 14:43:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAKMK7uFniPaRLpO9KmPe22xP69yahTwVomCE2FuMRG97_K_NVQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e934:1a45:3324:73c2]
X-ClientProxiedBy: AM3PR07CA0134.eurprd07.prod.outlook.com
 (2603:10a6:207:8::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e934:1a45:3324:73c2]
 (2a02:908:1252:fb60:e934:1a45:3324:73c2) by
 AM3PR07CA0134.eurprd07.prod.outlook.com (2603:10a6:207:8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.6 via Frontend Transport; Wed, 14 Apr 2021 12:43:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fd26b9d-d615-4799-a26f-08d8ff42f6a6
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3839DDF95F3D5F72D872EBE0834E9@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GsG2Eed1kPAhT3GTsYm8+UEpND3nzmiR9M/FuN+BonsUg0RaKTAwQB1YszIyIJSlhg0UodJ6M5K5Zk27+cPsvl3NmqslKVEvP1Q9cvXYMun/hTZtpiAf06sTTGv8N0NPmSA+xzJoYyUtClnlieLizUzQRX7zNELNGgxTqCjH2lgtG1noj8wp7RviRkBk20lIbLyveq0VTw9x0nM/fx4yUa0oeOsIRi162sOqzFZ+iPulCrE3WkA7aRbGfgdrqT26vSYhAryr2XKNO57bwBrmeN2/U0O4Fi77Z218rJx5IWuBdlg64gkIQ38v5oJ7mJeq86tQqgQEDCeXub/DVT+LTuODQ59CAlo2e1hvRTZ/yejEYOoz9IBpjMZ3dejN8rQTn2FXnb02T0yHRGdY5qX1wsFjg/q2rW1nVyAzr6k+KYMxsgEXpTUp4KG88WzvsTXHZVwmJGg6rBHShnLJreegHLDvtKYvgYVfr/KO03K6wIVmbgqFE1gMnFgmNpEFAvxqCXv0t2AOFRgcPqrxCIezMU2wKAZ1i7yHL1o1NJyzLnUASEKy2Z5mXe6LKeaYjc/esXc4n/S1j+rv77BXZ/nX42M/mUbzuBnrms5z8HMDXdJDPWHdU+FKemf4hQrmhH3TjST+MwPfcXR6GKFGOYTQxRJDnxh5MRqbRhFFyu5NDTkeFUGb8h89jtEHXW14rbR2tmuuIQtJhIixMHcnsGrRkn1HYFospXUZ+5I2UnTR3DA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(2906002)(66946007)(66476007)(36756003)(66556008)(186003)(16526019)(5660300002)(83380400001)(316002)(8676002)(31686004)(2616005)(86362001)(966005)(52116002)(478600001)(45080400002)(8936002)(31696002)(110136005)(66574015)(53546011)(4326008)(54906003)(6666004)(6486002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eVppTGdEZ2hYRk5LSEs5YytpT1RXSTZFTHh5REtPdE0xN3F6VU0vaXYxcHpT?=
 =?utf-8?B?WGMweE1qK1AwemF0dWlLTVNueFo5cEpocU9pbHFGcUtreDhUd3RaTjdNakt2?=
 =?utf-8?B?K1lISk1vMGhzZjJKcmFvU2dGY08vNkNpOUxuM3ZjNHlzM3R0ZjlZM3pxak5n?=
 =?utf-8?B?RmE0UWV3OFVxenpqTlFGVkdpdDZRaDR3YWlDR0E2cndlZElrL0JKUjNMNGor?=
 =?utf-8?B?QjNESTVjZHh2Z0Y3a203YXFFQmJ1dkE5akEyZ2dScDE0cjMrbFVJWURGY2Zx?=
 =?utf-8?B?bkxBMG1PM2VVcW51WkpnOFFoc3d2L0tNTUt5bWY1MUJYYjFYbG80Nnd6SFpB?=
 =?utf-8?B?NGs2dlo1bUt0VlR5K2FUdSs2bkFDSlJTajkwL0NqNXhlbkZBeEZsekxjT1Vy?=
 =?utf-8?B?ZUN4MHdsRnZuQ0V5UHhQdlJTaXo3MU9TLzhuakZ0bWw1c2NTbXNRdmdqdld1?=
 =?utf-8?B?OEdyQVhqREsrQnFSNkNOd1QxQnptUUZEZjFxaEtrMEFLMnQxcHIyVForRVlB?=
 =?utf-8?B?RG9ZSG5ib0VIK2FVczFRd3hoRnlFNFZzeXpCVS96YVdIVjNSSjFHSEtmbVk2?=
 =?utf-8?B?NmdiWjFNZ211MmhXWmhqaVljR2VyYnFITWc1ZzZ2TVd4OEJuMjNPT3ZrZFNK?=
 =?utf-8?B?cXNqZFhEL1FETmJVSDQzSGU4WG5xYnN5N2d0WGJxeTFLc2dpWWRZZEE0bUt5?=
 =?utf-8?B?cmdRd29nZVlWWUYvbzFyTWIrUEJlRzF6ODhTMzRzd2toQ085bk14SmZLdlp1?=
 =?utf-8?B?bEFucThXcStBQlRINjVGM0NqcTRZcVpRK2Q1ZzdpV1hOQ1Z2OEJzUDJKa1Iv?=
 =?utf-8?B?ZTRXb043dHFKV29wSnhQa3J3UEphd2NqUEpWc3p6UVdEVVdMYm9JTnZaUmJq?=
 =?utf-8?B?SDNWWWN4NCtzMlBjOFlnMEY0Ymxxb1BkWll3eEV0RmhDNktkTlRqQ0pDTGFO?=
 =?utf-8?B?Q05obCtsMTBBeUkxa1JNUmtKemZWNUwyUEhmWEp3eWRxVTRJNTh5RkdjOEd3?=
 =?utf-8?B?TTZ4R2crS1EzbzVWVXF5RXBVd2FCSXJuTEZjdjlVeFpkWTJlQ1pOTk54UkpH?=
 =?utf-8?B?NkRBcXI4dEpWNmxUcG5iV1p6bGhZZTIyd29KUW93VU05dEs3cnYyVXJHdURX?=
 =?utf-8?B?L003cmdiZytQU2ZndER1N1lCQzRyY3pRYlVZSk1iSkxqSnQrdlZ1YTJ4STB3?=
 =?utf-8?B?SWRGd1BIMkFrem9GRGZUdWhQdmtETStTZ2RhdTRGc3RsdlJINnUzWWhTZ2NK?=
 =?utf-8?B?Q3FOejdZa1JQWjF4a2psSmdPeENKcE9DeUFnNVFUWi8vTExjN3g1T0RmRGpX?=
 =?utf-8?B?dFMxeWRxYTBnSFFlTm1sbUxFOWh6bkhCTUV3dm90RWo3bVEwMWtDL3cvMVBG?=
 =?utf-8?B?aGV1Z0FueTJKbkxVTXdyQkZoYlN6SW43dzZoVlNIaDc0Yi9iQTdaODBBS3p0?=
 =?utf-8?B?SnpnNnBseWhGNjdTdG55NFc0WnE2eDd6S3BULzZoQUFoWHcyM0VpSFB1OUlH?=
 =?utf-8?B?T2p3emI2QnVIUlp5Si9CK0YvakduN3l1cTgwbDFYZTdwVEFGR3puY0F5cGRB?=
 =?utf-8?B?eWRyK2xLT21rWVpFV0NOSGtZVStCMWhFSS9sSlloNm1USHN1dXViSFZIU29J?=
 =?utf-8?B?SVJVOXZhRFFrWFcyV0RaOGtVaEJET0phU3FZajh3SmovVmZscWlscW8wU1dV?=
 =?utf-8?B?VEppcm0zZlgxS09lT3VmQkpXQWJFY0VqL2MzVGdqdWtqZEtWbE1kWGpVV2w2?=
 =?utf-8?B?N3JUOHB6ZkF4SjJTbi8yWVlTK3BlSWgrM24wZW9kQm9zbTFabnhlSDM5K1dq?=
 =?utf-8?B?NHVBNXJiVVJ6MVVuTFkzS1pQRUp6aUw2Nyt2MWNTV3psbmVscFc2cnhhZVdw?=
 =?utf-8?Q?vpTDOapldZOgl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd26b9d-d615-4799-a26f-08d8ff42f6a6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 12:43:54.5934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jBwai4H1jy82AO+J2ypK4PL9Ns9Q+uDnIDG1OivgMjbpxP4c6i8L3A8uj/K6WID
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDQuMjEgdW0gMTQ6MjUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgQXBy
IDE0LCAyMDIxIGF0IDEyOjQ5IFBNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6
dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+PiBBbSAxNC4wNC4yMSB1bSAxMjoyNiBzY2hyaWVi
IERhbmllbCBWZXR0ZXI6Cj4+PiBPbiBXZWQsIEFwciAxNCwgMjAyMSBhdCAxMToxOTo0MUFNICsw
MjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEFtIDE0LjA0LjIxIHVtIDExOjE1IHNj
aHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+Pj4gT24gV2VkLCBBcHIgMTQsIDIwMjEgYXQgMDg6NTE6
NTFBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+IEFtIDE0LjA0LjIxIHVt
IDA4OjQ4IHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6Cj4+Pj4+Pj4gUGFnZXMgaW4gU0cgQk9zIHdl
cmUgbm90IGFsbG9jYXRlZCBieSBUVE0uIFNvIGRvbid0IGNvdW50IHRoZW0gYWdhaW5zdAo+Pj4+
Pj4+IFRUTSdzIHBhZ2VzIGxpbWl0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVs
aXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+Pj4+PiBSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4+Pj4KPj4+Pj4+
IEdvaW5nIHRvIHBpY2sgdGhhdCBvbmUgdXAgZm9yIGluY2x1c2lvbiBpbiBkcm0tbWlzYy1uZXh0
Lgo+Pj4+PiBTZWUgbXkgb3RoZXIgZW1haWwsIGJ1dCB3aHkgZG8gd2UgbmVlZCB0aGlzPyBBIGJp
dCBtb3JlIGV4cGxhbmF0aW9uIGlzIGltbwo+Pj4+PiBuZWVkZWQgaGVyZSBhdCBsZWFzdCwgc2lu
Y2Ugd2Ugc3RpbGwgbmVlZCB0byBndWFyYW50ZWUgdGhhdCBhbGxvY2F0aW9ucwo+Pj4+PiBkb24n
dCBvdmVyIHRoZSBsaW1pdCBpbiB0b3RhbCBmb3IgYWxsIGdwdSBidWZmZXJzIHRvZ2V0aGVyLiBB
dCBsZWFzdCB1bnRpbAo+Pj4+PiB0aGUgc2hyaW5rZXIgaGFzIGxhbmRlZC4KPj4+Pj4KPj4+Pj4g
QW5kIHRoaXMgaGVyZSBqdXN0IG9wZW5zIHVwIHRoZSBiYXJuIGRvb3Igd2l0aG91dCBhbnkgZXhw
bGFuYXRpb24gd2h5IGl0J3MKPj4+Pj4gb2suCj4+Pj4gVGhlIFNHIGJhc2VkIEJPcyBtaWdodCBu
b3QgZXZlbiBiZSBiYWNrZWQgYnkgcGFnZXMuIEUuZy4gZXhwb3J0ZWQgVlJBTS4KPj4+Pgo+Pj4+
IFNvIGVpdGhlciB0aGV5IGFyZSBleHBvcnRlZCBieSBhIGRyaXZlciB3aGljaCBzaG91bGQgaGF2
ZSBhY2NvdW50ZWQgZm9yIHRoZQo+Pj4+IGFsbG9jYXRpb24sIGV4cG9ydGVkIGJ5IFRUTSB3aGlj
aCBhbHJlYWR5IGRpZCB0aGUgYWNjb3VudGluZyBvciBkb2Vzbid0IGV2ZW4KPj4+PiBwb2ludCB0
byBwYWdlcyBhdCBhbGwuCj4+Pj4KPj4+PiBUaGlzIGlzIHJlYWxseSBhIGJ1ZyBmaXggdG8gcmVj
cmVhdGUgdGhlIGJlaGF2aW9yIHdlIGhhZCBiZWZvcmUgbW92aW5nIHRoZQo+Pj4+IGFjY291bnRp
bmcgdG8gdGhpcyBwbGFjZS4KPj4+IFRocm93IHRoYXQgaW50byB0aGUgY29tbWl0IG1lc3NhZ2Ug
YW5kIGEtYjogbWUuIElkZWFsbHkgd2l0aCBhIEZpeGVzOiBsaW5lCj4+PiBvciBzbyBwb2ludGlu
ZyBhdCB0aGUgb2ZmZW5kaW5nIGNvbW1pdCB0aGF0IGJyb2tlIHN0dWZmLiBDb21taXQgbWVzc2Fn
ZXMKPj4+IHNob3VsZCByZWFsbHkgZ28gaW50byBtb3JlIGRldGFpbCB3aGVuIHRoZXJlJ3MgYW4g
ZW50aXJlIHN0b3J5IGJlaGluZCBhCj4+PiBzbWFsbCBjaGFuZ2UgbGlrZSB0aGlzIG9uZS4KPj4g
U29ycnkgSSB0aG91Z2ggdGhhdCB0aGlzIHdvdWxkIGJlIG9idmlvdXMgOikKPj4KPj4gSSd2ZSBh
bHJlYWR5IHB1c2hlZCB0aGUgcGF0Y2ggaW4gdGhlIG1vcm5pbmcsIGJ1dCBnb2luZyB0byBrZWVw
IHRoYXQgaW4KPj4gbWluZCBmb3IgdGhlIG5leHQgdGltZS4KPiBJJ2xsIGtlZXAgcmVtaW5kaW5n
IHlvdSB0byBwbHMgZWxhYm9yYXRlIG1vcmUgaW4gY29tbWl0IG1lc3NhZ2VzLCBpdCdzCj4gY29t
aW5nIHVwIGV2ZXJ5IG9uY2UgaW4gYSB3aGlsZSA6LSkKCldlbGwsIGRlc2NyaWJpbmcgc3R1ZmYg
aW4gYSBjb21taXQgbWVzc2FnZSB3aGljaCBpcyBvYnZpb3VzIGlzIGp1c3QgCnJlZHVuZGFudC4K
CkkgY2FuIG9mIGNvdXJzZSBleHBsYWluIHRoZSB3aG9sZSBiYWNrZ3JvdW5kIG9mIHRoZSBjb2Rl
IGluIHF1ZXN0aW9uIGluIAp0aGUgY29tbWl0IG1lc3NhZ2UsIGJ1dCBmb3Igb2J2aW91cyBidWcg
Zml4ZXMgbGlrZSB0aGlzIGl0IGlzIGp1c3Qgb3ZlcmtpbGwuCgo+IEFsc28gaW4gZ2VuZXJhbCBJ
IHRoaW5rIGEgZmV3IGRheXMgb2YgbGV0dGluZyBwYXRjaGVzIHNvYWsgb3V0IHRoZXJlLAo+IGVz
cGVjaWFsbHkgc2hhcmVkIGNvZGUsIGlzIGdvb2QgY3VydGVzeS4gU29tZSBmb2xrcyBkZW1hbmQg
MiB3ZWVrcywKPiB3aGljaCBJIHRoaW5rIGlzIHRvbyBtdWNoLCBidXQgbGVzcyB0aGFuIDI0aCBq
dXN0IG1lYW5zIHlvdSdyZQo+IGd1YXJhbnRlZWQgdG8gbGVhdmUgb3V0IGhhbGYgdGhlIGdsb2Jl
IHdpdGggdGhlaXIgZmVlZGJhY2suIFdoaWNoCj4gaXNuJ3QgZ3JlYXQuCgpXZWxsIGZvciBzdHJ1
Y3R1cmFsIGNoYW5nZXMgSSBjZXJ0YWlubHkgYWdyZWUsIGJ1dCBub3QgZm9yIGEgYnVnIGZpeCAK
d2hpY2ggYWRkcyBhIG1pc3NpbmcgY2hlY2sgZm9yIGEgc3BlY2lhbCBjYXNlLgoKQ2hyaXN0aWFu
LgoKPgo+IERyaXZlciBjb2RlIEkgZG9uJ3QgY2FyZSBzaW5jZSB0aGVyZSB5b3Uga25vdyBhbGwg
dGhlIHN0YWtlaG9sZGVycyBvZmMuCj4gLURhbmllbAo+Cj4+IENocmlzdGlhbi4KPj4KPj4+IC1E
YW5pZWwKPj4+Cj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4+IC1EYW5pZWwKPj4+Pj4KPj4+Pj4+
IFJlZ2FyZHMsCj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pgo+Pj4+Pj4+IC0tLQo+Pj4+Pj4+ICAg
ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyB8IDI3ICsrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLQo+Pj4+Pj4+ICAgICAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCj4+Pj4+Pj4KPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fdHQuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4+Pj4+PiBpbmRl
eCA1ZDg4MjA3MjViNzUuLmU4YjhjMzI1NzM5MiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV90dC5jCj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fdHQuYwo+Pj4+Pj4+IEBAIC0zMTcsOSArMzE3LDEyIEBAIGludCB0dG1fdHRfcG9wdWxhdGUo
c3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsCj4+Pj4+Pj4gICAgICAgICAgICBpZiAodHRtX3R0X2lz
X3BvcHVsYXRlZCh0dG0pKQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPj4+
Pj4+PiAtIGF0b21pY19sb25nX2FkZCh0dG0tPm51bV9wYWdlcywgJnR0bV9wYWdlc19hbGxvY2F0
ZWQpOwo+Pj4+Pj4+IC0gaWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+Pj4+Pj4+IC0gICAgICAg
ICBhdG9taWNfbG9uZ19hZGQodHRtLT5udW1fcGFnZXMsICZ0dG1fZG1hMzJfcGFnZXNfYWxsb2Nh
dGVkKTsKPj4+Pj4+PiArIGlmICghKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cp
KSB7Cj4+Pj4+Pj4gKyAgICAgICAgIGF0b21pY19sb25nX2FkZCh0dG0tPm51bV9wYWdlcywgJnR0
bV9wYWdlc19hbGxvY2F0ZWQpOwo+Pj4+Pj4+ICsgICAgICAgICBpZiAoYmRldi0+cG9vbC51c2Vf
ZG1hMzIpCj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgYXRvbWljX2xvbmdfYWRkKHR0bS0+bnVt
X3BhZ2VzLAo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdHRtX2Rt
YTMyX3BhZ2VzX2FsbG9jYXRlZCk7Cj4+Pj4+Pj4gKyB9Cj4+Pj4+Pj4gICAgICAgICAgICB3aGls
ZSAoYXRvbWljX2xvbmdfcmVhZCgmdHRtX3BhZ2VzX2FsbG9jYXRlZCkgPiB0dG1fcGFnZXNfbGlt
aXQgfHwKPj4+Pj4+PiAgICAgICAgICAgICAgICAgICBhdG9taWNfbG9uZ19yZWFkKCZ0dG1fZG1h
MzJfcGFnZXNfYWxsb2NhdGVkKSA+Cj4+Pj4+Pj4gQEAgLTM1MCw5ICszNTMsMTIgQEAgaW50IHR0
bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKPj4+Pj4+PiAgICAgICAgICAg
IHJldHVybiAwOwo+Pj4+Pj4+ICAgICAgZXJyb3I6Cj4+Pj4+Pj4gLSBhdG9taWNfbG9uZ19zdWIo
dHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNfYWxsb2NhdGVkKTsKPj4+Pj4+PiAtIGlmIChiZGV2
LT5wb29sLnVzZV9kbWEzMikKPj4+Pj4+PiAtICAgICAgICAgYXRvbWljX2xvbmdfc3ViKHR0bS0+
bnVtX3BhZ2VzLCAmdHRtX2RtYTMyX3BhZ2VzX2FsbG9jYXRlZCk7Cj4+Pj4+Pj4gKyBpZiAoISh0
dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NHKSkgewo+Pj4+Pj4+ICsgICAgICAgICBh
dG9taWNfbG9uZ19zdWIodHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNfYWxsb2NhdGVkKTsKPj4+
Pj4+PiArICAgICAgICAgaWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+Pj4+Pj4+ICsgICAgICAg
ICAgICAgICAgIGF0b21pY19sb25nX3N1Yih0dG0tPm51bV9wYWdlcywKPj4+Pj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJnR0bV9kbWEzMl9wYWdlc19hbGxvY2F0ZWQpOwo+
Pj4+Pj4+ICsgfQo+Pj4+Pj4+ICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+Pj4+PiAgICAgIH0K
Pj4+Pj4+PiAgICAgIEVYUE9SVF9TWU1CT0wodHRtX3R0X3BvcHVsYXRlKTsKPj4+Pj4+PiBAQCAt
MzgyLDkgKzM4OCwxMiBAQCB2b2lkIHR0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNl
ICpiZGV2LCBzdHJ1Y3QgdHRtX3R0ICp0dG0pCj4+Pj4+Pj4gICAgICAgICAgICBlbHNlCj4+Pj4+
Pj4gICAgICAgICAgICAgICAgICAgIHR0bV9wb29sX2ZyZWUoJmJkZXYtPnBvb2wsIHR0bSk7Cj4+
Pj4+Pj4gLSBhdG9taWNfbG9uZ19zdWIodHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNfYWxsb2Nh
dGVkKTsKPj4+Pj4+PiAtIGlmIChiZGV2LT5wb29sLnVzZV9kbWEzMikKPj4+Pj4+PiAtICAgICAg
ICAgYXRvbWljX2xvbmdfc3ViKHR0bS0+bnVtX3BhZ2VzLCAmdHRtX2RtYTMyX3BhZ2VzX2FsbG9j
YXRlZCk7Cj4+Pj4+Pj4gKyBpZiAoISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NH
KSkgewo+Pj4+Pj4+ICsgICAgICAgICBhdG9taWNfbG9uZ19zdWIodHRtLT5udW1fcGFnZXMsICZ0
dG1fcGFnZXNfYWxsb2NhdGVkKTsKPj4+Pj4+PiArICAgICAgICAgaWYgKGJkZXYtPnBvb2wudXNl
X2RtYTMyKQo+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgIGF0b21pY19sb25nX3N1Yih0dG0tPm51
bV9wYWdlcywKPj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnR0bV9k
bWEzMl9wYWdlc19hbGxvY2F0ZWQpOwo+Pj4+Pj4+ICsgfQo+Pj4+Pj4+ICAgICAgICAgICAgdHRt
LT5wYWdlX2ZsYWdzICY9IH5UVE1fUEFHRV9GTEFHX1BSSVZfUE9QVUxBVEVEOwo+Pj4+Pj4+ICAg
ICAgfQo+Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1h
aWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1kZXZlbCZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFu
LmtvZW5pZyU0MGFtZC5jb20lN0M1MDNmMjQwZDQwOTc0MGMxMzMzNTA4ZDhmZjQwNjU0NSU3QzNk
ZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc1Mzk5OTkzNTUzMzA0
ODElN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYy
bHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9NnNX
NTMlMkZHcHhrNHJaS003bXBIRGZnQmhyZUNYWTRNY3lwS0dxVEgxM2I4JTNEJmFtcDtyZXNlcnZl
ZD0wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
