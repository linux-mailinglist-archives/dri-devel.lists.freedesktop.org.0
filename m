Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPG+J99YrmngCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 06:21:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C922233E2E
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 06:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15D210E0E8;
	Mon,  9 Mar 2026 05:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uoP9ybF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFAB10E0E8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 05:21:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7GFdaOABeA7MVzNzDvgheCoLSn6eA7U7i22d93T/oH3O6SWBMO2oiKQoDDE6a1UY1nsjeZD3+yvoe/ZcJIXxotfQo9FvrswkGUQnxplJ4zzKfNy0KpsTsIuCOs6/iTS9CVGKfFrDce7TFaHdGlrDBfkJZNQcrWjaGBWS5Y+1Pex4YR4ADYL4tkY9DZtnW1cOmH8d3F8TzCXDnpR9e7kXtxK/rNkIwl6A8aPLC2KmqCbB6IiVXahXUB3UPJ2v3bBi+OFipXJZO1wl1mg2nfUYNSrOum/12BNfw9k+zfoxLlSwELrLh4qkLv9ZRhIT3WSTt1W4GYzr29sBXuAaB9pqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aj/abjD4f6nkvH/+lh+MDs/M1ILVjTClOlqy9cLn2BU=;
 b=goDRf4t9fRXYUGxiAMertPff6nn+AEwipUdfsQ6nxK75E+uLJ7qHzabCuYAVPEcP40Dy0bXVB/zds1eKWvK6SW5JpLW1kFq6IUOdEyDnnTkaR+Xy0cM4jaq1NyC5HuK0eS9IUc9+vtp1wsz67TEOA2yNK3Tyj48vDrGJHdKsthimFnWZqOiwOEQ2vbNw4XKQLfJGnX50UtwiaFuJFT/2DaNhKq+OkDwdUY4oazegpzYA7GR1KcQdxllkC5jIvpkOT/OPo/3/k2r9/JV6pEed/6xEHcsxXA2eWliV8x0CIA3v5yaX34itU/VTjVr+5wO9a9zuZRechis32pLQ8hvVTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aj/abjD4f6nkvH/+lh+MDs/M1ILVjTClOlqy9cLn2BU=;
 b=uoP9ybF7H5hQS51C5rEGSMvKbMkF+suvTZWlxikF9kFplcJ8gq4A4Zsq2i25zUvdfOx7ErKnmx0aD9scLNVJ+nkmc9RX0L+iomitzcDiRWi0EwotJlRpH5IIMlorvKBXnXUacIi1E3yO7D4Mhu4rFnfdqIUl2S974OwqmiSatiEAOwcuonZ46cAhAxwzFLKcHmNPNl+fylDAXEm5jJj30hchKvJYX5rF7Hfl0SwFvHhpLkhzKa/zKLUcO3JTCzjEUh1wTVutw70wdqGcdnhD/vhqWrLEo3tDgfO1AM9BS13A1/JhucioIcOEjUtrkXBECix0Jv//NpSIuoKY5QXL4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by IA1PR12MB9468.namprd12.prod.outlook.com (2603:10b6:208:596::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Mon, 9 Mar
 2026 05:21:26 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 05:21:25 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] gpu/drm: tegra: dsi: add support for
 Tegra20/Tegra30
Date: Mon, 09 Mar 2026 14:21:12 +0900
Message-ID: <11698628.CDJkKcVGEf@senjougahara>
In-Reply-To: <CAPVz0n1Jf=rNyNu-M9Zp0aUTWm61yo_VLXJ9QHTvAV77ZGn+9g@mail.gmail.com>
References: <20260125131323.45108-1-clamor95@gmail.com>
 <CAPVz0n3FXMZOEhJCw_ajQudWfHMcg9-y32pFiejgphH5_Q7nug@mail.gmail.com>
 <CAPVz0n1Jf=rNyNu-M9Zp0aUTWm61yo_VLXJ9QHTvAV77ZGn+9g@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::10) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|IA1PR12MB9468:EE_
