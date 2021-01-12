Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16982F34D8
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 17:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A578E89C61;
	Tue, 12 Jan 2021 15:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210E589C61;
 Tue, 12 Jan 2021 15:59:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alocKvvINs1uqRDU4J7++1KDFD4HiO/T8DHkS0VI0XuG34KsxgRZevzoPyM6z91tc/Fkt7qaKabUIF9sjDoAadTP8/7ZD7Mefq70h4A3lGOQp34pEolIdX5CYP8iWpUrGgKzMEGC0TkOMdJ3y3DcSQUVmV1MHEAPMBBE7J8lfraNdGeYkiI2FQ6CzaypQQYBLKaOj7higkRI0DMxhwoqkemEnEgXzJfGIVa+5EvLaqjLumCa/vgtgqOKg7pu7tNmilIGMBSXOX7ERjptnlYKA9K1hSgL+B68g35wc3q7NEjBzu6pdYHhjCTMSd3GU1U2MjDyFwPfCTfSA/uYbMrWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RThYkndOmNEIUe3TIqG3rNvtSucIq0YXlCeVJl8+Zc=;
 b=kFdTONfkngCSiRRLdZcLOfINBWrDqQKTNRuD1wFYmXrgHGr+oEPqKavBhHlaFefXbGsFe+ZpxY9TPn8Bvax1KvbvBv7ZggSYB7epnEsLsMLMY362/ZKiXJvBGtdF0n8E1Cl2eVYVZdgBP/1WiqZixPSzpW3Ux+rMf+41auhUWJCicPgI8ZpaPwWA6qe8A6w1MHSy+hu4FjzlTFT48b23uLSsmA9pLx7A/VDOdI6NTHVuiFsp8zWeGgJgsonPkP1lc+nOVr/plOKuxaipn62OF8JPHfeHB5YAE72Jv3lK+c2hcoAku/XyV5GPS3QIVCCh7CgtJbhWDwt3ctiU2GwmjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8RThYkndOmNEIUe3TIqG3rNvtSucIq0YXlCeVJl8+Zc=;
 b=4tf8mheWv178rEE9ydyWG80dryN20FuYxWxWEEQDYgspL+gJeLrUnY9JCpM3QKvXo02lXXiQZV9LjQmI+MTqSA2yrocV08mByy2xzP+AjV0L0puvlofiiH0Ddw81KQQFu7SlUZKTHfLdKe6Ot8+3X0KRxFfRQwN17or8jTVfB24=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2574.namprd12.prod.outlook.com (2603:10b6:802:26::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 15:59:56 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 15:59:56 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
 <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
 <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
 <X/x5RD0xQxWUYvQ3@phenom.ffwll.local> <X/x5nXM7bZDl+MWR@phenom.ffwll.local>
 <db1e456d-8493-c94e-942e-ed19a2e1b931@amd.com>
 <X/1niT8MNvcEwDFS@phenom.ffwll.local>
 <a0435d29-dabb-89ad-cdd0-1b5f1e32b7c9@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <f869b0dc-2678-07e4-511f-739c025579d0@amd.com>
Date: Tue, 12 Jan 2021 10:59:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <a0435d29-dabb-89ad-cdd0-1b5f1e32b7c9@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:1cf9:5b19:bbcc:fe65]
X-ClientProxiedBy: YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::27) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1cf9:5b19:bbcc:fe65]
 (2607:fea8:3edf:49b0:1cf9:5b19:bbcc:fe65) by
 YTBPR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 15:59:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9ecf823d-8cf2-44f5-3fcd-08d8b7131b74
