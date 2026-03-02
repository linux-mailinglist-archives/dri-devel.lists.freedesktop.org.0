Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oH5VDmTIpWnEFgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:27:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFF31DDC7C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0759710E56D;
	Mon,  2 Mar 2026 17:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="v3xYXlCX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU008.outbound.protection.outlook.com
 (mail-ukwestazon11020139.outbound.protection.outlook.com [52.101.195.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FE710E56A;
 Mon,  2 Mar 2026 17:26:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKDvhUkfj7JUUco8Xq9G/ekfKq05a17309A19MLinFBgG62Yrerze7VCdYIKUhc0WdBYZAmWnNonmRwv9o4v4GgNiGaLIjtUXtYok4S8+dH3l8zsqmkBRRkOqm8XVWD77rBcVi5M/qdXlf05SF7qdHL738YU0dtRADbQ7Zb2cRu9k14pv6CNxmygEGVTjykZFzn5iqh+stHnxlTWhEy8zeKlJZWOxA4WMg2Nso+7wXiug4sbEo1bYE3fgjE1IkO8b6yLoKRsS7ILuiqTGe0N/hYQ6u0oAWTtI6Hnp8gIMt5SNSLiNTO21dnMvO4QVZ4L9jXTj5fPa+O/9HCaF/yUdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpPVpUTurjMEo0TDyiIE+esnVU8X4QqwcE2GSnLgDkw=;
 b=UJxdmO1QjNK6jNXRoG7vG7t1DLoyyCxlDPWmZTJcG4qmMEr6E/kFraHi9M9ZkvgeHtS/6hfv1HTJJzye2Mw5gr2NDfR1aFGeBZdMdYxw78MLaVc70CS5ZGkJE9MD4E/u4y1bPaQZa2x5sxyMICEIGgYP7aLbiRjlM51lV0e5phcaqd/Jd1Q3Ks4i6mNEABiEhC6+OIEUYv6h/cXlKx0jDVySOkZH/p+7ZHSuVuejAo6W9RphI3YXmgj7N2sMfPdzpSAdfS0TMM0KzBCEavq8HqAyUj/ym3VUUJSsmoUwNeR55xO7weuSKxNyjbE2YgIzd8yloULsS8/oskKj8k0A4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpPVpUTurjMEo0TDyiIE+esnVU8X4QqwcE2GSnLgDkw=;
 b=v3xYXlCXRbRnC8xLwTM6cqHpzBYxkFcrBlNQAOL2m0hLAK55ab08xZl2rP1W4sufIZ7/NbeFx4H6lvc4ivqthnGCSJNlzOUJxbGKeIGCZsZ9fEIhNL9j30a05p6UTFZ1JpMQGj4mF5VQG8KhQn+x/mbaebc9ITrvslMZd8skdnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB1838.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 17:26:50 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 17:26:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 17:26:49 +0000
Message-Id: <DGSH13Q82SJI.1PSPF1POKDO1J@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
 <DGRXSDSDMUOI.31863U05DR3VA@nvidia.com>
 <DGRYNXISKYQR.2V6CH8PKCLUDY@nvidia.com>
In-Reply-To: <DGRYNXISKYQR.2V6CH8PKCLUDY@nvidia.com>
X-ClientProxiedBy: LO4P302CA0032.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB1838:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3d8c62-f29f-476a-41ca-08de7880e36b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: w6R+kEpyyyh1tRTwli5/KSzU/LYjyxoIAaaA0Km1hnPdLbcNtv7yUpbv/wToLIv9KgXDrCJRrKLfrQFslvSH1N1ivRj4py36Qe9AWdDKPgDlFUKQLySdEO9tyzi4+nFfy403p9/jZLIxv11P1zsK50jWslcbz7efhSer217zYKOEeG4qerlsJGelLPpdmJ14h533uQr109870G98R2Y+XA6VedxbsFcPcairLXa+QS9MnE4cqxxIKWGdqqLP3OOHnjkYBTwWl1R+s1rJLaz6uarsGRDFxpjzYHVCfZliK9972FCJFAMzKcSOfqcKRnVkGjDDGYXh8WHLhfc9PeKMNcewpyQ2TPhaHRhTfbN/YgyLDlfBw7z6DI93K5AMVAo4Sixqjn6/sN3kxrYRu5KqrHvwrwk3/df4P/P9euAOFb68ozh0HUKYYe254cBI4p9/MTyNBSFRohQpowK1aFxG/NHlkqKbCW0grvmyv/C9ng3gzd2o98arcHrHiCTLfgRPS038Rk6Pn2EH/QWgXbuCyCRN2/MdbrL9hVGXZWCHHSTgzuiSKzn8qaoyKev03oD7y8+8SkMOOdJrKqkWHY/GgeUHxMWoytagTV1aUrURVkaSm5g71R2IWUWgpOCOwxaAO8KAbBDRFri82ji0mx/N1acI4DhZh+l3SlaW/Peu50kwxWSoaX2jhUhoCIualD79woRc9UscxDnbs57lD5zIwvPuW6Xb40Tss8M1c5DirDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFl3V0dWN3YyT2plOUpWbjRBUzY1czh0WEdxdnVYR2Fpem9zY01JQ2hxNklU?=
 =?utf-8?B?aFplb2pFVlV3ZFAxSVcyRlhYSXp6ZmhNYk1VT084cEVwOTRFV1lvcVNaNjZZ?=
 =?utf-8?B?UGNKY2hSdG9jcTB6dmJONzFLU2J1dDR5dzY3dEFrcURiMTcyZ2o1V1lyV0Vl?=
 =?utf-8?B?K3libllBU05kZ1NRM2orQ3NpSml5SDZqSnlTQVlaankweFl6RG5GUldBbTJ5?=
 =?utf-8?B?WUc4OXNtem9ROEJ4amdiY0w5TEZtanVqbDVyN1RReHlvS3JpbElCR3dmd3Fv?=
 =?utf-8?B?NmROc0c4VlFZdnhUUHB0eXFLTGJiUS9CUitiV29MRlpyKzYvSnZ2c1czRTIy?=
 =?utf-8?B?K3Z0YXNpREh5enNlemxFQW05T2xGdUU1aTlzSE5rUHViMVBFT3FPY2tJREo3?=
 =?utf-8?B?Z3NzL1FvWmJXTXVHTzh0Vm1ORWxIcFhrK082aXFKUjFMK3luUXpEZThja1Ev?=
 =?utf-8?B?WjQ5Yk96MldlMEh1cmNXb2JNRDI5K1RiYzJjb01jNWlLYnhlcm9jak8rNHlQ?=
 =?utf-8?B?UXcrWFNQUnh6UGswa2N0R3R4RTZtWW9WL0l6OVFjNzRGdmtlZUdNQWtSSzNJ?=
 =?utf-8?B?dWU3dDliNU5MTTdxd0ZCWkNWTUNzQ3RDd0Ftd0ZyaEs2VmJNVHFoTmtya2FJ?=
 =?utf-8?B?YmRsWXRVVDZyNjBpNDI0UEtzVUVReGxOY1BXZkF5dEl5OElTREhDejFTSVdD?=
 =?utf-8?B?U2ZpelpqTmd6YXdZaW9ydnF6ZXRFL3pva2c1SnRZNHJTQ2ZISU1kQzZMaDg4?=
 =?utf-8?B?VUN2WnU2MnAydHRhM0pGeGI2MnpMVm1McVNFL09xaGNlczNCa3F1dFNiNXBM?=
 =?utf-8?B?elRBZnNTUHRMSy9lQ2pSZUFEQ1RCb0lIdzFMcWMvNURMTEd1bmZBUFBackxF?=
 =?utf-8?B?Y3doTFZ1UzRUV0ZabU1PeFN0eUNxWk9LR29pV0s1RlE5Q2oxNUM2d280NGJy?=
 =?utf-8?B?TmFYMWlITWdqUGs2cFNlOE0zQzhVVHVhaDI4eUJKS3NRdXFrT3hYNHd4SXp0?=
 =?utf-8?B?dW5rZFFJRDU4c0VUVkRybGRtN2ZnREZ0UStIZGlrd1ZHUlZxNTZzbXRsUHRX?=
 =?utf-8?B?V09nMVQvMWFSQkkrdHk3MENQMVh4aEdmRzJGL1lJZXJCdVg3d28vZnNtQmFK?=
 =?utf-8?B?bGNuaEF6QzFEb1JZbFVYUjB0QjJKZE5FQXArRitXeVdhbFdGb2ZyanpzbTkr?=
 =?utf-8?B?bjRwVklaeG50U0JRN3JEdFFPNWQ5UVg3OXVBekZEOURqeFRUc2RSaWlMTDN1?=
 =?utf-8?B?dExYK2JiWW9EWGdQU0VkaWVOVWY0QVRHOTlCUStWTEpodUxzdnFyTlV4dDc5?=
 =?utf-8?B?dXd3S09XYjIvNVF1cXY3OVRnanBuWmhNSy9zT2FqV3NaNHBMcGJya0REejlR?=
 =?utf-8?B?ek9DUU9CQmQvSFlZQ3k5WCtyUXBZVW1qMEt6RUU4ZnRHVkh5N2IvckpjZ1dw?=
 =?utf-8?B?UWF3L3BuckRtckdDQjk4cWM4aEsyRUljVTB0ZjhaMFUrWTBqVWUvODhNWDNl?=
 =?utf-8?B?Ky9DSnB2UU1tcWMwNTh4NWxJTCtzTFNJZkJ2N1Y5cE1hWjVUSGxDc3pOTS95?=
 =?utf-8?B?czBmRWVBZE03Rjh1SDJEU3hJVDhtczdwZ3pSZjJvU2xLNDZWVzZ5dEpTZTlU?=
 =?utf-8?B?UUpiTjhJQzRXRGUwR21JVVREczF0Q0VwR0RuU1FudE95QlVJVkZRZHgwYXFt?=
 =?utf-8?B?UG5SempFTy84SUNxZ0R0YWMyck13ZFA3Q3oxdmExeXBhTjVCVi8rY1lHYllK?=
 =?utf-8?B?R001T2dMLzU2b0w1UkxzVEFEUHNIemZveS9hRWFWV0RGQUNDd2NJQ1hvMzdK?=
 =?utf-8?B?TmRqVUhQT2hhTDNaNVBoNXBWN1lZMC9zSDdyR09vQUF4SEo1VzFrMUFwcHZ2?=
 =?utf-8?B?VUpJN1d5T1RaZVgrd2ZkV2JhSVp3aWVDcWdiemJndHVydlM1MUZLTTQwMTJ3?=
 =?utf-8?B?VklOMDZMdmNOcm1GWDNpQTRQU1ZGM3NSdVFhYW5GR2JlSndpaE9lU2NzT09C?=
 =?utf-8?B?TEhPUDV5U0puM2gzSWNxTnh3QWU3bUNoMXgyempYVm4wWm9PWlhxbExSbXl6?=
 =?utf-8?B?bG51RlRKMUJUVTgxUmhpd0hnSDJsQ1ZKVWJsOXQwa2dvdnlwZ0dkMXlWV3JW?=
 =?utf-8?B?MmZhQzQ2QTMxMzFBY0RqU3R0L3NhTy9uYmVna2h3N0x5QXVPdmFUU0oxb3Iw?=
 =?utf-8?B?blNDR0cvcllCSEpPdU5yTWtQS01XT05kUUxMVGlaek1TSnljelpMcWhTUHA0?=
 =?utf-8?B?WXQ1OWJ5OHVHZXVBd2FzQy9ldGxvYzB5VUVlV2M5YkJMaWJlYzZvREh4bkk4?=
 =?utf-8?B?NFhEWG0zcytmUmZ0NG1zNGdYa2ErL2VmTEZ0V0JqREVpczZQT1FvUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3d8c62-f29f-476a-41ca-08de7880e36b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 17:26:50.1221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPrwMC0b5ixqiY/y7BdiEs/1MF0Wa85A/vKMAota+8dn8DCzkzi5Fys6q6CqBayTmTEyI6Sg4WglZ2D+y92hYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB1838
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
X-Rspamd-Queue-Id: CEFF31DDC7C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,cmdq.rs:url]
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 3:03 AM GMT, Alexandre Courbot wrote:
> On Mon Mar 2, 2026 at 11:22 AM JST, Eliot Courtney wrote:
>> On Sat Feb 28, 2026 at 3:11 PM JST, John Hubbard wrote:
>>> On 2/26/26 7:50 AM, Eliot Courtney wrote:
>>>> Add sync and async command queue API and the type infrastructure to kn=
ow
>>>> what reply is expected from each `CommandToGsp`.
>>>>=20
>>>> Use a marker type `NoReply` which does not implement `MessageFromGsp` =
to
>>>> mark async commands which don't expect a response.
>>>>=20
>>> ...
>>>> +    /// Type of the reply expected from the GSP, or [`NoReply`] for a=
sync commands.
>>>
>>> Hi Eliot,
>>>
>>> The following does not need to hold up your patchset, but I want
>>> to bring it up somewhere just to work through it.
>>>
>>> The sync/async naming that GSP RM uses is a little bit "off". I
>>> spent some time discussing it with them, and the problem is that
>>> sync/async is a concept that is somewhat independent of whether
>>> a reply is expected. Usually, sync means a blocking wait for a
>>> response, which is not necessarily required in all case with
>>> GSP RM calls.
>>>
>>> The naming would be better here if it reflected simply that
>>> a response is expected, or not. I don't have great names for
>>> that, but "fire and forget" works well for what we have so
>>> far called "async". So we could do create a convention in which
>>> no annotation means that the API has a response that will come
>>> back, and some abbreviated for of "fire and forget" or "one way"
>>> added to the function name would mean that no response is
>>> expected.
>>>
>>> Again, I don't think this has to happen here, because we can
>>> go through and rename later, no problem there. But when I saw
>>> the sync/asynch and remembered the very recent discussion, I
>>> figured I'd better post something about it.
>>>
>>> And yes, I started us off in the wrong direction with the
>>> IS_ASYNCH thing! haha
>>>
>>> thanks,
>>
>> Hi John,
>>
>> I totally agree and was hoping that someone would have a good suggestion
>> for this. I discussed this exact thing with Alex before posting this
>> too. So if you have any naming suggestions would love to hear them.
>>
>> As you say, sync and async are orthogonal to reply vs no reply. I think
>> we have several ideas here actually:
>> - blocking vs non-blocking
>> - reply vs no-reply
>> - wait for reply vs don't wait for reply (practically equivalent to
>>   blocking vs non-blocking here, but conceptually the send could also be
>>   blocking vs non-blocking)
>>
>> We should also be careful with conflating waiting for the reply vs not
>> having a reply. So `send_without_waiting_for_reply` is definitely
>> confusing to me, because there may be a reply that we just don't wait
>> for.
>>
>> Some ideas:
>> - send_command_with_reply + send_command_without_reply
>>   - Maybe non-obvious that this blocks for send_command_with_reply.
>> - send_and_wait_for_reply + send_no_reply
>>   - More obvious that it blocks and gets the reply.
>>   - Should be obvious from context that you are sending a command
>>     anyway.
>>
>> Personally I think it's nice to keep a convention of keeping it
>> mostly obvious which functions block/wait. (e.g. we already have
>> wait_for_msg in cmdq.rs).
>>
>> For lack of a better idea  i suggest send_and_wait_for_reply +
>> send_no_reply for now.
>
> One important detail IMHO is that the API cannot be misused, i.e. you
> cannot call the fire-and-forget send method on a command that expects a
> reply. So the risk is mostly when adding support for a new command - but
> if that step is done properly, users will be directed to the right
> method by the compiler.
>
> This, I think, allows us to tolerate more ambiguity in the method names,
> as long as their documentation makes up for it. We all agree that
> `async` and `sync` are not a good fit, but `send`/`send_noreply` should
> be tolerable (I'd like to keep the names short if possible)
>
> Or maybe we can use a variant of the trick mentioned by Gary in [1] and
> have a single `send_command` method?

I think for this particular use case there isn't even a need to use any tri=
cks?
You can simply just skip the receiving part when there's no reply expected.

Something like

    if TypeId::of::<M::Reply>() =3D=3D TypeId::of::<NoReply>() {
        // SAFETY: `M::Reply` is `NoReply` and it's `Copy`.
        return Ok(unsafe { core::mem::transmute_copy(&NoReply) });
    }

Best,
Gary

>
> [1] https://lore.kernel.org/all/DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net/