X-MS-Office365-Filtering-Correlation-Id: efcc7665-daa2-4b97-28f3-08de7d9bb5bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: XB/8T1V8a5HkiXwpstCzbBi/VGeGqyl+abWp7UTKqiCQio2+8I/1Z48sCsMQGsMtqf54x4cNSYbZw5V7MBLwbcCcwlS8vXQKJxn547qaszkvSslt5x+2iDEmxfDciA49OQjaFHqpIBBM1mL/pmUFMRxwPxvpwU0/pvGkTgNRzSN4gARm/rbRDeQ4+DC1fdEjpvhU8VHwXwhEb+TO61CTdAeOqxFuNkya1DbU98Il/vz0VnId4ZyVRdlIvue06wuTxnU7VkjK+YANQ+Vs1ZnweEE2K8Q4MT3Ehc5LvdXM1873zgNrHQM5vBTCXxsLZj4mclJpM11GHZDSd5ozEQ8PBH0dRko5XXXbuUFajxOSBQERC4BTlyNbLl0PghSm32bbGEHhjZ+mCrGf4uY990KwUjXnlHRbCentdD7wPzcjgDvto7T4Vvd2EzJEv9l8u8objcdbtOkYafMSR5c1m3PItAxvN7O/SFoCEFJGUiQAZihr0+cokupkWvTL70h8RVTFbiRNaS47s6Jtip0FrmkfSqyhArzMzWKk64xsZtz4tjEOQZR3/nyUtji7gaiVIx12qUBKA9+ouRZ9duhekm9N87xJBXai3ipM/dlzBUY1n9dLEMIqLvkPa+C6KkSeT79QumR+jVCIU3u7G2mvzU4gnjumfP2dvXavSr+VwQKCBDvj5hTgbmPMHeWwwwase1hV9JsyB5eUy0HWY2Qs4SZM4aKLPgGdrq7/1TXWz/mSe70=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTAyVThpcDBDUDlXZ1NlN0dEUk5PNzBiQUptdGxxRldZTFRBTllKRlVZZngr?=
 =?utf-8?B?YXNVTlVpbHlEcEE5Ny83Q0d6UmM1SWp2TjRTN0F3ZVRXWWJEQVUyNG13KzZx?=
 =?utf-8?B?QlhEUWdMTXdzN3R0bGRnc3craHg5dWZMYitsdWpjNGsrOG9LYU0rbjVuM0Jk?=
 =?utf-8?B?WWE4NXd2eDg1ZDd2TjhFc25RVE82ODVRQXZUR2lMbndJQ3JhNXF4TE9GaG0z?=
 =?utf-8?B?VU8xcll2OW13M3JLMC83VDlibE5SdlBrWm15d1UvV3lwbEh3VmZCRVQ2UXYz?=
 =?utf-8?B?NUJFQXE5ZVVxc2FnZlllS3c4a0RGZSs3d1FJYm5XUDExOXZOUm1MdXN1TWFz?=
 =?utf-8?B?NjNsaktiSTk5eU5xQ3hhRXpKdTJEMDczUDVaSGVUeXBzbjR3ZlpwQlphV2E3?=
 =?utf-8?B?SEovOWpBb0QwdlVlaytNMXZ3amdNQ1ZLMi9idk5HOEdSVG10NmhxMEJ2clE5?=
 =?utf-8?B?L1lxRkFCRDFsdDROeTdXZWhQVjFmVnN6MXhUdUUzckUxcS95aGE4NGJUSnZZ?=
 =?utf-8?B?MlNIU3pPMG5ZbjlOc0wrcExVNDMzM3JQdHlETCtCT1dDVGJiOURBcUE1bGZM?=
 =?utf-8?B?d1pJVENaN2QzVFVYWkFidStDN2UwY09malByV0MrZTNUbXRFbnZLbzAyMTFT?=
 =?utf-8?B?amJxaWFpOG1ENUJyeG92T1hXVG9ybmMzOTI4SDFDUFB3R0d1aU9wQ0tQYVFk?=
 =?utf-8?B?NlErVWlOQkZwb3htbDVrcG9NYWc4S1hzcmlYeGxkd2Jod0NaTy83aTBzSVRE?=
 =?utf-8?B?Y3MyQTRlY3lnQ2Y3ZmNSeWVFbFl1UDZKa3FudjdvdHFXbUkwZGprYmlKaGQ5?=
 =?utf-8?B?TlVsZnZMeUxETUVJQ2pnYzVXSnZqZkppNWtjL2V5aTB0bXRaZTRvdjIyV2xu?=
 =?utf-8?B?SWRhRTc0eUY5clBXM3JaQ28zY29uS0EzZkUwNXE2c2duc3N0eUxqSHluRXlU?=
 =?utf-8?B?NjZ3MEYrcjZ0YjAyVkZkcFZSOWlpK0RVM3VubCtSMnNTNFJvOHBnY3dDUDFU?=
 =?utf-8?B?MTZKbzNBRFpxcjhQNjN5SWIzZ3NjZjZ5ZmdSVjFNcU55N2orSER0Vk16QVZV?=
 =?utf-8?B?bjNaL0ZqcElrK1JDVVVZamR1U1FISENQOGFTV2xQVFQvaitYQkpHUUl3UHQx?=
 =?utf-8?B?SERBYmxMbnRSYjVFQU56aHFOemkxZEdSa0syeXo0Y09acW9WR2U0N28va1NH?=
 =?utf-8?B?VFF1YXdkZjF0M1VETE5oYUdrb2xuVDNzVnBZSXJSVTFXTzVDTVBSOHREQlh1?=
 =?utf-8?B?NzJ6SkZRMWhkOVVvcmJLL0o1SlRhbk05NXhuV2hlblpLS0ZPLzVxdys0Qmk1?=
 =?utf-8?B?cU4rYXNUQXQzL282NHpramlKUE1jemJYTmFnc0x3T2Jod01iL3BkY013UVB2?=
 =?utf-8?B?aEVlTU93N3c2VWd3VnBabTdEcXBLMW92OWNjS1RmU2VOcFhIZjdweTh1RGVI?=
 =?utf-8?B?V1R2V2pyUk5vQ1FFdzBKRU9LMkZwdTQrZWlMS20xUjh2cnVMVlNjUUx5VVhw?=
 =?utf-8?B?VlVTNWVIRFVXM0x3OU9DNkcxaSs0ZGV6c1EyZ0J5VGdXVEpOVy9UQlppSUR2?=
 =?utf-8?B?eUNOemdpaE1vK0VPMUw3UGdSZCtLYk9nRGhVZW5oMXNwOG4zeC8yUGNLTkZO?=
 =?utf-8?B?ZlBaaUswR3VvT04xaE9CVklXNjJBZGZONVIvd00rRkJ4TkNMZUhHZ210NDJs?=
 =?utf-8?B?ZVJ2dC9PZE80ODJIMnhHeTh3YUZockhtVWloeXV2UzVkMjN4UzRzUzVZeklk?=
 =?utf-8?B?Wlg0dGpJL09yK0xqVS92Yi92V1NQdkR3Mll5aENRVVV4Z3hXRzNhd1RlaWNT?=
 =?utf-8?B?WHFzeksyLzcxVjllUiticy9NL3I5akxMcFVVbDAzMmFkbjlLNG9LNVJOVW1t?=
 =?utf-8?B?TFc3TUhLaU0zcS91L0FVTlRZR3JoU3JOUUJ2VXUzTFhKcGsvdDJ4WWY3enJ0?=
 =?utf-8?B?YXVtOS85MU5LY0pkQVJGRUF0R1hnMVhkQUNVNk9wcTVpZlMwTEpXNUwxMzFw?=
 =?utf-8?B?cUM2Z2hGcWNjVFg4RzVRRklKazBaYm5qN3FVVFNacU0wRE9GeDlxMktIQk5p?=
 =?utf-8?B?ekJrV2tVYTM5ZEpJUWdVd2NnWWVSMFNKRGI1VmhiTE80ZTdVQnFyY0piOVY4?=
 =?utf-8?B?MTJPdkJyMW5lVzgybnFOaE5OcjcxZ0NGOHpOYnBSWlN2NkpteDBSdlFZQ1B5?=
 =?utf-8?B?OFI1TDdidTVyVDZFekFGZDdHdkZReXVuYjh3SVp0VS9jL3hTVHU0aFJxaFc5?=
 =?utf-8?B?WG1SSUhqZ3I3ZjFpMjJ1S2ppMWQzSTdWeG4yL2ZoSG1zY2FlNSs2aVpNTzJa?=
 =?utf-8?B?NlRwWHk2ZzdJS2ZjMzVnWnRjTDNTamhsMVg3eUs1c0hKazQxQkJLTUw3Nmk5?=
 =?utf-8?Q?pvcz+PsgC7btcMni66+xDgSbNglEoNqeNGFzEk3QyUQzx?=
