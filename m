Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E543477CC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536AC6E9DB;
	Wed, 24 Mar 2021 12:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D47A6E9D3;
 Wed, 24 Mar 2021 12:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Idet6DHDpgIxWhOGSKt49muu19tTfS9j5t9h0VHPHp4zFQghdQw+fOtqJiyRXnvUQcGu1kprj7wXHyBv4/yWIjutL4w4dAu3QjrfICvD8mrchljUKrcQm76ppiiWlpMr06gfPSv/oJDw33I/NR43OVdMO0D9wASdwWhQgBeylzst3AtsHm9TbfmWFfWGJRA0dFOHJDQmny0OxOA8fFV67EBgRPjRmnzMhfIUGuXYTyG3NelT9GAh/OudQaCF8RriEA8T7UTpT4rTMilahe1yRPqx582Pq1zJwePny6PAwjOP1l1Wbqg4LyoMU/rlNzQfz/goq/KwH0qBUF5e+9oVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWNdzbuoxglQZ1ll1ApuUbwwSvP6rBmdY/JLURACrWE=;
 b=DbG4fMXzNEifY8m8e4ZA3jpOwaxPm7b20+5Ce6SlLnV2R77QQS9Gf4+pBvF8hS4kWXoqwfwp2FZUF8tHQDF6MCAZrP7qQT6PBb40bEn6faIFT2Qmqo8eYuaRKPHcrayDLl8A1ENOnSRcwNNAfWLWgtcjPvcM7jiwzVb0gpqqHvHjROw5z4Elso1NRuQZf2EpaUbuhbTiZzbp62WD/yzwubRLLHa4YlE+gMJ1fD/rJUzyZ0nANWh1MFt9Cx4mAI9y0GMwK4JU2+8x5vwJ1NGhaDkw+9Lf123+neRVqLO0agyEhsg3NgDTS6/V737ouNp+/Ocw2tNMc96YRLF4U6NooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWNdzbuoxglQZ1ll1ApuUbwwSvP6rBmdY/JLURACrWE=;
 b=FA1faFmLCqYeYy/NyXT/P82ftB/IvXnFwiXbOJOR4UXP1mhr4vru0CclckUMRCcZkXFJrp6pETGgAvX5iDplQ86HkZRjgu7xFSVH+9hTCNYDIHH/a2IRMDedvyrl3WtDB/wi23r1gq9PJ/PuiiWYNmxpfqluk8k2DtDq890hpw8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3680.namprd12.prod.outlook.com (2603:10b6:208:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 12:00:35 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 12:00:35 +0000
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Michal Hocko <mhocko@suse.com>, Matthew Wilcox <willy@infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Linux MM <linux-mm@kvack.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Dave Chinner <dchinner@redhat.com>, Leo Liu <Leo.Liu@amd.com>
References: <cd17d2ca-140e-1e69-37ac-c2726cc1ef9f@gmail.com>
 <YFnZMzs2wYGWqowi@dhcp22.suse.cz>
 <75ff80c5-a054-d13d-85c1-0040addb45d2@gmail.com>
 <YFng9qXM3NdrGHTx@dhcp22.suse.cz>
 <20808d08-b66c-13c3-f672-ebce216b2fa2@gmail.com>
 <YFnwBTF0YntCXFeG@dhcp22.suse.cz>
 <e5659cd0-61b2-82bd-64c3-76bd631b4522@amd.com>
 <YFoFdOtYDAezpSLv@dhcp22.suse.cz>
 <03889c00-bb5d-ef20-12c6-7e77df073dd9@amd.com>
 <762c4597-e9bd-6d8d-51b5-16b04f913eb8@shipmail.org>
 <YFsotY3HXmLNGF7p@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <488c8996-1dd2-4928-a98a-4e72f3e0af64@amd.com>
Date: Wed, 24 Mar 2021 13:00:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YFsotY3HXmLNGF7p@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4ff1:6377:7c5c:81d9]
X-ClientProxiedBy: AM0PR04CA0040.eurprd04.prod.outlook.com
 (2603:10a6:208:1::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4ff1:6377:7c5c:81d9]
 (2a02:908:1252:fb60:4ff1:6377:7c5c:81d9) by
 AM0PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:208:1::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Wed, 24 Mar 2021 12:00:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f2998f32-ab96-4794-db24-08d8eebc6e8f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB36807A3BCDB1C520655E828783639@MN2PR12MB3680.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BF20NdcS7AFpwBXyOlGXzIFsTUGrZwWDnTpV/KZ9jC6kcOUfTasYWCkqD/D8ayDFLt92s0bTNPOjEztFr/n6JPAlA2FdWGaAcJZJb+tODe4DYOVrsWCx4n+wrPZE0PgdpC0gH5tt8cqCmUxsFVzXUknSuTCFANLkMo46/Ade3aIwEeh3nU4fuz10KjCGA+kZJBuhiGbYINeKDZFGVIHDLAPA2VDy+eTX5tiChM8OJc3JccHkpBpE86COZieP05Ck80/lWtbEF+Vg3KW/c2ru09Rv8OiDEC5RWfoz1TbXgdU8t1vlce/hMZeio2wLjlR95xAoHRzPEz7LJqLiH5u6R9ZgEuO8EBn39op/FvGoGviwDmcwCHSk5gu1eZ+RMD+VU4ij3MThokDi3EC/L5imW9eA1zWGIC2cbQYLlNtA3FJ2tav+IxxdB9LEFzTjg6KkadIs9rrF6gbLdTxQSUXUOexlaoCjsu4R0qzx02DvQqXrvfoGCQHduOs7ojXGEeIzswNN+T/aKEV7KD2c4eA58wVvsGrY0sajeFETy11W5kLfthfEyWZraSxukdUHGZxsd9pTXInimbN77aYz/+94gmLkcJnC6jePXmV8+2bi/OpDwnryoVWVQ99W8/xGFOCl5nw5hHzzaI8JyjnyZ0Qv0YK0UYX+h9L6HEfyOVYmahv2eqHhjEZa8zRc+4zjZcRwJNsVkmWJ+dsRiOHx4aP1UoU+9fnJ4RN6hcC8mAQglkk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(366004)(136003)(346002)(110136005)(52116002)(86362001)(316002)(16526019)(2616005)(5660300002)(53546011)(186003)(6666004)(36756003)(83380400001)(66946007)(478600001)(6486002)(31696002)(8676002)(38100700001)(31686004)(66476007)(66556008)(6636002)(8936002)(66574015)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bnVWd3F1MWQxd3h0dDBKT3NzOXNHV3o3VjhHYlZYeGdkUGtFM3ZJc0hzSTJm?=
 =?utf-8?B?QnNGSWpWTitLZGtDMnhkSWYzUjhwVFJ4WVUvcVV4RWZacDg1d0VNTXRjUVc3?=
 =?utf-8?B?MEdsbkVydzRqc25pQ0JIVVVYOUVEOExRQ0ZvZ3VBWjVIaFZwcDN5UU1PNm9G?=
 =?utf-8?B?cXNzV2EvcFArM2RBWGNzU2JnakJkcnRjMzQyQ2IzZ0JGVVBKVU4wVUIyeTZK?=
 =?utf-8?B?Qy82bDFrM3l1WDVRb3V2WENWTzBOb3ZrUEx1blVGM003RWxEVHhEZlBwS21T?=
 =?utf-8?B?T0UyQ24rL3BERGh1R09qNWYwRzdMKysxZlhPTVU1RjZZdEVuYXBCMW0zMzU1?=
 =?utf-8?B?bUtYRE92ekV1aitEWTZHME43MmV6UDdhMFB2WFJzRW9LSjFpVFljT1FIUmF5?=
 =?utf-8?B?Y2tKK0UxSy83K2dEOXowWjNmZGNPN1g1Y2RrWnZNU2pTMWFaQ3kyMzRLRkxt?=
 =?utf-8?B?eTFJb0FPWjZNelJxSzVyWmJUbm1qWHU1dGJrZkZZV2RHT3JRMXpqdCtHQnRH?=
 =?utf-8?B?U2hoTXh5dERWK0VJSEN4NEUrUW5pZlVqVitGdjBOdjBmZWoydHdBV1U1cnZr?=
 =?utf-8?B?M1ZnZjhtS2NsTGVXdXZpY1pXTDFIRytWZWdLcHFpZzNLeStYT0txejdaTXpM?=
 =?utf-8?B?K05tUklMZDA2dFBkSFJUNlB0ekNQQnREbDFOb1NvMGhTM3lBMFdNWC9XTVBs?=
 =?utf-8?B?S0ZxU1U4VlFKaXFScnJlVnlydmU4T0NZUlppMGZYWXVidC9XWnhWSkJkSzIy?=
 =?utf-8?B?ZTFUK1pvOWJteWYvdTVoOTZDT3UraU1YMDB0cDczZEljU0xQQVZtTVhIYWtt?=
 =?utf-8?B?Q1hHM3JMZmRmdVJmNGo3N0lKMG5NKzU4RWdFTkZ5NWlsUC9sSzh6aW9kSkUy?=
 =?utf-8?B?VlZBUGVCNHJ5eTFXSitjR1ExZHNBQlYrTTZCRXAzTE96bnplVTY3RFpnOTUz?=
 =?utf-8?B?UTJjMmxBU0VMUi9pZEhsYk1KYTJJSXRVcVlaak1VdzBDaUdsbjRPRUNubDg2?=
 =?utf-8?B?c2pZVUNHZFpmNG8xUTZ5Wi85cFBwNVFPZWQ4VkpkQUkxWWRWY3dDTTFpVWxh?=
 =?utf-8?B?aEJIYWdueDEwUWJHci9CcFVlR1FVRE1kVmEvK25ISVA0eUthQ1FQWWZYTzUz?=
 =?utf-8?B?MTg5YXFob1lBZ1A1V043WHpEc1FjTWpwWitPRXUvRDlXTGM1aU0wczY2Z0RI?=
 =?utf-8?B?d1dHN3RDNnBCamxZRjRUM1RFM1VHR2I0dXk5MGRqa2RWTDlWRFlrd2R2SWRL?=
 =?utf-8?B?bDVBR1ZVME0yM29USHQ2WjBhWk1rd0dmRmJnU2tueE9xVWRkWDV2ajF2aEg5?=
 =?utf-8?B?bFdpd1RReUpncUNDUHRITzNKaUJLalAvd055M1dlRHo1eHFSQVJPKy9BOFBk?=
 =?utf-8?B?dk9ha3FPNUtHeEJlLytJS3lyQ0g4bnhTV1YrTklKUEVzaVlVNkt5WGFyYi9U?=
 =?utf-8?B?ZCswNk82blFEaUVvdW45bVpRMmU5ZW5tazNtU05pa1dwZmxxdExKTWc1bFVB?=
 =?utf-8?B?RnBjdG4xUHhFMXdTeTN1blNuUUV0UStBdER2aFBTbnZLdTl0TkNESS9tOFc4?=
 =?utf-8?B?NE9QbDBXOTFwVlU0YjBld1JrRnhFV1hyOGVnelFvWEJ2UDBVUkRvSVdHRTZz?=
 =?utf-8?B?SW5oM011RDRmcXdmT1hXRFNsUXRwYjVpRUpzUWFsNUpuMVVqNlVLQTM3a3A5?=
 =?utf-8?B?RFhjRmRrY3V0MjV4WVZlUEduWlpFNkJwVFJlczF5dkFJYVdmaVphUHlvdG44?=
 =?utf-8?B?MVJBYTMxWTIwYm9lVE10cEtkalV6dXBlSk5LcEpPdnpaQzdJa2tJM1JYSXFl?=
 =?utf-8?B?OGdxQ1padmhRTHEwS0c0U3dWb0l1YXByZEVTV1RZTi9PUTNKaHo5QkRSTkV0?=
 =?utf-8?Q?uC3y183lAAwCz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2998f32-ab96-4794-db24-08d8eebc6e8f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:00:35.2187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: US6JjNfMNUxGoWA35fiYdflTXiTTKiEulUK5lPqVfpzz4yVpxS86Uly7YkeKk87P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3680
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDMuMjEgdW0gMTI6NTUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgTWFy
IDI0LCAyMDIxIGF0IDExOjE5OjEzQU0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
d3JvdGU6Cj4+IE9uIDMvMjMvMjEgNDo0NSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+
IEFtIDIzLjAzLjIxIHVtIDE2OjEzIHNjaHJpZWIgTWljaGFsIEhvY2tvOgo+Pj4+IE9uIFR1ZSAy
My0wMy0yMSAxNDo1Njo1NCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gQW0gMjMuMDMu
MjEgdW0gMTQ6NDEgc2NocmllYiBNaWNoYWwgSG9ja286Cj4+Pj4gWy4uLl0KPj4+Pj4+IEFueXdh
eSwgSSBhbSB3b25kZXJpbmcgd2hldGhlciB0aGUgb3ZlcmFsbCBhcHByb2FjaCBpcwo+Pj4+Pj4g
c291bmQuIFdoeSBkb24ndAo+Pj4+Pj4geW91IHNpbXBseSB1c2Ugc2htZW0gYXMgeW91ciBiYWNr
aW5nIHN0b3JhZ2UgZnJvbSB0aGUKPj4+Pj4+IGJlZ2lubmluZyBhbmQgcGluCj4+Pj4+PiB0aG9z
ZSBwYWdlcyBpZiB0aGV5IGFyZSB1c2VkIGJ5IHRoZSBkZXZpY2U/Cj4+Pj4+IFllYWgsIHRoYXQg
aXMgZXhhY3RseSB3aGF0IHRoZSBJbnRlbCBndXlzIGFyZSBkb2luZyBmb3IgdGhlaXIKPj4+Pj4g
aW50ZWdyYXRlZAo+Pj4+PiBHUFVzIDopCj4+Pj4+Cj4+Pj4+IFByb2JsZW0gaXMgZm9yIFRUTSBJ
IG5lZWQgdG8gYmUgYWJsZSB0byBoYW5kbGUgZEdQVXMgYW5kIHRob3NlIGhhdmUgYWxsCj4+Pj4+
IGtpbmRzIG9mIGZ1bm55IGFsbG9jYXRpb24gcmVzdHJpY3Rpb25zLiBJbiBvdGhlciB3b3JkcyBJ
IG5lZWQgdG8KPj4+Pj4gZ3VhcmFudGVlCj4+Pj4+IHRoYXQgdGhlIGFsbG9jYXRlZCBtZW1vcnkg
aXMgY29oZXJlbnQgYWNjZXNzaWJsZSB0byB0aGUgR1BVCj4+Pj4+IHdpdGhvdXQgdXNpbmcKPj4+
Pj4gU1dJT1RMQi4KPj4+Pj4KPj4+Pj4gVGhlIHNpbXBsZSBjYXNlIGlzIHRoYXQgdGhlIGRldmlj
ZSBjYW4gb25seSBkbyBETUEzMiwgYnV0IHlvdSBhbHNvIGdvdAo+Pj4+PiBkZXZpY2Ugd2hpY2gg
Y2FuIG9ubHkgZG8gNDBiaXRzIG9yIDQ4Yml0cy4KPj4+Pj4KPj4+Pj4gT24gdG9wIG9mIHRoYXQg
eW91IGFsc28gZ290IEFHUCwgQ01BIGFuZCBzdHVmZiBsaWtlIENQVSBjYWNoZSBiZWhhdmlvcgo+
Pj4+PiBjaGFuZ2VzICh3cml0ZSBiYWNrIHZzLiB3cml0ZSB0aHJvdWdoLCB2cy4gdW5jYWNoZWQp
Lgo+Pj4+IE9LLCBzbyB0aGUgdW5kZXJseWluZyBwcm9ibGVtIHNlZW1zIHRvIGJlIHRoYXQgZ2Zw
IG1hc2sgKHRodXMKPj4+PiBtYXBwaW5nX2dmcF9tYXNrKSBjYW5ub3QgcmVhbGx5IHJlZmxlY3Qg
eW91ciByZXF1aXJlbWVudHMsIHJpZ2h0P8KgIFdvdWxkCj4+Pj4gaXQgaGVscCBpZiBzaG1lbSB3
b3VsZCBhbGxvdyB0byBwcm92aWRlIGFuIGFsbG9jYXRpb24gY2FsbGJhY2sgdG8KPj4+PiBvdmVy
cmlkZSBhbGxvY19wYWdlX3ZtYSB3aGljaCBpcyB1c2VkIGN1cnJlbnRseT8gSSBhbSBwcmV0dHkg
c3VyZSB0aGVyZQo+Pj4+IHdpbGwgYmUgbW9yZSB0byBoYW5kbGUgYnV0IGdvaW5nIHRocm91Z2gg
c2htZW0gZm9yIHRoZSB3aG9sZSBsaWZlIHRpbWUKPj4+PiBpcyBqdXN0IHNvIG11Y2ggZWFzaWVy
IHRvIHJlYXNvbiBhYm91dCB0aGFuIHNvbWUgdHJpY2tzIHRvIGFidXNlIHNobWVtCj4+Pj4ganVz
dCBmb3IgdGhlIHN3YXBvdXQgcGF0aC4KPj4+IFdlbGwgaXQncyBhIHN0YXJ0LCBidXQgdGhlIHBh
Z2VzIGNhbiBoYXZlIHNwZWNpYWwgQ1BVIGNhY2hlIHNldHRpbmdzLiBTbwo+Pj4gZGlyZWN0IElP
IGZyb20vdG8gdGhlbSB1c3VhbGx5IGRvZXNuJ3Qgd29yayBhcyBleHBlY3RlZC4KPj4+Cj4+PiBB
ZGRpdGlvbmFsIHRvIHRoYXQgZm9yIEFHUCBhbmQgQ01BIEkgbmVlZCB0byBtYWtlIHN1cmUgdGhh
dCBJIGdpdmUgdGhvc2UKPj4+IHBhZ2VzIGJhY2sgdG8gdGhlIHJlbGV2YW50IHN1YnN5c3RlbXMg
aW5zdGVhZCBvZiBqdXN0IGRyb3BwaW5nIHRoZSBwYWdlCj4+PiByZWZlcmVuY2UuCj4+Pgo+Pj4g
U28gSSB3b3VsZCBuZWVkIHRvIGJsb2NrIGZvciB0aGUgc3dhcGlvIHRvIGJlIGNvbXBsZXRlZC4K
Pj4+Cj4+PiBBbnl3YXkgSSBwcm9iYWJseSBuZWVkIHRvIHJldmVydCB0aG9zZSBwYXRjaGVzIGZv
ciBub3cgc2luY2UgdGhpcyBpc24ndAo+Pj4gd29ya2luZyBhcyB3ZSBob3BlZCBpdCB3b3VsZC4K
Pj4+Cj4+PiBUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiBob3cgc3R1ZmYgd29ya3MgaGVyZS4K
Pj4gQW5vdGhlciBhbHRlcm5hdGl2ZSBoZXJlIHRoYXQgSSd2ZSB0cmllZCBiZWZvcmUgd2l0aG91
dCBiZWluZyBzdWNjZXNzZnVsCj4+IHdvdWxkIHBlcmhhcHMgYmUgdG8gZHJvcCBzaG1lbSBjb21w
bGV0ZWx5IGFuZCwgaWYgaXQncyBhIG5vcm1hbCBwYWdlIChubyBkbWEKPj4gb3IgZnVubnkgY2Fj
aGluZyBhdHRyaWJ1dGVzKSBqdXN0IHVzZSBhZGRfdG9fc3dhcF9jYWNoZSgpPyBJZiBpdCdzIHNv
bWV0aGluZwo+PiBlbHNlLCB0cnkgYWxsb2MgYSBwYWdlIHdpdGggcmVsZXZhbnQgZ2ZwIGF0dHJp
YnV0ZXMsIGNvcHkgYW5kCj4+IGFkZF90b19zd2FwX2NhY2hlKCk/IE9yIHBlcmhhcHMgdGhhdCBk
b2Vzbid0IHdvcmsgd2VsbCBmcm9tIGEgc2hyaW5rZXIKPj4gZWl0aGVyPwo+IFNvIGJlZm9yZSB3
ZSB0b3NzIGV2ZXJ5dGhpbmcgYW5kIGdvIGFuIGEgZ3JlYXQgcmV3cml0ZS10aGUtd29ybGQgdG91
ciwKPiB3aGF0IGlmIHdlIGp1c3QgdHJ5IHRvIHNwbGl0IHVwIGJpZyBvYmplY3RzLiBTbyBmb3Ig
b2JqZWN0cyB3aGljaCBhcmUKPiBiaWdnZXIgdGhhbiBlLmcuIDEwbWIKPgo+IC0gbW92ZSB0aGVt
IHRvIGEgc3BlY2lhbCAidW5kZXIgZXZpY3Rpb24iIGxpc3QKPiAtIGtlZXAgYSBub3RlIGhvdyBm
YXIgd2UgZXZpY3RlZCB0aHVzIGZhcgo+IC0gaW50ZXJsZWF2ZSBhbGxvY2F0aW5nIHNobWVtIHBh
Z2VzLCBjb3B5aW5nIGRhdGEgYW5kIHJlbGVhc2luZyB0aGUgdHRtCj4gICAgYmFja2luZyBzdG9y
ZSBvbiBhIGNodW5rIGJhc2lzIChtYXliZSAxMG1iIG9yIHdoYXRldmVyLCB0dW5pbmcgdGJoKQo+
Cj4gSWYgdGhhdCdzIG5vdCBlbm91Z2gsIG9jY2FzaW9uYWxseSBicmVhayBvdXQgb2YgdGhlIHNo
cmlua2VyIGVudGlyZWx5IHNvCj4gb3RoZXIgcGFydHMgb2YgcmVjbGFpbSBjYW4gcmVjbGFpbSB0
aGUgc2htZW0gc3R1ZmYuIEJ1dCBqdXN0IHJlbGVhc2luZyBvdXIKPiBvd24gcGFnZXMgYXMgd2Ug
Z28gc2hvdWxkIGhlbHAgYSBsb3QgSSB0aGluay4KClllYWgsIHRoZSBsYXRlciBpcyBleGFjdGx5
IHdoYXQgSSB3YXMgY3VycmVudGx5IHByb3RvdHlwaW5nLgoKSSBqdXN0IGRpZG4ndCB1c2VkIGEg
bGltaXQgYnV0IHJhdGhlciBhIG9ubHkgcGFydGlhbGx5IGV2aWN0ZWQgQk9zIGxpc3QgCndoaWNo
IGlzIHVzZWQgd2hlbiB3ZSBmYWlsIHRvIGFsbG9jYXRlIGEgcGFnZS4KCkZvciB0aGUgNS4xMiBj
eWNsZSBJIHRoaW5rIHdlIHNob3VsZCBqdXN0IGdvIGJhY2sgdG8gYSBoYXJkIDUwJSBsaW1pdCAK
Zm9yIG5vdyBhbmQgdGhlbiByZXN1cnJlY3QgdGhpcyB3aGVuIHdlIGhhdmUgc29sdmVkIHRoZSBp
c3N1ZXMuCgpDaHJpc3RpYW4uCgo+IC1EYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
