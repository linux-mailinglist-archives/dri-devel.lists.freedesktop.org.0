Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJvfLch0p2mehgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 00:54:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9631F88A9
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 00:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A8B10E008;
	Tue,  3 Mar 2026 23:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CJIeMGrI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010040.outbound.protection.outlook.com
 [40.93.198.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A3810E008;
 Tue,  3 Mar 2026 23:54:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSldBE0Y9FvvMG3VNAFgeM73NgUluDl049dNo7oxSDotSGf+aYPyZss4AVkqiVU+s7gfk0RIaERcTImA/yn5f6KWDHFcCzRHtjy2+Ksg2pStQiquO2d6hGns19VF5TvzmGSf3yCpPhOpXYLLFyA3saYT9Gjgz2a+3EEhTdZozABcNLCbu77nhpgcxwXOJNPm6LMAz/q8PS4A1EIlj3UNLtmE4rDHNcTcbW8ElwSL0MSe3CbvoDfBZqFwpCQm6YmHhj8KHQy95ETy+XZxx6zwZ1zNrIACVEZ8DzjnqKgEltrsrjbwHn+ApZ2rUoothC0IWctR8cA69YX2EcJz3doilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qld5EB9i87A1m6ld3RgIbU4qDfexSmfO5tAZYCXvNE=;
 b=IKbn8dsDXtKJiiULf/h0tw8HSIMQBAJi7RvfeJcatfiLei+JGeQmdsWi7V+bEG20mHw4G+HADV/eT7lAEmLVlOKEylwhS1fEOs/xN285zttLLph45AVSSyGGdXdHdlQqpzlFeiGa7ipnjvuhNsUi0o6vCg/6zHv2K94DZ860I+zmIiSHa2pDqQwTGxF7vRy1EB9M7oB+XFWaWlBiRjhs4Ha7XZLS1NXp8ukWUMChF6zvkT3syHoINlKrwjGl9hpM8gY3UYy8tlkA5n9+kIeG5faLep7CCOXfqDoQU1kLEPO0MizzwOaYpV83afJPZSpBkQj1Wq6yn7zAl6Iz3FJHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qld5EB9i87A1m6ld3RgIbU4qDfexSmfO5tAZYCXvNE=;
 b=CJIeMGrIHJVEWcBl3/GB/sUg06pdbNl1O/GHDY7/PZ538ytNNnBwqRsvnmkpuih0mEWg2wCEoMkYr3UTWxZ6qfxy5E5Sxt4rRvF8cKLqIV5Jq5bvXpdP3TrHsN2J4L1PNg+Tb7pkDDmnDdzy9Wl4PJhBK5oBGNXqrlsajZuNEA/MZO1+9ltmH0Xlfvm2X8pZQrKLFmTwDvy5mtKfsAFXxmOWIKcm9jib0use4Div8R9+AGYs+BhpyR1ZgB8ztYoGmc+G89lWCUWE1oTWthG6gR3WzUvxvowvT/46E0U77LAx8vLtUQOhE2hzjMIHbb4JNXCWop+ROpa2vl5Boe7l7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY8PR12MB7099.namprd12.prod.outlook.com (2603:10b6:930:61::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Tue, 3 Mar 2026 23:54:40 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 23:54:40 +0000
Message-ID: <8a7510fe-758d-4223-b1d1-8b7f8afdbe18@nvidia.com>
Date: Tue, 3 Mar 2026 18:54:38 -0500
User-Agent: Mozilla Thunderbird
From: Joel Fernandes <joelagnelf@nvidia.com>
Subject: Re: [PATCH v8 11/25] gpu: nova-core: mm: Use usable VRAM region for
 buddy allocator
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>, joel@joelfernandes.org
References: <DGRGNLACDJI2.1JFEXE1GL1ZVM@nvidia.com>
Content-Language: en-US
In-Reply-To: <DGRGNLACDJI2.1JFEXE1GL1ZVM@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0257.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY8PR12MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6f5aa0-8a8d-426e-3bd3-08de79803bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: W00Hu6OoDKm10c+7dvc6+wRTn/zOt5m9Ce8QRwDgQN1m5WGYQD9F70CDV6yTI6cI8BmG3nSPmzJmk53YCJUsEz0UsFlrjK5Boz5U9hHePJ/N1sltH2xps8+VzYOdGLQh13LWMpR6HQbjvAee6yRoYknNskJrrltOUK+U3aXw3P1FwpW/hxctXX3ZuNhl17AvxKKldCevHk4qRdtrsCW6otWmMXyQAyH+Em7ButPfDsCWZuvLsTTo+OKy867WiVecfj0sik87DYsuOs+UK37QPCH7fV86PVHrCf16vHmuswcLnRDrZ8WxUoJm+fNVYYqR4fBAIoXUGqQz8TyWQ7dd3xZk3nxoGjEVDPqJiXagX0cYzYfcSYbpQnF2Gof5MW51OtsnuqhX7Wqjj0PoGw9JiYmmu+wx0vi0e+8fYeCC0vfELWWEFXBd+C09vYc4Cfoe57IdWStcuQkrIeZt1RNL6XydKoLhK65TuvVf/X0b4bdN6J42BHTWaspOWltZtTWXwbRjM2CWRHWRLE1q2GUCBS3aImmsA/rpwmi9/XY+NRpL7arx1mIYd9r33VTTr+Ty6l2C6w0tqm8WAR37rqNkLrXZvXTvyPc2alNmf15DCNMNN5/8A4FaJMAP2fCXBDL1yVZ+iBQFwptV7DMiRPwGIfpOoE7T8zaOmVy7bFH/tSXPNPWMinupkKd0/tZx4qBDK2pchQ/9hRlWtk05Ubl15DqkH8s40mHv2qPEsNNfLkg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUFUei9jOFlnVG1xMStKS2JVQnA0UXIvQ1BGMHhWdE5oczRmaHJ3VVFuY1I3?=
 =?utf-8?B?U015UXRMYmdwcldQeGwwdW16aXQveUN4bFk3N1VCY3B2UkRNMk5yalBlbExN?=
 =?utf-8?B?NnN4VS9udGxjOHhKZklOY2pSSEpjdXdNMThDSlNyZ2w2aERTMVJBb2VKVUJ1?=
 =?utf-8?B?VXAxOFYzeUFzdVQ5S0gxYVF0TERBWlBncG16UTZsOUFOZkZlZWp4cU5TWTB3?=
 =?utf-8?B?cGpqNzdxMDc0bURjWUdZZXFsOFBzMzBDSHBkcnFtR0RRMWVLSXRYSmwvTnNj?=
 =?utf-8?B?dFlVS2Vyb2dzWDZrOGxvMEhYQmVGMzVVakprRHV6cWF4VDlvYlNXWVc0d0tG?=
 =?utf-8?B?SUNLTVBVdkQwS3RYbkM5RVM4U1U3eTJRM0UxZGNweUFqMkpYZWJzY3E4dG9t?=
 =?utf-8?B?UjV5ci9JbDhvYklOU2RmMmEyOGZnenRrYUswY3JBVjUwUGp6eDU1aElnZmpj?=
 =?utf-8?B?OWFWVmhzdkpZMTVzS2JRUGw5MG4zRGRnbjFES2Q2UzNrSEN3OWVZM0QxYlF2?=
 =?utf-8?B?STBCZ0pRRWFDQWEraU9FR1owVDRlZ2wvMFhveCtRZVZPSXVhM205OERBMXpn?=
 =?utf-8?B?bGdVeUFhVm5WSk5DaTlOeFE1WlBybDhza1ZiVVNWc0o3c2xzdlg1UE5BSHFM?=
 =?utf-8?B?b2dBOEVOYURodEQvTmFKRDVncmExWWg2cGhtdVJxSkJoWVhPcW1Za0RtWUV1?=
 =?utf-8?B?aDFYVWFuZjRsWjhZVnZCelE3S0ZFWFhlVVcrandlUU5ZVjhjMTM2aExwRkVQ?=
 =?utf-8?B?Zm5VSHQvdURBMkhlbmdXekxWallrby9STXAxbW9wRzdpTENwTWE3RWh6SFdm?=
 =?utf-8?B?RHZRRTNmNzkycmRzSEd0eUJ0RGlpTFFrQ0NuQk1wOEZKdm95Z3JRZGVBSEIr?=
 =?utf-8?B?TlU2ZmpBdjh4NnQ2K2lQRjUwN1VhMDhrSktnV0hXZ01CVEJpRmM1T2NWYlh3?=
 =?utf-8?B?WVVXb0lhTXk5bG5XSWxFZHpDcVhaYjUyZVlNRVB2emdlQjhHeEllZC93dUlU?=
 =?utf-8?B?SjdUYzdZbFRLUytxc1JTV2RiSzdJZEJaODh5MmlLRnZQNWJkQldxeGI3QnBF?=
 =?utf-8?B?NWxQdnFrSmpzaitVMWtnREdXditIcUtXYithOFl3Qk9qVDRZakU2TG8rY0dO?=
 =?utf-8?B?MVRpeEd2OUNsN0JRWjRZcU52VFVFMUljRFBaeVNkTjBOZkI0SlV5Vk9CUDFr?=
 =?utf-8?B?dGhhVkhpb2xyM3lSNWlWd3J0YVo5L2lpcktJTiswZVM1dUdpdW1NZldkZkJj?=
 =?utf-8?B?UklWOENnbEF6QjdkaXBER1hrV3Nqa09XWXdjckgxKzNRMXQzSFliSDFFb2R4?=
 =?utf-8?B?TC9UZEJyWEdQZ21DVTdsengyK05xUm8vZEtsY1c5UWhUbEYyOHoyblZQOHlJ?=
 =?utf-8?B?aWtZTHlsZkI5SlVzUHhjRitPZElOelJKUFlOcEczMSs0YmRuY3V0SVE4UGRR?=
 =?utf-8?B?MWhaNjBzVDNFc3VtSEZHRTVmUWcxN0d1QmgzcmkxcHJVY1lYT2U2azhkbk1i?=
 =?utf-8?B?YzE1TTd5b2diMTBiNVRQd2pDNUpjRk45S1BjLzIyZWRETmRkU0NyYTNHcEhM?=
 =?utf-8?B?L2g2dkpveXdXSmVtRU9VTEJkZWJGdEZWS2JXcXhTY2taQzVQYjg2cVg2NXBN?=
 =?utf-8?B?Yk40Z3Q1TC9DbXNyR1hIVUtMcXdyZ1kyYXlFYkZFa1p1SVhxTm0reE1xR3dO?=
 =?utf-8?B?N3lOL2Evdll1RUd5UFhGdHRXUFF2MWZIZkdiLzk3MEZHK0VFcTNqMzhHZDRr?=
 =?utf-8?B?N3ZSOU1Qdmx5a05RblhvWk84cExSL0FnUHEzaTdhZXFuZ3R4bTQrSjJvNzVz?=
 =?utf-8?B?TnBhdG9BcTVjQ0tzMXJFT0R4QVpNRUdKcVdYNEdvR0dURWIvVUhaUE5GS3lK?=
 =?utf-8?B?b3Z6c2NtS1NZOExxaUQwODRvNWJ5RCsraHJQMDlRL3VDK090L3pEZmNTaW1o?=
 =?utf-8?B?dExXRzk5YTloSGpEN08rWlNMNVVNSjBKTmVrYk5ISjh0a1Q4T2k0cjFxWVlq?=
 =?utf-8?B?WWJtdysyNXpaVkZ2em1LSWZDcFdLZ3NJenJnMWFkaVd4ZjlwaWd2cDlTcW92?=
 =?utf-8?B?NE1NMjFZR3czd2dxaThtZitWdFdoYkV0ejRVUnVCcmFYcnhuRjdNNUtwWkJW?=
 =?utf-8?B?TlV1Z3JKUWd6OThPSFFDalZjQndRaDF0WXBRTjg0RGxsaStBcHNWZWZmU2dn?=
 =?utf-8?B?SmFYekplVGthRXhyYUdMNW9FN0kwZk1PRDF0SUdsZ3E3MUE2UElvR3VrQXMy?=
 =?utf-8?B?OUl5YWN4U2JqM3ZOSjRmZVl2Q3lxM2hZWnppOWFFbUYvUFkzK3hoSE1rQytW?=
 =?utf-8?B?Zk5DOW1vNm9VWVh0Ny81emtiY0JtTGJnU3h1YlZpMlpKU2tvTDZVQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6f5aa0-8a8d-426e-3bd3-08de79803bda
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 23:54:40.3130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQM2VWYUJASmIU/N+iTmZ8wtU6ju4KWafu9DBWGJhCAv7EgkIabqoN5zhVZDMCav7ngOmXmrgJzDjCklrKPT5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7099
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
X-Rspamd-Queue-Id: 2A9631F88A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,Nvidia.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Action: no action

Hi Alex,

On Sun, Mar 01, 2026 at 09:56:30PM +0900, Alexandre Courbot wrote:
> The chain through which we obtain `usable_vram` is very inefficient and
> much more complex than it needs to be.
> [...]
> Which means `boot_params` and `BootParams` can be removed (and the
> `Cell` import), and we have something simpler and more direct that takes
> ~60 less LoCs.

I like the simplification and I've made those changes! Currently testing further.

One concern though (both with the original code and after my changes):
`FbLayout` is ephemeral, it is computed during boot and then thrown away.  I
think the rest of nova-core should be aware of it. Other subsystems may need to
know the FB layout in the future. Of course we can do that later, but maybe it
will be less churn if we store `FbLayout` for longer term reference after boot,
for usage say by future mm code etc. May also help debugging, say debugfs needs
to dump the frame buffer layout etc.

> Correction: patches 3 and 5 won't be needed anymore and can be dropped,> it seems.

Ack, with the simplificiation the extra patches can be dropped.

thanks,

--
Joel Fernandes