X-MS-Exchange-AntiSpam-MessageData-1: 09Ykb8zZXs3uSQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efcc7665-daa2-4b97-28f3-08de7d9bb5bf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 05:21:25.8542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaIAHy5tk4cq61QaeinAieCT4RwCzdxQcHjIKPlMNzWAwl+kkBroFvYuAv4AZlY8KR6Mc3QqV+z9g7JyjGQv0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9468
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
X-Rspamd-Queue-Id: 0C922233E2E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,nvidia.com,tecnico.ulisboa.pt];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:diogo.ivo@tecnico.ulisboa.pt,m:clamor95@gmail.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Friday, March 6, 2026 12:50=E2=80=AFAM Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 5 =D0=B1=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 17:21 Svy=
atoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > =D0=BD=D0=B4, 25 =D1=81=D1=96=D1=87. 2026=E2=80=AF=D1=80. =D0=BE 15:13 =
Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > Tegra20 and Tegra30 are fully compatible with existing Tegra DSI driv=
er
> > > apart from clock configuration and pad calibration which are addresse=
d
> > > by
> > > this patch.
> > >=20
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >=20
> > >  drivers/gpu/drm/tegra/drm.c |   2 +
> > >  drivers/gpu/drm/tegra/dsi.c | 107 +++++++++++++++++++++++++---------=
--
> > >  drivers/gpu/drm/tegra/dsi.h |  10 ++++
> > >  3 files changed, 88 insertions(+), 31 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.=
c
> > > index 4596073fe28f..5d64cd57e764 100644
> > > --- a/drivers/gpu/drm/tegra/drm.c
> > > +++ b/drivers/gpu/drm/tegra/drm.c
> > > @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops,
> > > host1x_drm_suspend,> >=20
> > >  static const struct of_device_id host1x_drm_subdevs[] =3D {
> > > =20
> > >         { .compatible =3D "nvidia,tegra20-dc", },
> > >=20
> > > +       { .compatible =3D "nvidia,tegra20-dsi", },
> > >=20
> > >         { .compatible =3D "nvidia,tegra20-hdmi", },
> > >         { .compatible =3D "nvidia,tegra20-gr2d", },
> > >         { .compatible =3D "nvidia,tegra20-gr3d", },
> > >         { .compatible =3D "nvidia,tegra30-dc", },
> > >=20
> > > +       { .compatible =3D "nvidia,tegra30-dsi", },
> > >=20
> > >         { .compatible =3D "nvidia,tegra30-hdmi", },
> > >         { .compatible =3D "nvidia,tegra30-gr2d", },
> > >         { .compatible =3D "nvidia,tegra30-gr3d", },
> > >=20
> > > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.=
c
> > > index 02a661d86751..ebc78dceaee6 100644
> > > --- a/drivers/gpu/drm/tegra/dsi.c
> > > +++ b/drivers/gpu/drm/tegra/dsi.c
> > > @@ -53,6 +53,11 @@ to_dsi_state(struct drm_connector_state *state)
> > >=20
> > >         return container_of(state, struct tegra_dsi_state, base);
> > > =20
> > >  }
> > >=20
> > > +struct tegra_dsi_config {
> > > +       bool has_multiple_pad_controls;
> > > +       bool has_mux_parent_clk;
> > > +};
> > > +
> > >=20
> > >  struct tegra_dsi {
> > > =20
> > >         struct host1x_client client;
> > >         struct tegra_output output;
> > >=20
> > > @@ -82,6 +87,8 @@ struct tegra_dsi {
> > >=20
> > >         /* for ganged-mode support */
> > >         struct tegra_dsi *master;
> > >         struct tegra_dsi *slave;
> > >=20
> > > +
> > > +       const struct tegra_dsi_config *config;
> > >=20
> > >  };
> > > =20
> > >  static inline struct tegra_dsi *
> > >=20
> > > @@ -663,39 +670,46 @@ static int tegra_dsi_pad_enable(struct tegra_ds=
i
> > > *dsi)> >=20
> > >  {
> > > =20
> > >         u32 value;
> > >=20
> > > -       value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) |
> > > DSI_PAD_CONTROL_VS1_PDIO(0); -       tegra_dsi_writel(dsi, value,
> > > DSI_PAD_CONTROL_0);
> > > +       if (dsi->config->has_multiple_pad_controls) {
> > > +               /*
> > > +                * XXX Is this still needed? The module reset is
> > > deasserted right +                * before this function is called.
> > > +                */
> > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > > +               tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > > +
> > > +               value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) |
> > > DSI_PAD_CONTROL_VS1_PDIO(0); +               tegra_dsi_writel(dsi,
> > > value, DSI_PAD_CONTROL_0);
> > > +
> > > +               value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7)=
 |
