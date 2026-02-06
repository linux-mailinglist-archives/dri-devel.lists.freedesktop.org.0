Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAcZNtruhWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:38:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0FBFE42A
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6633B10E6BA;
	Fri,  6 Feb 2026 13:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2I/uVjbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013040.outbound.protection.outlook.com
 [40.107.201.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 170F310E675;
 Fri,  6 Feb 2026 13:38:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrnuI5sXnJTqJj3UA9EavddEgjJpU7qRMB85JGtVejpw+/yARJMHcDQKIBCoBmDNxSBgY+3X2BxvDr7ceAkTX+YkoJVGy2V4Se/vjcdHUcQp19Ncrcr+7/C+xwBtAXb+R8hrFtaTJpodaOY7ebVFDQlkgrgRpk46etYtDE6PFTFOp62B28ShRS+dazquW6zuaBa18+G73zTyL11E19B8bsRBRaNMS8GI3HIWrz2rkpC1ZbtPvhPVzNrj112MnDzXzaZsKckmQG/07D6y1D3GepWeeP72PMgfkX94Yn+NmERrLKGtSa4+HKG8bwMcP56oclVZEyZ8Dmn+6/nrayIyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1SgB++xPODi1OSlliY373QIaW7j25E0VIX4ayXvb/0=;
 b=v4p8s1oPDzj6vX5aPxfnEAJpu8IVqy/WQoXkvgVXKQcMtwfyWQnu8iJUAfIolXa/CnFV5+5etClastw3TUL3TUjrKPW1Zc5kYxA07AODWvI6lx8JEHtJAFCh6m2MY5rTfD4vcVriTsud5Fp4nnXbB8s11Ngmp6rfd4busxjDEXXJPAHllNbhExwDYFkts0WhebIdJowCQoVShksRIxdNqUa2LEPV4QmIsO9HTJHeYL+1QHuEJfzPMKUTsYdcFMqNqGB1Uzwsx1DOCkf0XPbAFsPn9RcAwWL7aXbL4n09RKy1BM48p5yOnJuRzlKreEuQiG8885M7YeMGvUfFDTa62g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1SgB++xPODi1OSlliY373QIaW7j25E0VIX4ayXvb/0=;
 b=2I/uVjbPXdsMNVwcYOS/NivzyFW1BPkik59ctYercwrU7b2aG2yeqpfVE+W0n3xN+YDNYiGk4MLS/AZsLXTBdxNpdUJU1HLI6C74t7xSgBX1LlFlCRuq30ms/C5wZpdIzB3ljnVVNenmcIf0neXnpo51EpOB+HfG1fIM7qnNuZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6988.namprd12.prod.outlook.com (2603:10b6:510:1bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Fri, 6 Feb
 2026 13:38:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 13:38:23 +0000
Message-ID: <3be1ec57-d078-40f3-8eb6-d25496fb7297@amd.com>
Date: Fri, 6 Feb 2026 14:38:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Accelerator/GPU top
To: Natalie Vock <natalie.vock@gmx.de>, Alex Deucher <alexdeucher@gmail.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 David Francis <David.Francis@amd.com>, maxime.schmitt91@gmail.com,
 coelacanth_dream@protonmail.com
References: <CADnq5_MTX8CifP25UvE5kdMbCYxgK+A+KGdd-_Ef1m4VYv+WRQ@mail.gmail.com>
 <4c5c0981-fa21-4d8c-b5ed-45ebaf4d713f@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <4c5c0981-fa21-4d8c-b5ed-45ebaf4d713f@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:408:e8::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: 2612073f-93d2-4d0c-6a10-08de6584ff87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlFDNGU4RnVUWnVPM1hzNGJJenJ3YW5NdGU5N0ZJb0hCcW9GYmZVaXNxeFdV?=
 =?utf-8?B?QlBQQjNvVmN0ckxoNGNONjQ2Q1YybUhYM2tMa2grdkJGeFRDaGl2Y0thbUs1?=
 =?utf-8?B?blRjaVlaT0E5Q2xrb3FNSE05ZXUvS2RsL2xzcUtQL0hoZlpUTURJYWhyay9Q?=
 =?utf-8?B?a3VXNWUyYVB5SURpRmlZQktpMmpnWGY4N0pFVmNGV28xUkYrU3AraHJBUUZD?=
 =?utf-8?B?MGlqQll6SCs0YWoxMjQwR2dFVEdYZ09GbXlSUHY1ZUhBR2IxeEpGYlZ2YlJO?=
 =?utf-8?B?NHhHTmRwTVBHNGNnb2J0cnJEU2R4QWZrUzlQRk9kZ3BaK0R5aWFpbnlPaTY3?=
 =?utf-8?B?NG41R29QRnk2NkI1VFhYVFRLRDlzRlA4ODBxRWRQd3NiYlRHdUlKcDExd1hV?=
 =?utf-8?B?MWE4emZPQ29lanYvMlh1SnJidHRMU1p3eTllTjdVbVlEc3JPZ1ZudFg4K2Fa?=
 =?utf-8?B?UVRZVi85S1BiU0VacDlEVkkyYy9xaGtQbVZRNGRudENBNWVzSmFIQ241azBS?=
 =?utf-8?B?Um91VWFkTXRpcnhoTGdVOXFyZjNPUkR2ZFc2MUYxTHFUaDdLNVVhOXRYZkVn?=
 =?utf-8?B?NSszQlNuVmF2Rk12U0ZRTGpyd2VuMUh2YW16b0VXOXlvUUtKSzAwWWRGY2Rr?=
 =?utf-8?B?TDFlTFVFNGgzdUtVNzZNeWJEbE5DaVNiSHZ3a2VMTXR1MDBHUGhXMnU2ODFh?=
 =?utf-8?B?RmUybTJKZXoyWSs3Ungxb2xhWEVkWVZZbWhLTytKeXUzU25QaWVEUWd3SEFo?=
 =?utf-8?B?Znp0TEY5QWZicXJzdGkxejhnRjVvbEtyWmZyenZDdkxZeFhkYklwYzE4cHpB?=
 =?utf-8?B?VXphR0tpQ0hTWDNXLzBza3ZIYVhPdDRGYS9EcWhUcFZlTEhPSGhSQjRDQWFM?=
 =?utf-8?B?UWtCZDhlb3k0c3NVeVRGWHpkUkhjV1JkbVBSZWRKODUrb3pWMVF4Q3hJZ01s?=
 =?utf-8?B?TUpEVVU0YTZzajhRdGJYZktmemsrMzJGM0p5dkJETWdZQ29Kc3dQUXpQcVNj?=
 =?utf-8?B?L0pGYjg3WFJDVDhLaDNMT2lQOWZPek13V00vZ3N5TitnOWFKTHRuRVI5Rm5N?=
 =?utf-8?B?U1F5R3NSUnRsSmJNSXF6bzNrR2s0TWpHY2NKdnY4SDNDY2NYUU1Va3ZBdURQ?=
 =?utf-8?B?a1g2TzBvRko0Q1pLQ0R0c3o0UjVENXBUU3N0elZ0bW5ZYlB3NysvZVlUQ2pX?=
 =?utf-8?B?QW42YktVZjB2eFRTNUtLT3RoSlNJMWhzWkdzbGYvQS94cU9PY2lJQzBoNFFl?=
 =?utf-8?B?dFUrV2RwYmQ1TzV4dHF1c1pIZGN5NWtzc2F4RTdZQVZzNGprWU5nV1YwNEtP?=
 =?utf-8?B?UHM3MGNTMUZzRjVSVjNBNGRxWnFkV3IwaDVKK0REK3Bob0NOd2dXSDVQVi9T?=
 =?utf-8?B?cG5SUmJkaE1icXVrYk5FRXcxcjE3L0FzZlQ5Z1IyWGt4bW9PSUdZSXBvTFhs?=
 =?utf-8?B?K1cybSs4V0NSR2IyMGlNSnhad1FsQm9vWTdDZXZnTmVjNHd6MWsycXJaSHdn?=
 =?utf-8?B?dFY2eWt0R2lxbUpnRW96Z2lNMFJiQ1pzM0lWdi9tU3Y4b0w4bUQrZlNsc2ZO?=
 =?utf-8?B?OFY3ckF0dGpUbjJwTTEzUkt1WG1qQXJHMVQ4eG5sUElBRkk5dzh6WVNBWUxS?=
 =?utf-8?B?K1loR0FYc1pkSUxidk5XYk9WOEpZenBFTmsxdlNyeG5LVlUrOHZDZEVBVVJL?=
 =?utf-8?B?RTNCd1hQUVJjVlNaTk0ya2hPU3ptN0RDWFEwUU9PbGtZWlBIcUpCZHozSmZn?=
 =?utf-8?B?d292cFF0Uy96eWpNUWNxK1I2WmUzSXNVSHNlNFlrOGZ3UHpIeGJobUQ4K2Ux?=
 =?utf-8?B?WDAxTGsvUlNEVFhsV25Va21wMG9wV0tuaGhnNjgxQkdNdWVCSFdHK2t1dytu?=
 =?utf-8?B?SkdGZGxCWXNmS3MzQmR6TWZuMFdrdkhLeTlvS3Q1bHZReEl5MFlENXp2Ymx5?=
 =?utf-8?B?RC8rRzh3T2h3enYzbktuKzFwQURNSmJWT0k0aDdib3lzM1c4TFU4YUNmbnY0?=
 =?utf-8?B?NTlQZHBOT1RMZTc1djA4ZFZNQzUyRGpMY1BYcHV1cnVmOENkUjhBN3k4b1E4?=
 =?utf-8?B?NDhVQkVSL3BMWjkwUE5UeitnR2ZGOFdvZkpWalloaUhBSmQ1M2pIV3BZblVO?=
 =?utf-8?Q?QHQmKfM+glgJ0TOUSYOeNZtKY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWY4akhWWThZcFBod3V6Q3RoS1l3MFBpYUdKbUk5Tm9qcXFqQlRZZDkxcUNF?=
 =?utf-8?B?YzlvOHlHa0pNMVIrdTd1cllGMVJTNDI5dXV5bDF6aWVlcDhSNkxxUjgxZEcz?=
 =?utf-8?B?QTFPdHRzQ3d2bk5wRWpPdHVOYVFMVG1RV2sxUnY1aHg5elBFZ0VRUXc1a0h3?=
 =?utf-8?B?OGJFcjNyZWl3dDcvYm81cDZMLzBsbC8zOGt1NGF0SkQ2Q1d3bDJDV2xUenl4?=
 =?utf-8?B?aXBGQ2szMW9MYktHcEZOTWJzbUhWYytlVlBJbTgxUWZWbVJwK0NTYUlaWlds?=
 =?utf-8?B?V09JVjN4ZTF1NVVuYitKdW9uN1h0RWJKdTVGYTF5d3ZPSWl5aGEyYU1SdDVi?=
 =?utf-8?B?ZTBSVnhTNG5GbVhPbVgyWUp5UTZqL08vZXZ2KytQei9rNkJjQnI4bVByWStl?=
 =?utf-8?B?MGpsQTc0cjZQa2hBamZtdnZQQnB5RExEa24yUS9JQXF1bjV4ZEZMWGtEbFoz?=
 =?utf-8?B?YVB4REpNNXMwRzBCbG9Oa2JzakpOUlJHeU1DQzBJRkJwajdKU1ppNXkxM2NI?=
 =?utf-8?B?MkZmTWpid01kelBSVzZvWEVzaXhYMjd6Q0N2RzVWOStiK2JXUmdFV2NRaWRK?=
 =?utf-8?B?T1ZyUmxvOG5vcmNzRGV0blpxWnV2ZXpTYjJaTm1DM2gxSHdFS1IzT05LejVT?=
 =?utf-8?B?cEhGY2RVTk9KdTZmbHQrSldhaGpsdGNXMFk4aHhCSU1tOUZ0by9UeEFjbjhu?=
 =?utf-8?B?bEpzNUxYNlBUMzJDUVk0bENPMUJrZFBHRHRZK1A4QWxCZTRnOXdKN3dxQXow?=
 =?utf-8?B?eWFVZndWSE1SRFA5MjVLNHlyMWdMWm15ZFNOQlM5ekFMbUs0dDVTcnpKNEVx?=
 =?utf-8?B?cXdHTnhDS2NSTkNEeVErQk5EVGFYdlJMSWdrclREL3kzZHRjTXJVbmdlZHg3?=
 =?utf-8?B?ekxLRWlVKzBSQ1FwcWFwTkZWWE1JdDVyVElQcmdQc0FzWHh6TUdIdURiZWpw?=
 =?utf-8?B?MnhaanVPcWs3eGNSS0h0QUVHcHBTM3E1SWc1UlZQUzh0VUo0OUtUZHhqZEgw?=
 =?utf-8?B?eWFWYlJMZXlhRkV1YWxBdXhqaXROaVpDV3ByS3RDa2tKQytoSW12Z3VPOGhL?=
 =?utf-8?B?NjNDcVVFZWoxVWFPRjZ5NjlpRk1PbmlFOGN3Vi9SUHFlZ0VIcTJzaHhVUHcx?=
 =?utf-8?B?ZytsZUVvZUY1ZExydmpQZWU1dncyYmtUQmR5Ym5LdmVLbEE1SThKRnl4TVRr?=
 =?utf-8?B?NytqSndRampJRnVBQ01HNlRjODNrUjJUbVBoc1Z3cGFGWW4zM1lINGh3WWVP?=
 =?utf-8?B?Nk4venVCaVAyTDdsenJZRGYxa1lOemE1U3hERmFoQThkR0xkYnZrUjRhRUNP?=
 =?utf-8?B?ZTlqU2k3anFBUHRiQml5VWg5K1ZBR1pRTW1QM0tPV1hKWE90VVpTTmV1VHN1?=
 =?utf-8?B?UkI5SXl5bE52cEVnVnZ1QWJML3Q5aFdGd2ZmQko2YkFKd0F4SERKZlA5cGJY?=
 =?utf-8?B?S0phaHhPdG1JbXgxQ2hROHhMNmNCRE5uRVYzeWpUdHVYVWplVSticG5ia2Fj?=
 =?utf-8?B?aHNwem1FZDNnRkhjTnBkdTBYK3F4RWk3Ui9nY3V0UVAzTGRmTUlkY0tnUTB3?=
 =?utf-8?B?NlBuc3dBQUZaZ0FUZU9wbXlyc1B3V2pDTW0wcm9GYUxLZ0N6Uks5UUd0b3R3?=
 =?utf-8?B?SThBNXkwcm8zTDNTMWFrWk5UNFNOS2kwMi9pQjFJWWw4cTdyQU1CVUtBNnZF?=
 =?utf-8?B?OFd0WGplT1RQZElmQmF4SXp3OHJRVTR5ek5yQ3BOM3I0b2NHNWdpODl3YnZS?=
 =?utf-8?B?UWUzdlpnL0JrbGNiaUxxTXZDbmpZekF2N3FpaHVpNEdrZ1FlQlVwVDgrTDdh?=
 =?utf-8?B?S1lKYzNBSW9KaUZ3RHZ3MFRmbWR5Z1BFekQ0ZnZZRzhYRUl1LzhVU09qZFJ1?=
 =?utf-8?B?SlJGaGJaQ0xuYUdDNEQwM2E4cjJkU1FQOWVGWHV1KzYyWEZqdXRQTDJXeWdY?=
 =?utf-8?B?OE0zb3lPNzZHTnYyd3BKUlZsWmxYaU1XbU01amxFR0tSZHNBdWl6WmpvcmVI?=
 =?utf-8?B?T0ZsL29XeXVkb3JldzB2TDJvKzBJWFZWL3VleDRlWHprdlJFYVdzdXJQdFVD?=
 =?utf-8?B?dGc1eDZZbVZTZ3hhWUJrbnlSY3pYbEROaHp4NHphdHJmT2l3UHlTZFllOUxi?=
 =?utf-8?B?V1c4dmRkaHNjZ3IxWFpudTFoN0xPQXFmQVFsYmlZZGZaUGpTV0MvNzhYczJ1?=
 =?utf-8?B?R2VtY1hwSm9OUUI4RTVqclZYMExtbXlpL2lyQ1E1eHhtN2RIV3kraEdtMVFI?=
 =?utf-8?B?dms1QXoxRlFXa0dXM3RQT0tHNlBnRGFLYUhNeEVXSmEyWFpIUmJxWUlzZ0Ja?=
 =?utf-8?Q?/I9PzVP4SVgNpIMBGm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2612073f-93d2-4d0c-6a10-08de6584ff87
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 13:38:23.1773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/drHKXQi3hCNOCSquogRbd8fsRzm1Lqj9av4wBJSGowcdQgHLnqS1BzdhaT9H5h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6988
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
X-Spamd-Result: default: False [-0.10 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MIXED_CHARSET(0.71)[subject];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de,gmail.com,lists.freedesktop.org,ffwll.ch];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmail.com,protonmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7C0FBFE42A
X-Rspamd-Action: no action

On 2/5/26 20:25, Natalie Vock wrote:
> On 2/5/26 19:58, Alex Deucher wrote:
>> Has anyone given any thought on how to support something like top for
>> accelerators or GPUs?
> 
> top for accelerators/GPUs kind of exists already, see [1] or [2].
> Clearly, this problem has some kind of solution (looking through the code, it seems like they check every fd if it has a DRM fdinfo file associated (which is indeed not particularly efficient)).
> 
> Maybe it's worth asking the authors of the respective tools for their opinions here?

That is a really good point. Adding Maxime Schmitt and Umio Yasuno on CC.

Let's hope I've picked the correct mail addresses.

Christian.

> 
> Natalie
> 
> [1] https://github.com/Umio-Yasuno/amdgpu_top
> [2] https://github.com/Syllo/nvtop
>> We have fdinfo, but using fdinfo requires extra
>> privileges (CAP_SYS_PTRACE) and there is not a particularly efficient
>> way to even discover what processes are using the GPU.  There is the
>> clients list in debugfs, but that is also admin only.  Tools like ps
>> and top use /proc/<pid>/stat and statm.  Do you think there would be
>> an appetite for something like /proc/<pid>/drm/stat, statm, etc.?
>> This would duplicate much of what is in fdinfo, but would be available
>> to regular users.
>>
>> Thanks,
>>
>> Alex
> 

