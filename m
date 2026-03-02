Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPg6GVkVpWmL2QUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 05:43:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B811D2F81
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 05:43:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2801D10E42A;
	Mon,  2 Mar 2026 04:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y11mk9hP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013016.outbound.protection.outlook.com
 [40.93.201.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9B5510E1A4;
 Mon,  2 Mar 2026 04:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+6m8Hf6fkbxGGoWSKlFTECZGkIBAFqJYrDx/elOuMHuh1aUUe3l8eRm20uAy61ABkIBx+RsO4ioMV+J0JIWTbaezSPc6W9Nj6wwH+tMVt3rE7trthhwXAknHVYE/PjABWKElRUypHe39w+tiDfffS09sUEeO6db/tggnZPPNzJYew0hRcGDrvtz2e57W7LCxR63aVhQ/0+niV77reYzUeZfYnE02Vsa7LuH7+hLZakKtPT8yqWRXd8Un8/pg+6yhgAebt67vFC7PiS8h0rySHn7B9WTHHQL4t3tzj/tvSzcA//CURk+KUwiXjS14R7zyQGblheOkcdCzRYBu6oqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cj5cUvF2uPs1cTnu6bqb2VKfdPIMsbhcvzP4B6R0+fc=;
 b=n7P+VfWErzjWk5FQNlXsXd/UIsQzFvDuJd3pKDETnV9iTYYDTXwkLl5sTdJmVHNti2FcUlwKVYYpnwXKVmOBECi0Syy9sH+emPjnS2XTTK2qAwYqsptlhKtwm+Rg8nqM0uTqxNbrytI1G4RgsqfOjbM9e2ZFoEDDw8Xe+9TOUTt19KgqeEr4DD5N2SPt9DZw8d0UR6x81gxrcyNt0x+ezLMXz+Vv1tU8uqJZSP1yl9QT2m4O79npZw4EnotxH/r21bVSt5gTM6xmDcVR9TncVzqnx38OxRztGu4P6mns3QAF58SwLjfMC1KNCkLbQklt7qUZK26HUxn68hwv6dh31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cj5cUvF2uPs1cTnu6bqb2VKfdPIMsbhcvzP4B6R0+fc=;
 b=Y11mk9hPycNJY1z3T59duwTeHFx6jzeDpLZVAEzm2etc/5GHhCggKGUUNGVcuhKw2dTPf6NvjNIMqhTH8qtAECzb36LiHPanCPmvg7TSOH9280AZ7bPduJETS6J50ynf59QOETbqbsBnqkrQmMd+nFPAwEaji8I9SnYKR7djGLh/ZkexKzPSax9g/4QaBJIKS8hjojCHU3gdB2Ec9IxhzcXDRYpUW1fEGE9XEMuvxcN6gNkQ4tkxUje3Rupsmpib4bhx4A5CvG59gEIP3UR+WNh/LrrpgFuiRHW3yhLn8m/pKW1zq1L9u3iDNtqmDC4b+QSGiyl/sSBufMlsswTByg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by LV8PR12MB9271.namprd12.prod.outlook.com (2603:10b6:408:1ff::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Mon, 2 Mar
 2026 04:42:56 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 04:42:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 13:42:52 +0900
Message-Id: <DGS0S6OL804P.3FS5NGQE1CWH5@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: add sync and async command
 queue API to `Cmdq`
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-2-c7e16a6d5885@nvidia.com>
 <a3b7a5c3-9689-4700-981e-d94bd2b5091d@nvidia.com>
 <DGRXSDSDMUOI.31863U05DR3VA@nvidia.com>
 <DGRYNXISKYQR.2V6CH8PKCLUDY@nvidia.com>
 <0f53c0e3-e745-48d9-9576-ce8402b7593d@nvidia.com>
In-Reply-To: <0f53c0e3-e745-48d9-9576-ce8402b7593d@nvidia.com>
X-ClientProxiedBy: TY4P301CA0022.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|LV8PR12MB9271:EE_
X-MS-Office365-Filtering-Correlation-Id: b853f81e-a530-4dde-58d8-08de78162c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: +Enf6A1fR/ZNYeaqac0RDb/Ldv/Ii+gwClU15PCi5v/ZuWS0l7O+eYgi8rbcswaVjiSh+aubAZMpkTRctFDBir2TQWpz5w1c+OCQldNrmpJqQq4CdyYI60oKjv9nUm/OttE1SoZUwBnd7q7iovSbNLhs3jp7gC6kUR/754r6Icy9IpgqNlB99DmJVCGr1Gtya113wkuB9TUSGq6RAwHo85lSX1WC6JYCB+cabia0F+e2wP2roDltF20616F1EY8uhv/eJfsWFCwEJMDlHX5ApxgmFqLNUptwF57SEaiu5essFKTQGKIGpKjFdHWPN83lwgIMCy6kUFtw93i6zQpwPelsTPY7YsU7EWLTdlh1tUv13/aSmNpC0fGkScTZvNVYTOFwaijQDhkBdBNcnKjS5e9i+zm0kpMCJbIio0jrC6PI84jmr2ImhgGb6852Dwe9580vIH0IScbTYuI4n8DB7951mdYIBHUWMO2kse5jJNYnrPdcVXqzNHPLsBAOxMjkNTmalNvuFBygnQWRIimyhvP5T4bI8qIrmo6MzSx8W125U0VpU1GQ9RG71ECN322jMFr2Psk+G/WUt314kcTID2e14buBZ7EjHLgRtUJnjS1yzVT2nCwG+wIwygGJANdiB7Jw4A86DCl0dhM+egyK6nyR6aPk0S0gDR75WpjRvXy9v1Ig3ocRsLa+dM4+KMJs1GVizcb39E+IwDsH5meRnGacBzuMX4qpjrpZx+SmoXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1ZucnJKT0RxcVloNkNJazMxOUQ1TnFCS1duajhKamQ1NmI3Y1NlV0djbWNT?=
 =?utf-8?B?dlNydHhRbFNsK0tsVHJyRmpKRVZBa2ZaRU1XWWFzMjR1QlJWeWJuUHl1S2pC?=
 =?utf-8?B?MFZkcUtGWXI4aWk5dFRjcUo4dnJEZVlUQ08zcTN4K1ZBTHZlZ3h4bk9nUnly?=
 =?utf-8?B?U2xGNEFrZmVabm5PMzAwdFRuR1diVFpJN1ZnQStIazNXQTBRTDdOTmo2NjNx?=
 =?utf-8?B?b3FEaEF6NVBrTEt6NDFOcktoUHNlTFVyZkZMYjQzRjEwcEs5VnBFU29jOVU1?=
 =?utf-8?B?ZjZFNitzSWsrelBkMDRvMGlmL1JFcXdSSWV5aHp3OXd2eW5HZ3UzTHlVajlG?=
 =?utf-8?B?VDJ2RXZQOGhKTWNXZXNJZXpEUmJPVFhWaFlMc0VLdVpJeUh6UHNDY0NrNWhJ?=
 =?utf-8?B?YjhMakdGVm96Y3dDS053ODFnVjRqR1NJSmF0MEtjWkFJWjNOWWhQMDh6VllB?=
 =?utf-8?B?ZC90TGcvUC9LVjNqdDhYOHgxUWRzTTR0MWlBVFduRGYrWUhjazlsUXN3TjZu?=
 =?utf-8?B?a3pLaTI5azJoa09hMGZ0OHg2OGJmSGxwYk41MWVaeFVSMFBlVm91R3FjeG9S?=
 =?utf-8?B?SUZpdnE0aE1KRU1ta1F3SGpZQUVzbWZVTTdVTFdMU2QzRGpxdnlGdVFTbEVP?=
 =?utf-8?B?TmY0Umo4TmdmVXo4eFZpOVhJbTRZdXo3cmxsWElyMXRCWFVNRnNJT1VLUmlD?=
 =?utf-8?B?Tkx2YjhXcCtaRjRyNVN6bm83OW5YYkJkSCttMU1oRUdlUWx4QVlUVUJ4U3Q4?=
 =?utf-8?B?ak9EQnhRQ0ZCVEM5UkpXTkUzbXBTOHVPU2N2U0J2cEJpQTFpSGowU3VnKzBF?=
 =?utf-8?B?Zkw2M1gwZjNMRVoxL1IwTmFUNldxQ2ZMZU5BeFZaYWNwc3dRWmJmTVduSTF2?=
 =?utf-8?B?NTN5MnpaSW14YkZhRDN1bE5jK1RkanNTcnowVjlGUXI2NGlGaEVOMnU2Sndn?=
 =?utf-8?B?R3o4c0k2b1QxdVM2eC9aV05mdm5WaDJqRmJlakFQeFBKcjFTejBaVXByQ1pv?=
 =?utf-8?B?T0dJZXhXbU1rZ2hkR0NvbXB2RTgxNXo2OWl1aWdHNWZaT00wVnJhaCsreXhE?=
 =?utf-8?B?SGhlY0FIQXVMSTBNRmxHZlRtQ2lCbzJUbDU2QXlsN1FBcFlsWVMwNTR3QWRP?=
 =?utf-8?B?Z1AwTUNCV3BwQmdPU215SWRCZjZESkpMWWhnanJmVzdiTUdWdWUyWGdQUmFY?=
 =?utf-8?B?eUhPTGVvdVFBdi9STnZZN1JOT2srd1lnc2VXVDYyOHBUVW1kcHNzSkthbHpz?=
 =?utf-8?B?Vk8xd0xKSTJMaG9Xckk0MEVuVDlGN01INkNpak9jaDQzNk5DRVRQZ2V0Ymc1?=
 =?utf-8?B?Tk1ZdEtnaUlrRms1RWUwZkZLeW14ck5HL2wzTWMvR3c2bVR4TElrekRIeUJm?=
 =?utf-8?B?bGE3QXRYT1VNYkRURk1LYzVsL1FDbWloVXpEa1l3SUpsME5HaFRDU2dYUGpv?=
 =?utf-8?B?WTNJRTNRdUtKNmdRWFdxd3A2Nnk3cEYwZ2VoQm1vYm5IT2pJd1k0d2hwWHpu?=
 =?utf-8?B?eVJrazJtZ1BXMXozeHJ1YkNTTlRwekxLWW80aDArMEdMNkEvUjFMcmlJS284?=
 =?utf-8?B?UzJqWTZDeXk1bCtwSWlLdzZOQXZoZDZLaW93U0FEbVdBWE1lcnZaNnZpSDdQ?=
 =?utf-8?B?UHpMN1B4RWNacjVWWGVRTjNGSDhReGdVMXJRU3BpV0tzaWdmWFBMU2srUFRr?=
 =?utf-8?B?MTBZRDBueDh1OUZpM281YXZ2SnNvZ2hTVFN1OTZjanhMeFdNZ3ZIcTBVSUV0?=
 =?utf-8?B?NWlMOGM2eTJkdUFJNWtqd3IyWUhVbG54MTBVcGVXcHhQZndrZjIwMEdONTVI?=
 =?utf-8?B?bjRJYS9IUG1KL2Nwc3BWSFl5SWY4aVVESE1rOVZXVS9XcGVQY3R2Y3dkZFBR?=
 =?utf-8?B?YlNqNHEzbzdNOURaTjF3Y1hPeFFGZVVzNE91NUVVVWkzcjJCdUVXS3JWOWFv?=
 =?utf-8?B?SkM2VzJxM2o1bHd0bXMxOXlhS2o2UXo0dmsyMVBiT2VRUkd0dWk3eFpqLzBk?=
 =?utf-8?B?Q0tqZHNpT2hBcjI2TmdtdVBubk0zOVV5SHRoZ1ZGYWVVREQ1L2VFZC9lb2Zs?=
 =?utf-8?B?SmoyZ0ZHTGdqV1dBL2JZMVZ1TWtOTHcwVVBHK1RYQXlqdDVvK0Rpdm8rbGpL?=
 =?utf-8?B?eWpWSVI2T3RlUTNhenZKYmRvVEtlQ0ZpTHhOK2NnTk0wUjlSWnpTTC9jejN2?=
 =?utf-8?B?TzRkZ3ZYTmxqRUMwMVpLbjV3M3Q0eCtWRE1nMDRKcFVBaC9qVkFaZnJRdGt3?=
 =?utf-8?B?YzUyMk1iVmtBd0M1NW90ckNBVUQrL1ljVFZoVmsyN1NoZkpraEliVlA4cUpN?=
 =?utf-8?B?NU10Y1h4c282cVZ0RVFpMW9mc2dnRllURVU1OWdIYXA0dDlVVlB2MWthSjJQ?=
 =?utf-8?Q?vDidvFZuTJ+mBSFsdkbDagswUk64uwoBqnIfz4W+6Njxn?=
X-MS-Exchange-AntiSpam-MessageData-1: n13ACNlXjT5GGg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b853f81e-a530-4dde-58d8-08de78162c49
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 04:42:56.2025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gr7uCbRRxg+r1t/WgI8xiTxRelYELGDbKlk2ggwKH8NXFbkh/jeqC2uqwTvYA3Br//Q6oTFPd3dXk6tTWh0znA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9271
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: C3B811D2F81
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 12:08 PM JST, John Hubbard wrote:
> On 3/1/26 7:03 PM, Alexandre Courbot wrote:
>> On Mon Mar 2, 2026 at 11:22 AM JST, Eliot Courtney wrote:
>>> On Sat Feb 28, 2026 at 3:11 PM JST, John Hubbard wrote:
>>>> On 2/26/26 7:50 AM, Eliot Courtney wrote:
>>>>> Add sync and async command queue API and the type infrastructure to k=
now
>>>>> what reply is expected from each `CommandToGsp`.
> ...
>>> For lack of a better idea  i suggest send_and_wait_for_reply +
>>> send_no_reply for now.
>>=20
>> One important detail IMHO is that the API cannot be misused, i.e. you
>> cannot call the fire-and-forget send method on a command that expects a
>> reply. So the risk is mostly when adding support for a new command - but
>> if that step is done properly, users will be directed to the right
>> method by the compiler.
>
> Naming is not *just* about risk of someone misusing it. It's about
> being able to read things on the screen and having a good chance of
> understanding it.
>
>>=20
>> This, I think, allows us to tolerate more ambiguity in the method names,
>> as long as their documentation makes up for it. We all agree that
>
> Really, no. Let's do our best on naming, *in addition* to the documentati=
on
> and having Rust help lock things down.

I personally agree with this take, and if it takes a verbose name to
make it clear then I feel it's unfortunate but there's no way around it.
Especially since we have a few different concepts to distinguish between.

Agreed that we are safe writing it since the type system will help us
though. So mainly just optimising on how easy it is to read.

At least the current usages don't seem to end up on long lines, so I
don't think it will introduce too much noise to have the function names
be a bit longer.

>
>> `async` and `sync` are not a good fit, but `send`/`send_noreply` should
>> be tolerable (I'd like to keep the names short if possible)
>>=20
>> Or maybe we can use a variant of the trick mentioned by Gary in [1] and
>> have a single `send_command` method?
>>=20
>> [1] https://lore.kernel.org/all/DGRJJA3068FV.3CE7J7SKLTN8O@garyguo.net/

I guess this would be the approach of maximially not implying anything
with the function name and relying on usage context to see what it's
trying to do. But IMO it might be better to give a clear name than to
introduce more type machinery here since this API will be much less
widely used.

>
> thanks,