> > > +                       DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > > +                       DSI_PAD_OUT_CLK(0x0);
> > > +               tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > > +
> > > +               value =3D DSI_PAD_PREEMP_PD_CLK(0x3) |
> > > DSI_PAD_PREEMP_PU_CLK(0x3) | +                     =20
> > > DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3); +             =20
> > > tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > > +       } else {
> > > +               value =3D DSI_PAD_CONTROL_LPUPADJ(0x1) |
> > > DSI_PAD_CONTROL_LPDNADJ(0x1) | +                     =20
> > > DSI_PAD_CONTROL_PREEMP_EN(0x1) | DSI_PAD_CONTROL_SLEWDNADJ(0x6) | +  =
 =20
> > >                   DSI_PAD_CONTROL_SLEWUPADJ(0x6) |
> > > DSI_PAD_CONTROL_PDIO(0) | +                     =20
> > > DSI_PAD_CONTROL_PDIO_CLK(0) | DSI_PAD_CONTROL_PULLDN_ENAB(0); +      =
 =20
> > >       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > > +       }
> > >=20
> > >         return 0;
> > > =20
> > >  }
> > > =20
> > >  static int tegra_dsi_pad_calibrate(struct tegra_dsi *dsi)
> > >  {
> > >=20
> > > -       u32 value;
> > >=20
> > >         int err;
> > >=20
> > > -       /*
> > > -        * XXX Is this still needed? The module reset is deasserted
> > > right
> > > -        * before this function is called.
> > > -        */
> > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_0);
> > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_1);
> > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_2);
> > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_3);
> > > -       tegra_dsi_writel(dsi, 0, DSI_PAD_CONTROL_4);
> > > -
> > >=20
> > >         /* start calibration */
> > >         tegra_dsi_pad_enable(dsi);
> > >=20
> > > -       value =3D DSI_PAD_SLEW_UP(0x7) | DSI_PAD_SLEW_DN(0x7) |
> > > -               DSI_PAD_LP_UP(0x1) | DSI_PAD_LP_DN(0x1) |
> > > -               DSI_PAD_OUT_CLK(0x0);
> > > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_2);
> > > -
> > > -       value =3D DSI_PAD_PREEMP_PD_CLK(0x3) | DSI_PAD_PREEMP_PU_CLK(=
0x3)
> > > |
> > > -               DSI_PAD_PREEMP_PD(0x03) | DSI_PAD_PREEMP_PU(0x3);
> > > -       tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_3);
> > > -
> > >=20
> > >         err =3D tegra_mipi_start_calibration(dsi->mipi);
> > >         if (err < 0)
> > >        =20
> > >                 return err;
> > >=20
> > > @@ -1568,6 +1582,7 @@ static int tegra_dsi_probe(struct platform_devi=
ce
> > > *pdev)> >=20
> > >         if (!dsi)
> > >        =20
> > >                 return -ENOMEM;
> > >=20
> > > +       dsi->config =3D of_device_get_match_data(&pdev->dev);
> > >=20
> > >         dsi->output.dev =3D dsi->dev =3D &pdev->dev;
> > >         dsi->video_fifo_depth =3D 1920;
> > >         dsi->host_fifo_depth =3D 64;
> > >=20
> > > @@ -1606,7 +1621,7 @@ static int tegra_dsi_probe(struct platform_devi=
ce
> > > *pdev)> >=20
> > >                 goto remove;
> > >        =20
> > >         }
> > >=20
> > > -       dsi->clk_lp =3D devm_clk_get(&pdev->dev, "lp");
> > > +       dsi->clk_lp =3D devm_clk_get_optional(&pdev->dev, "lp");
> > >=20
> > >         if (IS_ERR(dsi->clk_lp)) {
> > >        =20
> > >                 err =3D dev_err_probe(&pdev->dev, PTR_ERR(dsi->clk_lp=
),
> > >                =20
> > >                                     "cannot get low-power clock\n");
> > >=20
> > > @@ -1627,10 +1642,12 @@ static int tegra_dsi_probe(struct
> > > platform_device *pdev)> >=20
> > >                 goto remove;
> > >        =20
> > >         }
> > >=20
> > > -       err =3D tegra_dsi_setup_clocks(dsi);
> > > -       if (err < 0) {
> > > -               dev_err(&pdev->dev, "cannot setup clocks\n");
> > > -               goto remove;
> > > +       if (dsi->config->has_mux_parent_clk) {
> > > +               err =3D tegra_dsi_setup_clocks(dsi);
> > > +               if (err < 0) {
> > > +                       dev_err(&pdev->dev, "cannot setup clocks\n");
> > > +                       goto remove;
> > > +               }
> > >=20
> > >         }
> > >        =20
> > >         dsi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> > >=20
> > > @@ -1694,11 +1711,39 @@ static void tegra_dsi_remove(struct
> > > platform_device *pdev)> >=20
> > >         tegra_mipi_free(dsi->mipi);
> > > =20
> > >  }
> > >=20
> > > +static const struct tegra_dsi_config tegra20_dsi_config =3D {
> > > +       .has_multiple_pad_controls =3D false,
> > > +       .has_mux_parent_clk =3D false,
> > > +};
> > > +
> > > +/*
> > > + * Tegra30 allows DSIA/DSIB to be muxed to either PLL_D or PLL_D2; t=
his
> > > is
> > > + * simply not modeled in the clock driver yet. If this functionality=
 is
> > > + * required, the has_mux_parent_clk flag can be set to true once the
> > > clock
> > > + * driver is patched.
> > > + */
> > > +static const struct tegra_dsi_config tegra30_dsi_config =3D {
> > > +       .has_multiple_pad_controls =3D false,
> > > +       .has_mux_parent_clk =3D false,
> > > +};
> > > +
> > > +static const struct tegra_dsi_config tegra114_dsi_config =3D {
> > > +       .has_multiple_pad_controls =3D true,
> > > +       .has_mux_parent_clk =3D true,
> > > +};
> > > +
> > > +static const struct tegra_dsi_config tegra124_dsi_config =3D {
> > > +       .has_multiple_pad_controls =3D true,
> > > +       .has_mux_parent_clk =3D false,
> > > +};
> >=20
> > Mikko, I have an update regarding Tegra124 config. If
> > tegra_dsi_setup_clocks is not called for Tegra124 (has_mux_parent_clk
> > =3D false) DSI will not work. I cannot say for sure what is going on
> > with clocks since my tegra124 device has broken usb in mainline Linux
> > and without panel is no go. I would like to address this before this
> > series is picked.
>=20
> Ok, from what I can tell, tegra_dsi_setup_clocks ensures that the
> Tegra124 DSI parent gate clock is properly configured. I propose
> setting has_mux_parent_clk to true for Tegra124, and I will add a
> comment to explain why.
>=20
> Smth like this: "Tegra124 and Tegra210 don't have an actual mux parent
> for DSI clocks, but the gate parent clock they use requires the same
> setup."

