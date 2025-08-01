Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22D4B18524
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1957110E8C3;
	Fri,  1 Aug 2025 15:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pg79AUC6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D45A10E8C3;
 Fri,  1 Aug 2025 15:43:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgiwKGjUerOO4RybtiStYY9MdIWdUoDQ/6DdYQSXsd5k/8gUlDbQncDdbgVsZSZNiQ5jU0WvRN1KXDlZQugnJf3wJNmTqCjhtk3Of0ScvLXWbEYBjVqHHY1e6xGn+04sTLQmmYstFpLd7yf6+sAHXJ+Vlt5VgJT0UZMNOIIW8ff1V7NtTCnGQGKuTO5NLwtkrT4yFoy9Vss0wiGjEvdRk+c++EX6eyj6YmGTwMjpsMVn/EbBDLHObTml5tOU/jvnclvVFnUYVVVfAyfs2AXpBA5FwQ91G8ehTflOE+eA5BkNN21VlbOvS2cgWYttcMfu0RaaU4kw/a6f5w+YyEbj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBt/R2rLvqNgtv3axoZ7bXzVlKNWNmx+2voTXKBaUzc=;
 b=GpbQADLxbIFvrXQEf7MMq45c4G5dGvtOZ6Pv4GFjNIdmhcO2ewjvQm6ErRWHhz9CyFWhc7zHFkZyuxtIzKe/rz24UD7bj/XrDwqOsV9yjUA7lZujsaABeucTUq3O4GzPPrYlQtAACyo1O7Hh7uszbdf/uhdaCn5hNcO0dw6hIPHQSN3KvTozy40qyaqk/xqOfaLknXWnsim+L1RX4IiJKIcvJuvufdDHI7il1M1VU/F71vbrMPX0b1PA8+F3YWT35Yxcx+loZemCEeuXDWFOnpwGXaZ534CuyuOjkEJMxcweuC7OJf1bt1zGIX42iC35LdMpe094B6XYIXRHpPaq0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBt/R2rLvqNgtv3axoZ7bXzVlKNWNmx+2voTXKBaUzc=;
 b=pg79AUC6k1VcWxJJHP5hQYg/dK4IZD8T+3qmDOdNy7e5j4fmVGvkFe0NB6o/jzGv0GJMVyyhGzSf0XoZgV9wol0Ye4GwL6N8+Ef7jno9pTUwxdu6EVHDNOw4fcBtalIZo5xQ583LgCK94i/ev0iqfSNIQyRUzWNHaVaxEsYnR8WRzOyNTANj8EPujnSTBxHNCDae5O+3Ks5bbhEGSdogLJp1mCwHgpYlgfhgfGQ6+IKHtag1RoHG7bR0FXEnglOfsEJqNNtqPajjwUb2x9gDvV18xKi0CVQlvxbGtVtE0xZ5G/82BCmdFsL2oHHACt5LVQmdeeQz1gsDMW5gDAqPQA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SN7PR12MB7980.namprd12.prod.outlook.com (2603:10b6:806:341::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 15:42:58 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.8989.010; Fri, 1 Aug 2025
 15:42:58 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "phasta@kernel.org" <phasta@kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/nouveau: Remove surplus struct member
Thread-Topic: [PATCH] drm/nouveau: Remove surplus struct member
Thread-Index: AQHcArhaZgaV8Ssmsk+22JdzJ0CH7bRN4b4AgAAGKYCAAAiRAA==
Date: Fri, 1 Aug 2025 15:42:58 +0000
Message-ID: <39dac3cf6ecef55a0e3dac7a381670491f09b8aa.camel@nvidia.com>
References: <20250801074531.79237-2-phasta@kernel.org>
 <809d2ff29bb87f782f7a813d67d3d604882db320.camel@nvidia.com>
 <DBR6S322NP7E.1T932OJTX6A63@kernel.org>
In-Reply-To: <DBR6S322NP7E.1T932OJTX6A63@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SN7PR12MB7980:EE_
x-ms-office365-filtering-correlation-id: 07693e0d-b299-4674-5da5-08ddd112175d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dytpcTc2UVFvYUoxRWZzcThmdmY2dnJNQktNZ0Q1WXFVNGEwbXJzTFhEbS9O?=
 =?utf-8?B?NTUrWG9leExiZGs3WFpBN2FEb3dPVFd3bVdHYlhUeno2UHM2M0t4TlAySUhV?=
 =?utf-8?B?TXNWK2wxdmpHTGRyQURyK2kyTyt2THFTcXN6RWJ6STNLVE1LcTljUDZIK0V6?=
 =?utf-8?B?R1hBNUlGSSsxSGFKWnIzcm94NCtoSXl4U3hCdUMxQVk4bzRvY2psRi80dnZD?=
 =?utf-8?B?N2JGVlRyUlVXTDUzbkpOSlA0Zm5iS09MYmtuQ0RQTmJiZEJ5YUJXeDFCTlRR?=
 =?utf-8?B?cEl5ekxzclVxbzFjUnYxbDhqc21IL0t5djcwTEZhVHEwNURoYTkvZ0xEMWJS?=
 =?utf-8?B?VTRQRmhzSEpVMkpXbHdocXNvd2NlL0N6ZDZFQTVkWW85MEpFQitBZmhkdzEv?=
 =?utf-8?B?c21FNTVlWit6eFV1ckZCb2RKMlpEV3lUWkY3MWczaEJzZkp6elNnUnJiQS9t?=
 =?utf-8?B?TzN3TlRZODNiOC9PTnBvN1hYVkQ3K3ZTVUN5TkNOY2V1SDlCUzUySldhZ29Q?=
 =?utf-8?B?VjFmNC9vcnRiM3B6UVcyalVTWDg4L2xqWlRuTXgxZkw3QmoyRVFRTGtVdGF1?=
 =?utf-8?B?SHRxZjJLZVdTMXhEQ2gwYUJDN3dkRGt5SHVrMWVINWo2eHMzZlRaaG9TbU55?=
 =?utf-8?B?Vkc0dE8vcC9uc3pNNS9xcnBvL0pXdUJ1OGFPaDR5ZVJzU2kwYVVSTHJsWmhp?=
 =?utf-8?B?MkJBMjFVcFNwSUF2dXpvazZyUHFGMnA2c1djZm5UVktZRU9abmhLeDRBUlRH?=
 =?utf-8?B?K1dLQlE3S1F4K295THBOVXNKK241dng4azVsaGF2SG9TTVYxWWROSjZzTmZB?=
 =?utf-8?B?UkVPL0NqMlJtNXFGZFJ6R2ZydWh0S1JQbW9tR291VHUxeXhhc0FVSVRmTGRV?=
 =?utf-8?B?RHpKSDJhaFBGVlIrSzhPVFcxb0VEeG0rVzZ6c0N5R2txc3hQQTNUMXlZd0d2?=
 =?utf-8?B?RnZ6WitleG1acFkwbzRXWi9xOXo5b2JmYVNTVFZOVEVFVEtWazJnWW1PMjdx?=
 =?utf-8?B?OCtsY2FhaHI5cW5TV283c2dmek1oSUZObHdoMWtEclBIeUNualhoU0N0RTQz?=
 =?utf-8?B?aXFmbXM5RjFja0l5Q2hDYkx1T2dJcjlVejNKaTA2RjJXYVVoSkk5Unljc2dK?=
 =?utf-8?B?VHRZdXJUZ0RhbHo0UmZiNlB4SVNLMDAvMmRYL3prT0gwODhTbExmcXhRRkZF?=
 =?utf-8?B?aDRwTUJkU2p1YWd0NElnQ2QvK0RIaDFHYjUwamU0cSsvNHNIYUVsVTZkTTJ5?=
 =?utf-8?B?enJsaUVqSVdTem1TN0dQWU5OV3VBVFFyVUNiNFU1c2hyWVZZdEEvaExBbERX?=
 =?utf-8?B?cUE3NFYwQVpobHIzdmdhZjZsSUZKTjFCdEdVb3B2MHFkUzVoRUVKa3cvWkph?=
 =?utf-8?B?SkxpYTF3a2tFRUJ3ZStiNTRlYXVUR3o4QkwxUFowTnhmSUk0dDhOWUw1Mml3?=
 =?utf-8?B?aUNWdlRwTWtFQXhDTUxzck5VbmprZDhvMldNVE11WVBsQXNVbEhnamxGS05a?=
 =?utf-8?B?eTJNRU5LS1ZyMnhHYWpFN01MV28zajVNNVZ3R1RIYVhKMmxqNzlEMUpNamVQ?=
 =?utf-8?B?UjA0TWdNN1pORmZ1dFhEbytwWVZCQUlxejhlNUNkb3FBdmtseG9Qd2xMZWxo?=
 =?utf-8?B?ODU5djQzZUF4VVR3V09EUU1GV1JRVjRjV2FsbmZGTkV4QUs4N3o5a3lDUTRW?=
 =?utf-8?B?K2pleHF3bXkyeVNadThvSG1zcTc5Si9qQUoxYVRmNHNxR3hOdlhoTHRqWElC?=
 =?utf-8?B?dWtUNnZnQUNJbnNBVjdtV1VmRzQ1SlozYzNzTHhGU2pOcXFjMFdBTllhOTZ4?=
 =?utf-8?B?MjJ2bjVBUHJLK1A2WmZjVmhmOGhqNlNwL1dvMzJhSUg4ODBTU1oreEJWN2pa?=
 =?utf-8?B?SmFWK3pWcnlrTWhmYmFSRTNDNTgzQ2hZNmZYWmswRFBBSzVTZ3RnbStnOE1B?=
 =?utf-8?B?REt3K204N1ZOMHRUT0JtVVVWSmlqVVlqd0pDc05vRmRBT0lqNWwvT1hES1lh?=
 =?utf-8?B?SFMrRG1sd1JnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1VrYnR3Z2hHKzR6ajZRQnQyTG5oRHhuYlIraTNsdTlHc1Z5R3d1ZkNob25L?=
 =?utf-8?B?T2MrbExQc1RmeWNKMTZkWmNQZTAyUHBGOEo3YmVpVGc1WjVCNTh5elVJUWk1?=
 =?utf-8?B?ZnlmcTIvTzRZMExoV0NJRlFValFuZDJueG42U2NGM2NvMXhSRXpPU2NYakYr?=
 =?utf-8?B?bHhJc3Ntd1dKb285TlhRaTlVTjY5RG5xVCtoK2dqWkQ4S3NqWjRKRit1bjBM?=
 =?utf-8?B?OWttUlBhRDlvMEV0K2lWUXhleEVHaEV1VWNiUkl3aStjSDJlMXJTNEZOdXhq?=
 =?utf-8?B?TzQ3VUhBNWgrL3RTNnBnWXBqMHR5andXdmJaZUc2YUpmRWNBMkVnd25hVmxr?=
 =?utf-8?B?aWMyOUY0SStkb0pnVWxXNXZiOHIzcVhNOFhoL2lSZHFwSnJPT1dEcXB3V2RG?=
 =?utf-8?B?M1kwRHFtQ2IxSEhrbjJnd2Y4ZjkwdzFnUXFNdEhrWVdGUFhTZXViVGo2K0VE?=
 =?utf-8?B?WnVvWjlNbW52V2M4NkEreHVqbnJwOTViUStGeTJwdGE0akhwdVZ1L2dvN0Vx?=
 =?utf-8?B?YkY0bXFjNEV3WitrcXR1WkJlZHdMd0tYMHp1Wm0zVnN4RW05UmdTTmR1MkJq?=
 =?utf-8?B?V2Vuc0MwTVFpL1NPeEtQZUxJaVBjMWc4WnNBMkUxOWdmWGswVlp3SVBKL3F3?=
 =?utf-8?B?KzhnQ2pjdWxrVTBvYTV3bFpuSm1EMXJPbFkzUVU4a1RSbHdXSVFyalpiOFZ0?=
 =?utf-8?B?bjUzSyszQlVudjdlMXQ3R2FZUlkrdndKZ0ZYYWI2cldHL1J0VVdrZzJ3OW1U?=
 =?utf-8?B?ZUIveUNrak9yRXYvZTFsOEJWeFFkaUMyRWl5a3FVUDVqYkZFNVBKeUpmbU1o?=
 =?utf-8?B?T0NBRnRWTXZlTy9KTHhIS0VjUG9BeWM3amVHNGRoNjlFcE1tYnltbVZHc3ox?=
 =?utf-8?B?N1FpbU5VaVRSUmdOTWN0TUdwWnEvNzdTL1FZR0pBOHJjK1FKV05seWJtdHR2?=
 =?utf-8?B?aURIekEwQ1dJdkNtZ3Y2enNrc01ncG41Y1R2NDRraXJqWS9TbW5kdmZGRDln?=
 =?utf-8?B?WkJEb1hjMmI1czY0N2JVSUM3VU9jSU1sNE53STZCUG0vTksrMmc5Q0h0eWZE?=
 =?utf-8?B?SzRJZ3B5aHBoWDBsSUZvbEkvdDBTdUlURUowK2t0SU1YTnZiOVZIZHdVdDhO?=
 =?utf-8?B?c3Q1L1Vab0pUb0lQMUJCZEVEWmdjS2dNK2Q5cjhKRU5FVXRmdDFHMDdzYmV1?=
 =?utf-8?B?V2ZrWWJkZG5lRWw5ejRBbEsxNmcxbDdxdEFtZjZnVjlIRzlhSllLaElrdWor?=
 =?utf-8?B?MXppS29wM3Biei8vV0VQZlNQUUtqOG5EMjVNSVFOdk1tNjZDVlpjR2dGTGpF?=
 =?utf-8?B?eUJVUWlWcmJFSmg2V0hVMmI0K3YwRnNaWktNMEV3eFNyb2ROdTUzQ3plWmpa?=
 =?utf-8?B?bnd2cnBUZ3FVS1Rnd0pzR0ZqK0xFR1VZMnNnNVRWWUQxTkpoMHE1VDBJNlNN?=
 =?utf-8?B?SEl4RlgvL2s0T0RQVkpES252QkRWYXVDUWwzQnhMNHNhcHFmK0JScjl6NWdw?=
 =?utf-8?B?MDNVRFA5cm1UMGNxY05NcGh5bWlvenkvcnlrZnNWNzJBSFc2UE5ZeDA2Rmlh?=
 =?utf-8?B?MllsUm9sKzR1N2QyTTNYUUlWT1QyUkM0TkNPd0ZsaDZmbHlSd2tmY01wSXJ3?=
 =?utf-8?B?VlNtWXRhUkRRcDNZcTNldU5ZVFU0d0NVUkdyYjdLWVNuNHBmL1R4ajN5Z3lm?=
 =?utf-8?B?TTYycmt3aHNXT2VDLy9HM005NGlwZ1ZTUWtkQm9TQTIyMG5lbUVHanVLNXlD?=
 =?utf-8?B?Yyt1bXJkMFJvNjYvYmdTdXprWGFRcjVna00xeWNVc2RqM3QvRUZxcmoyWHRk?=
 =?utf-8?B?RkEyVS9YK2ZDVlBBbUZFcnNGbVB0eXY0dStaTE1MdlJPVE1zaVhNdlN4ZkFp?=
 =?utf-8?B?ZkZRUkRZRTdML1YzOGs1dUFHSnozM3MrNkVYWVpNdDJhMS9lU0FQUk5rWDJr?=
 =?utf-8?B?Sm0yU3FmQlRuTGtlV1JkQTBsUEYzcU5HSU4zZmZjK1dydEtXN2ZxaC9XTHZO?=
 =?utf-8?B?S0NTSGdqSTVGYkRjOU5nZGMrZitoRnNJQTBsekJkOEZJaUhSWDdzZURyb2g3?=
 =?utf-8?B?aVdQdGZ1REk2QWlaaWdkZ3NKaHY2a0dyclJTQXVmU1FDVEo5bUcybFA3cWpw?=
 =?utf-8?Q?C2DX/tUiomIgNr2o5aqJBmOil?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79F68983D174D14CAABAC58BDDBF3B36@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07693e0d-b299-4674-5da5-08ddd112175d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 15:42:58.7723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q1yw8+ipgVldas7Oc9sPIsDQjlU2AyN7G/FAPRbaiYGAOo1fZ7E7qBDU4YFrLryScsXi1jGdWg2ncUsXriqyyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7980
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

T24gRnJpLCAyMDI1LTA4LTAxIGF0IDE3OjEyICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBPbiBGcmkgQXVnIDEsIDIwMjUgYXQgNDo1MCBQTSBDRVNULCBUaW11ciBUYWJpIHdyb3Rl
Og0KPiA+IERvZXMgbWVhbiB0aGF0IHRoZSBUT0RPIGhhcyBiZWVuIGRvbmUsIG9yIHRoYXQgc29t
ZW9uZSBjb21wbGV0ZWx5IGZvcmdvdCBhbmQgbm93IHlvdXIgcGF0Y2gNCj4gPiBpcw0KPiA+IHJl
bW92ZSBhbGwgcmVtaW5kZXJzPw0KPiA+IA0KPiA+IElmIGl0J3MgdGhlIGZvcm1hdCwgbWF5YmUg
YWRkIGEgZml4ZXM6IHRhZyBmb3IgdGhlIGNvbW1pdCB0aGF0IHJlc29sdmVkIHRoZSBUT0RPPw0K
PiANCj4gVGhlIFRPRE8gd2FzIGludHJvZHVjZWQgYnkgY29tbWl0IGViYjk0NWE5NGJiYSAoImRy
bS9ub3V2ZWF1OiBwb3J0IGFsbCBlbmdpbmVzDQo+IHRvIG5ldyBlbmdpbmUgbW9kdWxlIGZvcm1h
dCIpIGZyb20gMjAxMi4NCj4gDQo+IEl0J3MgYSBiaXQgaGFyZCB0byBrbm93IHdoYXQgZXhhY3Rs
eSByZXNvbHZlcyAidGhpcyB3aWxsIGJlIHJld29ya2VkIGluIHRoZSBuZWFyDQo+IGZ1dHVyZSIg
Zm9yIGEgY29tbWl0IHdpdGggdGhlIGZvbGxvd2luZyBkaWZmc3RhdC4gOikNCj4gDQo+IAkxNDYg
ZmlsZXMgY2hhbmdlZCwgMTQyMTkgaW5zZXJ0aW9ucygrKSwgMTEwOTkgZGVsZXRpb25zKC0pDQo+
IA0KPiBUaGUgbGFzdCByZW1haW5zIG9mIGFjY2VsX2RvbmUgd2VyZSByZW1vdmVkIHdpdGggY29t
bWl0DQo+IDRlMmVjMjUwMGJmYyAoImRybS9ub3V2ZWF1OiBSZW1vdmUgZmlsZSBub3V2ZWF1X2Zi
Y29uLmMiKSwgYnV0IEkgZG9uJ3QgdGhpbmsgd2UNCj4gc2hvdWxkIG1lbnRpb24gdGhpcyBjb21t
aXQsIGdpdmVuIHRoYXQgYXBwYXJlbnRseSBubyBvbmUga25vd3Mgd2hhdCB3YXMgaW50ZW5kZWQN
Cj4gdG8gYmUgcmV3b3JrZWQgaGVyZSBbMV0uDQo+IA0KPiBXZSBjb3VsZCBtZW50aW9uIHRoZSBh
Ym92ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIHRob3VnaCBpdCB3aWxsIGFsc28gYmUNCj4gYXZh
aWxhYmxlIHRocm91Z2ggdGhlIGxvcmUgbGluayBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugb25jZSB0
aGUgcGF0Y2ggaXMgYXBwbGllZC4NCg0KSXQncyB5b3VyIGNhbGwsIEknbSBqdXN0IGxlZXJ5IG9m
IHJlbW92aW5nIGEgVE9ETyB3aXRob3V0IGFueSBtZW50aW9uIG9mIHdoZXRoZXIgaXQncyBhY3R1
YWxseQ0KZG9uZS4NCg0KPiBOSVQ6IFBsZWFzZSBkb24ndCB0b3AgcG9zdCwgdXNlIGludGVybGVh
dmVkIHN0eWxlIFsyXSBpbnN0ZWFkLg0KDQpTb3JyeSwgY29mZmVlIGRpZG4ndCBraWNrIGluIHll
dC4NCg==