X-MS-TrafficTypeDiagnostic: SN1PR12MB2574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2574CF1318E73D7DCF37DF5FEAAA0@SN1PR12MB2574.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1YaeA4+v/1qdmK7EGkxvUqyHNcv6SY1WMYJ9WW2vJwgHQ9PPZghX2pgyEpGZIOWL3oyftleUnFvrD+bXRxbvAo+TwzsYvBon27RNx4SCsNvDAaoqRdfdyUK71K6ex1FxSAF652opSMJYV1TIeaFAKdHeB00PWcwg7hUqvyPDml1GZuiRthpBzBfmE8ttsk+LqMhflkByeTxExJ9iw7trswDxsqmV2eOtljcejTySJcnN7GhXCQH1PGiRQTc8Jcp/OKwnRQc+Bql2zBmV02zOzqALFSyS4xQumDGwERqd7R91Mbi+LBd9kehVEFKO6R33IC5gqoHdzkKvMEwQ/mIA/A5A0FM2ZA/2VXb0Ns0FeHRj7fRyNYqR9O8adVg21GsLQfWg8LQAfl+sIDgsXK19lezftlNc+RQ1pk0CVggXD5XpdzfMIP9VGcNrCPwTpc7XowyjCiB39diIxy2ysrW6eu89qVrFB7jLGH20uxDU0H0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(4326008)(316002)(5660300002)(86362001)(52116002)(16526019)(31686004)(110136005)(54906003)(2906002)(186003)(6666004)(7416002)(53546011)(31696002)(8676002)(36756003)(2616005)(66556008)(6486002)(8936002)(478600001)(66476007)(66946007)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T05CU3RWeTAreUUzdnZQUisyd084OTk0UHFjZjRTYytrYzlXVzBhQWI1STZX?=
 =?utf-8?B?ZjBaNWtKV0Y4R29qY0dDRkhDUENIalk2M3B4WnU3TUdXMEkzK3p0MGs0UkRv?=
 =?utf-8?B?Ny80SDIwMFhDU3Q3OU1DMk1lRExadHRIcEptNkJTUEs5dnJjS0xRNkdGVUxW?=
 =?utf-8?B?QytXSkpBOTBqVGNBK3RoYzZRVjQyWGRGOUxTTnlXczZqc0w5eHVqa0JSRllK?=
 =?utf-8?B?ZWd4b3NldktPOC8waEhERzNMaUtCUHU3cW5kTFprVnc1SjV2LzRQeHRDbndj?=
 =?utf-8?B?bm9tclpIMGhIbmtqZjB4c0pnT3BoNWx2Q3dqaWRDMVNBUTYwRDJiK1YwbkVy?=
 =?utf-8?B?ZkF0RFpZTDRNM3BjaHBhWkNuYW5yV2N4WHl6cjV4NU5US0llaWJYOGViMGVR?=
 =?utf-8?B?eHpQN0wwWHlTN1FHZ0VqMS9zUzRHd2lGOWJ2WjBNajZkL2EvM2oyU2pwSURu?=
 =?utf-8?B?SFh4MWdnaHNHUlBCZkRJRFVvSG5Pdk5FUmNXS3gwTzBVRENLbEoyZ3dBb2U1?=
 =?utf-8?B?cWp5VUpPMW5UdzBDQml5c0JjTm1EYzRydW9EdTl2R25QMTdEK1BpUmlsTlJh?=
 =?utf-8?B?ZVBYeU1lM29uUFZteU5CMWZJUEtWS2duNll1bEFPTGJXK25DV3FXOFo5eVJE?=
 =?utf-8?B?Y3c4dWs0eTN5STBIaWpoZTNBN2U3QXNSZUNlUFlQSG9LZ0hKSHNsZTI5VjJJ?=
 =?utf-8?B?U0ltZlNjV2lRRzJSRERDMWRGVnlnMExmcXJYeVFpWkVMdkJTR2N5czFnTXlP?=
 =?utf-8?B?MU1VWE13NHFGSDV4bjZHN24zclg1VGcyRDZjWlZ0Zm1EaXdQSnFIenZRVnJH?=
 =?utf-8?B?dWRSWllBWFZHRGRlQmRNNE1LN0NucFZYLyszUzdQZi9uc1EzQ0p3cVVsck9s?=
 =?utf-8?B?UXFVa2pKOHlBS1pYSlBCWUxiNFJpcUg3djZhc3ErUTA4bVdoY1FlZGRaNTBs?=
 =?utf-8?B?MWpJM3VhY0VoWlNiWHUxcWRjUDkvOWxDL1ZUN2ZLSHgxcUtlNFNaalFXdHFJ?=
 =?utf-8?B?eHk3R2FXVHNqMFJjQkR4c0M2bnV3SFhMblI0bWFSZlQ0TEFkRTh3RGxOL3pC?=
 =?utf-8?B?Z1pEMnpSMFFXRTUzZUt5cXdSR3pDOTFlempBSFJxQkNZdjlNYkdvd1gwbmkw?=
 =?utf-8?B?dEN4Qk9XTnpjVG02Q0gweFp2YlRScHovOC9wb3dEU1V6UWVuYnpaUmxLTmQ5?=
 =?utf-8?B?eCt4VmdtVW9rZzNnWWZGQUVLWUdJTGp4MXNhc3Jrd0g3S0V4UWV5Uk9BSS9R?=
 =?utf-8?B?TnJnVkNUNW5iVzZpMCt5SHY2d00xbzdvUnBuY2RPRGZSRzQ3V3pOR0VJVDk1?=
 =?utf-8?B?NzRqWitlOUNuZnJjb1V1K1FxdWlpRGhTZm1qckE1Z2ZVaWZBR29iZ0hRVVc5?=
 =?utf-8?B?eXRkMDlLQml0MXdmNGY0Ty9mYUw2VUozNFdVRUdkaSsvSURLdmcxeEJRc1RK?=
 =?utf-8?Q?O0Kr8lyd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 15:59:56.5060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecf823d-8cf2-44f5-3fcd-08d8b7131b74
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaGHjYA7/ne4sJKSBTlHjoVY07N/hbttadp2E8z55t5z5tuZXgFwb6hTSSmGOfPObLQ84ekJghU0LMJsLL+Iow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2574
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "yuq825@gmail.com" <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEvMTIvMjEgNzozMiBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAxMi4wMS4y
MSB1bSAxMDoxMCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+IE9uIE1vbiwgSmFuIDExLCAyMDIx
IGF0IDAzOjQ1OjEwUE0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4gT24gMS8x
MS8yMSAxMToxNSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+PiBPbiBNb24sIEphbiAxMSwg
MjAyMSBhdCAwNToxMzo1NlBNICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+PiBPbiBG
cmksIEphbiAwOCwgMjAyMSBhdCAwNDo0OTo1NVBNICswMDAwLCBHcm9kem92c2t5LCBBbmRyZXkg
d3JvdGU6Cj4+Pj4+PiBPayB0aGVuLCBJIGd1ZXNzIEkgd2lsbCBwcm9jZWVkIHdpdGggdGhlIGR1
bW15IHBhZ2VzIGxpc3QgaW1wbGVtZW50YXRpb24gCj4+Pj4+PiB0aGVuLgo+Pj4+Pj4KPj4+Pj4+
IEFuZHJleQo+Pj4+Pj4KPj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
Pj4+PiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPgo+
Pj4+Pj4gU2VudDogMDggSmFudWFyeSAyMDIxIDA5OjUyCj4+Pj4+PiBUbzogR3JvZHpvdnNreSwg
QW5kcmV5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPjsgRGFuaWVsIFZldHRlciAKPj4+Pj4+
IDxkYW5pZWxAZmZ3bGwuY2g+Cj4+Pj4+PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgCj4+Pj4+PiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgCj4+
Pj4+PiBkYW5pZWwudmV0dGVyQGZmd2xsLmNoIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPjsgcm9i
aEBrZXJuZWwub3JnIAo+Pj4+Pj4gPHJvYmhAa2VybmVsLm9yZz47IGwuc3RhY2hAcGVuZ3V0cm9u
aXguZGUgPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+OyAKPj4+Pj4+IHl1cTgyNUBnbWFpbC5jb20g
PHl1cTgyNUBnbWFpbC5jb20+OyBlcmljQGFuaG9sdC5uZXQgPGVyaWNAYW5ob2x0Lm5ldD47IAo+
Pj4+Pj4gRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgCj4+
Pj4+PiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc+OyAKPj4+Pj4+IHBwYWFsYW5lbkBnbWFpbC5jb20gPHBwYWFsYW5lbkBnbWFpbC5jb20+OyBX
ZW50bGFuZCwgSGFycnkgCj4+Pj4+PiA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT4KPj4+Pj4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDEvMTJdIGRybTogQWRkIGR1bW15IHBhZ2UgcGVyIGRldmlj
ZSBvciBHRU0gb2JqZWN0Cj4+Pj4+Pgo+Pj4+Pj4gTWhtLCBJJ20gbm90IGF3YXJlIG9mIGFueSBs
ZXQgb3ZlciBwb2ludGVyIGJldHdlZW4gVFRNIGFuZCBHRU0gYW5kIHdlCj4+Pj4+PiB3b3JrZWQg
cXVpdGUgaGFyZCBvbiByZWR1Y2luZyB0aGUgc2l6ZSBvZiB0aGUgYW1kZ3B1X2JvLCBzbyBhbm90
aGVyCj4+Pj4+PiBleHRyYSBwb2ludGVyIGp1c3QgZm9yIHRoYXQgY29ybmVyIGNhc2Ugd291bGQg
c3VjayBxdWl0ZSBhIGJpdC4KPj4+Pj4gV2UgaGF2ZSBhIHRvbiBvZiBvdGhlciBwb2ludGVycyBp
biBzdHJ1Y3QgYW1kZ3B1X2JvIChvciBhbnkgb2YgaXQncyBsb3dlcgo+Pj4+PiB0aGluZ3MpIHdo
aWNoIGFyZSBmYWlybHkgc2luZ2xlLXVzZSwgc28gSSdtIHJlYWxseSBub3QgbXVjaCBzZWVpbmcg
dGhlCj4+Pj4+IHBvaW50IGluIG1ha2luZyB0aGlzIGEgc3BlY2lhbCBjYXNlLiBJdCBhbHNvIG1l
YW5zIHRoZSBsaWZldGltZSBtYW5hZ2VtZW50Cj4+Pj4+IGJlY29tZXMgYSBiaXQgaWZmeSwgc2lu
Y2Ugd2UgY2FuJ3QgdGhyb3cgYXdheSB0aGUgZHVtbXkgcGFnZSB0aGVuIHRoZSBsYXN0Cj4+Pj4+
IHJlZmVyZW5jZSB0byB0aGUgYm8gaXMgcmVsZWFzZWQgKHNpbmNlIHdlIGRvbid0IHRyYWNrIGl0
IHRoZXJlKSwgYnV0IG9ubHkKPj4+Pj4gd2hlbiB0aGUgbGFzdCBwb2ludGVyIHRvIHRoZSBkZXZp
Y2UgaXMgcmVsZWFzZWQuIFBvdGVudGlhbGx5IHRoaXMgbWVhbnMgYQo+Pj4+PiBwaWxlIG9mIGRh
bmdsaW5nIHBhZ2VzIGhhbmdpbmcgYXJvdW5kIGZvciB0b28gbG9uZy4KPj4+PiBBbHNvIGlmIHlv
dSByZWFsbHksIHJlYWxseSwgcmVhbGx5IHdhbnQgdG8gaGF2ZSB0aGlzIGxpc3QsIHBsZWFzZSBk
b24ndAo+Pj4+IHJlaW52ZW50IGl0IHNpbmNlIHdlIGhhdmUgaXQgYWxyZWFkeS4gZHJtbV8gaXMg
ZXhhY3RseSBtZWFudCBmb3IgcmVzb3VyY2VzCj4+Pj4gdGhhdCBzaG91bGQgYmUgZnJlZWQgd2hl
biB0aGUgZmluYWwgZHJtX2RldmljZSByZWZlcmVuY2UgZGlzYXBwZWFycy4KPj4+PiAtRGFuaWVs
Cj4+Pgo+Pj4gSSBtYXliZSB3YXMgZWFnZXIgdG8gZWFybHksIHNlZSBpIG5lZWQgdG8gZXhwbGlj
aXRseSBhbGxvY2F0ZSB0aGUgZHVtbXkgcGFnZQo+Pj4gdXNpbmcgcGFnZV9hbGxvYyBzbwo+Pj4g
aSBjYW5ub3QgdXNlIGRybW1fa21hbGxvYyBmb3IgdGhpcywgc28gb25jZSBhZ2FpbiBsaWtlIHdp
dGggdGhlIGxpc3QgaSBuZWVkCj4+PiB0byB3cmFwIGl0IHdpdGggYSBjb250YWluZXIgc3RydWN0
Cj4+PiB3aGljaCBpIGNhbiB0aGVuIGFsbG9jYXRlIHVzaW5nIGRybW1fa21hbGxvYyBhbmQgaW5z
aWRlIHRoZXJlIHdpbGwgYmUgcGFnZQo+Pj4gcG9pbnRlci4gQnV0IHRoZW4KPj4+IG9uIHJlbGVh
c2UgaXQgbmVlZHMgdG8gZnJlZSB0aGUgcGFnZSBhbmQgc28gaSBzdXBwb3NlZGx5IG5lZWQgdG8g
dXNlIAo+Pj4gZHJtbV9hZGRfYWN0aW9uCj4+PiB0byBmcmVlIHRoZSBwYWdlIGJlZm9yZSB0aGUg
Y29udGFpbmVyIHN0cnVjdCBpcyByZWxlYXNlZCBidXQgZHJtbV9rbWFsbG9jCj4+PiBkb2Vzbid0
IGFsbG93IHRvIHNldAo+Pj4gcmVsZWFzZSBhY3Rpb24gb24gc3RydWN0IGFsbG9jYXRpb24uIFNv
IEkgY3JlYXRlZCBhIG5ldwo+Pj4gZHJtbV9rbWFsbG9jX3dpdGhfYWN0aW9uIEFQSSBmdW5jdGlv
bgo+Pj4gYnV0IHRoZW4geW91IGFsc28gbmVlZCB0byBzdXBwbHkgdGhlIG9wdGlvbmFsIGRhdGEg
cG9pbnRlciBmb3IgdGhlIHJlbGVhc2UKPj4+IGFjdGlvbiAodGhlIHN0cnVjdCBwYWdlIGluIHRo
aXMgY2FzZSkKPj4+IGFuZCBzbyB0aGlzIGFsbCBiZWNvbWVzIGEgYml0IG92ZXJjb21wbGljYXRl
ZCAoYnV0IGRvYWJsZSkuIElzIHRoaXMgZXh0cmEKPj4+IEFQSSB3b3J0aCBhZGRpbmcgPyBNYXli
ZSBpdCBjYW4KPj4+IGJlIHVzZWZ1bCBpbiBnZW5lcmFsLgo+PiBkcm1fYWRkX2FjdGlvbl9vcl9y
ZXNldCAoZm9yIGJldHRlciBjb250cm9sIGZsb3cpIGhhcyBib3RoIGEgdm9pZCAqIGRhdGEKPj4g
YW5kIGEgY2xlYW51cCBmdW5jdGlvbiAoYW5kIGl0IGludGVybmFsbHkgYWxsb2NhdGVzIHRoZSB0
cmFja2luZyBzdHJ1Y3R1cmUKPj4gZm9yIHRoYXQgZm9yIHlvdSkuIFNvIHNob3VsZCB3b3JrIGFz
LWlzPyBBbGxvY2F0aW5nIGEgdHJhY2tpbmcgc3RydWN0dXJlCj4+IGZvciBvdXIgdHJhY2tpbmcg
c3RydWN0dXJlIGZvciBhIHBhZ2Ugd291bGQgZGVmaW5pdGVseSBiZSBhIGJpdCB0b28gbXVjaC4K
Pj4KPj4gRXNzZW50aWFsbCBkcm1tX2FkZF9hY3Rpb24gaXMgeW91ciBrY2FsbG9jX3dpdGhfYWN0
aW9uIGZ1bmN0aW9uIHlvdSB3YW50LAo+PiBhcyBsb25nIGFzIGFsbCB5b3UgbmVlZCBpcyBhIHNp
bmdsZSB2b2lkICogcG9pbnRlciAod2UgY291bGQgZG8gdGhlCj4+IGt6YWxsb2Nfd2l0aF9hY3Rp
b24gdGhvdWdoLCB0aGVyZSdzIGVub3VnaCBzcGFjZSwganVzdCBubyBuZWVkIHlldCBmb3IgYW55
Cj4+IG9mIHRoZSBjdXJyZW50IHVzZXJzKS4KPgo+IFllYWgsIGJ1dCBteSB0aGlua2luZyB3YXMg
dGhhdCB3ZSBzaG91bGQgdXNlIHRoZSBwYWdlIExSVSBmb3IgdGhpcyBhbmQgbm90IAo+IGFub3Ro
ZXIgY29udGFpbmVyIHN0cnVjdHVyZS4KPgo+IENocmlzdGlhbi4KCgpXaGljaCBzcGVjaWZpYyBs
aXN0IGRpZCB5b3UgbWVhbiA/CgpBbmRyZXkKCgo+Cj4+IC1EYW5pZWwKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