Have you found something that tegra_dsi_setup_clocks is doing that could=20
affect it, or is it just because it doesn't work without?

I looked at the code for clk_get_parent and clk_set_parent, and there=20
shouldn't be any effect if the requested parent was already the parent.

I don't have a Tegra124 board available to me right now, but if we can't=20
figure out why this is necessary, I'd put a /* TODO: figure out why this is=
=20
necessary on Tegra124 */ in the code.

Perhaps you could check (with the clk_set_parent in place so you can boot)=
=20
what the parent is according to the clock framework before we call=20
clk_set_parent.

Mikko

>=20
> Or flag name can be changed to has_mux_gate_parent_clk or any other
> name which fits.
>=20
> > > +
> > >=20
> > >  static const struct of_device_id tegra_dsi_of_match[] =3D {
> > >=20
> > > -       { .compatible =3D "nvidia,tegra210-dsi", },
> > > -       { .compatible =3D "nvidia,tegra132-dsi", },
> > > -       { .compatible =3D "nvidia,tegra124-dsi", },
> > > -       { .compatible =3D "nvidia,tegra114-dsi", },
> > > +       { .compatible =3D "nvidia,tegra210-dsi", .data =3D
> > > &tegra124_dsi_config }, +       { .compatible =3D "nvidia,tegra132-ds=
i",
> > > .data =3D &tegra124_dsi_config }, +       { .compatible =3D
> > > "nvidia,tegra124-dsi", .data =3D &tegra124_dsi_config }, +       {
> > > .compatible =3D "nvidia,tegra114-dsi", .data =3D &tegra114_dsi_config=
 }, +=20
> > >      { .compatible =3D "nvidia,tegra30-dsi", .data =3D &tegra30_dsi_c=
onfig
> > > }, +       { .compatible =3D "nvidia,tegra20-dsi", .data =3D
> > > &tegra20_dsi_config },> >=20
> > >         { },
> > > =20
> > >  };
> > >  MODULE_DEVICE_TABLE(of, tegra_dsi_of_match);
> > >=20
> > > diff --git a/drivers/gpu/drm/tegra/dsi.h b/drivers/gpu/drm/tegra/dsi.=
h
> > > index f39594e65e97..d834ac0c47ab 100644
> > > --- a/drivers/gpu/drm/tegra/dsi.h
> > > +++ b/drivers/gpu/drm/tegra/dsi.h
> > > @@ -95,6 +95,16 @@
> > >=20
> > >  #define DSI_TALLY_LRX(x)               (((x) & 0xff) <<  8)
> > >  #define DSI_TALLY_HTX(x)               (((x) & 0xff) <<  0)
> > >  #define DSI_PAD_CONTROL_0              0x4b
> > >=20
> > > +/* Tegra20/Tegra30 */
> > > +#define DSI_PAD_CONTROL_PULLDN_ENAB(x) (((x) & 0x1) << 28)
> > > +#define DSI_PAD_CONTROL_SLEWUPADJ(x)   (((x) & 0x7) << 24)
> > > +#define DSI_PAD_CONTROL_SLEWDNADJ(x)   (((x) & 0x7) << 20)
> > > +#define DSI_PAD_CONTROL_PREEMP_EN(x)   (((x) & 0x1) << 19)
> > > +#define DSI_PAD_CONTROL_PDIO_CLK(x)    (((x) & 0x1) << 18)
> > > +#define DSI_PAD_CONTROL_PDIO(x)                (((x) & 0x3) << 16)
> > > +#define DSI_PAD_CONTROL_LPUPADJ(x)     (((x) & 0x3) << 14)
> > > +#define DSI_PAD_CONTROL_LPDNADJ(x)     (((x) & 0x3) << 12)
> > > +/* Tegra114+ */
> > >=20
> > >  #define DSI_PAD_CONTROL_VS1_PDIO(x)    (((x) & 0xf) <<  0)
> > >  #define DSI_PAD_CONTROL_VS1_PDIO_CLK   (1 <<  8)
> > >  #define DSI_PAD_CONTROL_VS1_PULLDN(x)  (((x) & 0xf) << 16)
> > >=20
> > > --
> > > 2.51.0




