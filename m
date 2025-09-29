Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0145BAA7E2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 21:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2AB10E485;
	Mon, 29 Sep 2025 19:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NYrWoZaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013039.outbound.protection.outlook.com
 [40.107.201.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A36E10E485;
 Mon, 29 Sep 2025 19:46:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sck/bW6vYoSh9gGvgDWAAghUz4AeAK98SgQJ2xng4wJNYeffRfLIS4U3wUrs0Gty5oqqNBGjt9/ZYYLhu4N1xdUu835yy2WZa6RJVUBqXbqRjBRQ2mcf/PegDh3dJq3wYNIDPSTPbAtszkOJAJ8L4ewYUVsDlDjSbqvAYI1ZebZlvz5v/LokYDMcRThlCIU9JhCOoZsg8JX478T4QPriPDP/zKnVgyAsWTHRleIy8jM3lVu7vAULa4x7Ntqh+VQ2dROWJh0qFktzzsIZ/DsWuEwAlIQUvWFKeUWLC+oxd8m6+LCW4xZoPnCdgBpR/HhazzNTmyLJBA4DCHeM9Qxivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HviKc523pBv3EDJtC3WRf0q4R2eHwocPOZDUt5lytxo=;
 b=EfrbYeyP48KCsSenoUluykTA0nBpftNwtUsNwux+XYKROKC6JhcHltoIS5gVRkO/P7TvR9Npk0jtp3+pniV/6XUZLwFEYv27E15kEGAGl041WkXgAEIXV94X5EHL6VgyKVZHQFvaV5iMggy7s58SI6p5cKBc6RcskpEpIqh6kQo8b/4MTTrK+esGEOuIiEkO04YCnSfkaMTGvDjz8jMCEBbN+lqP+dpk0AzHiCYKahXQlA5NqaA11jf1NoRwPeN6asIHoA9e1oD79cN9yit3HWBvmhO8gvGOzCS1IEs5+ioEd67eINn/G3sKXSavqOhs9Oh2vkK5V6KhkXuapNiTMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HviKc523pBv3EDJtC3WRf0q4R2eHwocPOZDUt5lytxo=;
 b=NYrWoZaAKD5RGMO7orMa1a3BQ8c4g9hu3wLwdkBatIzPBds/H8rPy0urynkEKkQiDbdb17gGjwAl239wPmEUyTW66tj77HqHe7QPtV5wfTOENknzo7WnKfRa9gtONLrDSgZU8I5ZRD74KM1qtWDAL/sKitonQY/QcOemKGi/PGGwP+7oyV4gFnp4Zj66D5UapIJx09aRnpUt2aWms4EmlI/6hPJVTdHF4tFjuQnvq45snO47JponmZxJ8LAqn8xWsX2Sq4nJL16HE1G9UObXH10XBp2b8tkB74USCgqFxjcfNKPrKOMyTOpvZGdONvSUbDS5rUGW8Dsz5GMNtxzi6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB8692.namprd12.prod.outlook.com (2603:10b6:a03:543::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 19:45:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 19:45:57 +0000
Message-ID: <467ce12e-ff42-4244-909a-9d40a3d35ceb@nvidia.com>
Date: Mon, 29 Sep 2025 15:45:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <2025092157-pauper-snap-aad1@gregkh> <DCYHCLM67KRZ.366VS9PDKLYKY@kernel.org>
 <2025092125-urban-muppet-1c2f@gregkh> <20250923222434.GA2479829@joelbox2>
 <2025092425-sinuous-playoff-3618@gregkh>
 <76f87707-17d8-4cb0-8c81-e67ebf62984a@nvidia.com>
 <2025092924-cork-mobilize-cfbf@gregkh>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <2025092924-cork-mobilize-cfbf@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:208:91::40) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: 60096d72-0180-4d6d-be3e-08ddff90ce91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm9TRTJBRjlEYkxKWUpSOWhnVUd5NkdBdUhwUGVMWWRVQjdDQ0J0ODFCVGlr?=
 =?utf-8?B?dnNVUVEwZ0Z5TmUyNnh6K003cU81N3FYZjNVbk1UdmZkSndTRlkwQ2daeFpO?=
 =?utf-8?B?YzQvWGxKcVhPT08xME9zNytEeWZNaVIyV3VneXVWMXRyT2RXOEdVZ0FRdzJp?=
 =?utf-8?B?cVM0U2crY0VBZmw1d212SDN4bWlRcE5ZR3pGVkZ3MU1zYmx2ekx6NXBhLzJD?=
 =?utf-8?B?QlBXbWIxdXc2ZHdiejErQkFxd3h5ZXpOUnlHOUFMSTc2TllQSUZZcnR5RXZi?=
 =?utf-8?B?eVBTU24wY3JmekthWDk4d1Zna1F4WmVNeUNhNDFEUmpydWtGOGRpbHkxUFY0?=
 =?utf-8?B?QVhJejJNUlNwQVpiZU51NHFyalZBOVhpdzYzcUNOY1dSSmpiUTRRQmVzWkVU?=
 =?utf-8?B?cStjRzlXYVBvM1pWdDNtY3VuZDdPajlMSSsvNDhBdVV0RmI0Ukd0YmhOWjB3?=
 =?utf-8?B?UmNxUGVvTXhYdFZNMWxWS3JrK2xxQmZCWW1GTGZlam9hYzZrb3VjUmtrekcr?=
 =?utf-8?B?d0lUeURoUjVGQ1F6bzUzNDh4UDF3YVJFRndkMnFxOUZBaGN2WFNqRzRhUk1K?=
 =?utf-8?B?RHNLdGtvL0NqWnVFS01OZDJxNW50Z1dKM0QyUCs1dHA0WGp2SzE5L3FXUlpI?=
 =?utf-8?B?K3VRZEpMK0k5OHN3bzJtNUNmQ2prMFN3SUNsN3Fyc2Q4Ym82UGpFay9hQjls?=
 =?utf-8?B?aDhXUFdJQkRxa09HYklreXltY3ZhSFZiM04wRk9XeWliU29UTk1IcWNQeEQ1?=
 =?utf-8?B?YkVSeXhGbCtKUHhoZ0NITVFaM2E1S0FuYUR1LzhYam1iSXhYQk4vWkVuTXlU?=
 =?utf-8?B?YVdYVHBpMm94Z1NSMS94SHJQWDFua3NBanVRNEZQT2syUXpvejdtb1pKMjBu?=
 =?utf-8?B?OWljeXlQNUJTbW1YNEFySmVRVUpLNGJ5amtLN3hySGw1TEhBU0JBUUwwblVk?=
 =?utf-8?B?NXk5eFFVdXpVcnJMSm9ianlmNWNCbmUrQTViam14cWJnd2U3RU9MWExleUVK?=
 =?utf-8?B?K3hnSVFhdHZZQ0trWVpZZGRyS05lZUZPcjMveml1WnBMSktiZDlpbHlJZ0R4?=
 =?utf-8?B?WHRtdG5EN3N3S3BpbG91d2dpMjRFd1o3bnIyL25oczRHVUtHOTlTRlpxc3pp?=
 =?utf-8?B?QUFmaFJ0VFlTUHNhUGZBNSsrTHM5cGV4Y0hTa3JBRG5PVTBQN3F4dkpzcmdT?=
 =?utf-8?B?WmhSWlp5bmdubFRIaXFPTENReDBzTlpNUnFYMFhJcVRNOUJwdU9HbkdSbG9y?=
 =?utf-8?B?NHdwK1dHUzZNVFI4dEw5YWUrQTJvS3hVZEZJaWpMMnFiK0E0OEJjSGRodmww?=
 =?utf-8?B?QzVEblluSFBiQXFNbVF2ZWRlVmJ5ZDZDUlZIelJqcTFaNllFTlovMTZXTnd2?=
 =?utf-8?B?UnlsbWFya1R2QTFodjhCVEpOTDBwNGVua3FzSG5rQVZPc3AyY2c4dGR0bnBN?=
 =?utf-8?B?UEVvRTRTVHNNSkQ4ZUJwcEx2a05ubWltY2E2MHNZVHphSjlBQkk1bGlMTkZs?=
 =?utf-8?B?dm5Cb1F0cVltWDVtV3E1WitFZmt2YnJGNzFCZ1hNU2Nrdk5nZi8zTzFkSFZn?=
 =?utf-8?B?MnY0OTBMQnc1TEFEVE5TZ3VOdDRUUjY5MkdwTlF6a1ZsSmw0bVo2cmJrSUhP?=
 =?utf-8?B?aEtMTkQvTHBpamVPY2N2Rjk4SEpZY1NTZ3dLOGhWT0RKcGVLZWFyd1ZiUktL?=
 =?utf-8?B?QU0yL0hnZkJGb0xiNi9ZbW95WDZKWlUrazIrbUxHbG9McjlvUVFuM3FrVHlY?=
 =?utf-8?B?OGpKRllrejR1ckpFL25GQVA4NVFRUHcrWjhDRXhKdnlzUC9WOWlxWWxYK3pY?=
 =?utf-8?B?YzlXT2JXS2FxOFIwVlBTaCs0WXNFUWE1SjREM1NVbE5BMXRETm02eTJmRkJO?=
 =?utf-8?B?bGE0dys4dTZ4TCs3TFhUTWpBYWRDNVVKelM4QlJWVm5yQlBKd3ViNzVkTnRY?=
 =?utf-8?Q?EJtXtaZrReqHXKhrbwao957tM75jK6Rv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2hLVzJSUURNOEp6eUNJV1NJUDlJV3JuVVIzaXllcWdTYlk4dm4rcU1aS3d3?=
 =?utf-8?B?VDErcHZyVkRjZjB2cTJ0dE1YVTV3TkhBTGppTXBZdHozNDZpVnNadDdBS1Q1?=
 =?utf-8?B?bHdIY0tIYm9LYkdJYWlpZlNOL28rZnMyeTNTeWRDVWczdkdHdzlFcTJkSWE1?=
 =?utf-8?B?R3lKTVRYQW8wRm9RY0g5Y1lBSVpwWGlqN29pcklDbUl1dlJOR0I3bHF3eFBh?=
 =?utf-8?B?bHJOdFdBUnRTa1lza0FQalEvY1VsL1hxL2V6Vnd5WXR2dyt5c2Jrc0xkemVq?=
 =?utf-8?B?dGRkMHVpNUgyVUFwZmtzTVE2ZVpGNXhmY3R2OSt1T1E5SEQ0bkhzK1VDbnZS?=
 =?utf-8?B?eFNGaEY1elgxTmxmaUZIQ1V4TzQzMEkrQy9OanE4dGJNdVRaRTcweCs5RFN4?=
 =?utf-8?B?L1VuQS9YTDZXcGRtbTh1TkpNdFZBeWhNN2xOL2Ezb2JkUlZ0MWQzVklvbEh5?=
 =?utf-8?B?SW5hTldDNGdTVHlaU0pGSkRUSEZJUExBZEhTbVJXTXlHcWxWZS9kbENUeWdo?=
 =?utf-8?B?UVpzOHgybVhpb1dxOHNCN1ZzREIrMmZmaEIvbEZZalVQd3kwVytTK1FuaS9m?=
 =?utf-8?B?VXpSZzZmTHBJeklmTGZNVDI4anNMTzZaYXFFNUl0WEpXOGRreWtnYTFUd2Vh?=
 =?utf-8?B?UGtab2NDUzkrK3JKM0ViN0pjVkZjWkdxcHhRY2hWSy9XVmt6dVhwbDdoUkZs?=
 =?utf-8?B?SjdmWDM0cnFNZnZCS2RSSGtwVzZpd2lsYy8ydlo2ZnJoRjBXV2ZvQXF6RUdm?=
 =?utf-8?B?UzNxR3B2aWovaytxbmsxYXVvOFo3QzZLQWw2VUxVOWVHZkZxTkhiWkM2dUpE?=
 =?utf-8?B?ZG85RHVzbkh5L3NZVGI2VDBVeTVwL0dkSlIwVjhFQ3NNVktzemN5Ym9hTkFL?=
 =?utf-8?B?N2VCaGpMZElUUk9hdk5HTUsrUkJYUzJGUGVyY1FGckYva1NLK3dBODU1NzFo?=
 =?utf-8?B?cXRnRHg3T24zQkgrQ1FYT3JjaVlIWHBVeUdVYkFKdWpyNEo3TVlGSkVoV0lU?=
 =?utf-8?B?UUg0WDV6VWFDQ2VQS2d5TmdtRVdFUUpzelN4RmZlYXRva2g0ZGFqZG5NV3I4?=
 =?utf-8?B?V1QrRmJZRThBN255aHZVeEdWTXZkUUE5ZVpSSnVsK1pJMTl4MXRybDl3bURQ?=
 =?utf-8?B?QUFIRSt1aC9KQW1jYTJMUkVlcit0TTdicUlYMU85N200bllXYlhqdUxYQk5G?=
 =?utf-8?B?YnhESXFZaHV3eHo5NmpmWTFZdU1QREFJak9lc3piNEhPdG1SbDFsQ3BLTzZO?=
 =?utf-8?B?cnZPc1NMU2xmcm1KN0xzREx2SFlWWi8zcC9qZnNnMGhsY3Nyd3EvVDZBdVFq?=
 =?utf-8?B?M3ZGdVcrMGJySHBwVExFOW82N1NYOFhobFVCV1gxOWpEbnp1VTdvdmY2Nktp?=
 =?utf-8?B?WENWOXBpQXZqczB1MEFuQnArek1RdDhEaUdaZmJic0t6Mm9WRG8wYjZDcUNE?=
 =?utf-8?B?UmY4RHJMN2ZSM2VqRFlnOXpUanhEL0dTeHpKSHVUUWZ5RURiZGYwVldRTFhD?=
 =?utf-8?B?ZkxOYmdXM3BITkZrS3YvRGJ2UjZWOTJsNDlPSDhselRsbUw1QkdwU1o0YlBO?=
 =?utf-8?B?bUNQUjE2SzZsRDl4YytqUUJ0dlJaL2pDbDR3eVJlb1U5dUtJTkZ5dXloVnlT?=
 =?utf-8?B?TFMyTDZqb3NXcUtBVTJaQTBGTWNtT0prSzNqaTlXQXU5L0xmTUp1V0NDd1hq?=
 =?utf-8?B?cW9xLzhEdCtoTDRHT2hQcTVLVVcxUUVRak9scE1McnM0YlJaL1BMVUVnc2Zz?=
 =?utf-8?B?VkhkbmJUaHJPRTJHNnVxdzRPTDhCdFg4VmlweXdrR1FGdVFKRXRjbFVUeDI4?=
 =?utf-8?B?UU9XcDVSUkY5akUrT3RGU0hZQnU0TDh0bDVCUFo4T011QnA3ZkNnbmd5ZXV1?=
 =?utf-8?B?YndJRXpDNEpOOXBTZk8rMjVGK2daQzFqTVlUaHdkMWx6bTd3NW1oK1gzNU5t?=
 =?utf-8?B?QzFCWGJkV210NWxpbWpwZzl1Z3RSVXNHdXFZMFVVMGtoaTR0RzRHVHRjZ2dp?=
 =?utf-8?B?dm1aRVN4Si8yWG42Z3RBcDlCK3Z3TWpSNFVTMzRSUGNodGV6dDUxRzd0SkhR?=
 =?utf-8?B?SUVTeHBva25yZE1reXVaQkZDZzBOdTZPcFlVVkErbS94UnhieU9LWTR4ZHBZ?=
 =?utf-8?Q?5wK8jT8qRzMrYWfeGdw9fMzLF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60096d72-0180-4d6d-be3e-08ddff90ce91
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 19:45:57.0825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wsax5e7bWQhU0xTYGCUJUsd0myI4aIhnAoL8EOWQ77R4HUPp63S8D6cGY/BvKK4nCObL3efzdBOEMslF25AXBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8692
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



On 9/29/2025 9:37 PM, Greg KH wrote:
> On Mon, Sep 29, 2025 at 03:26:57PM -0400, Joel Fernandes wrote:
>> On 9/24/2025 12:40 PM, Greg KH wrote:
>>> On Tue, Sep 23, 2025 at 06:24:34PM -0400, Joel Fernandes wrote:
>> [..]
>>>
>>>> For the separate issue of enforcing endianness with respect to (across)
>>>> multiple fields, I agree with you that if the user's backend (the consumer of
>>>> the data) is not doing such conversion, say via regmap, then that becomes a
>>>> problem. But that problem is orthogonal/different and cannot be solved here.  
>>>
>>> But that is exactly what these macros are being defined here for, so to
>>> ignore that is going to cause problems :)
>>>
>>
>> If needed, happy to add endianness support as needed by providing additional
>> options to the macro. Based on this thread, it sounds like we want see if that
>> is really needed here or can be solved elsewhere (?). The mental model I kind of
>> have is this macro should only be dealing with CPU native endianness, much like
>> bitfields in C deal with CPU endianness. Hmm.
> 
> Just don't go down the old path like drivers/net/fddi/skfp/h/supern_2.h
> does with it's definition of:

But this is not a comparable example though because in our macro we specify
individual bit numbers, not just bit width. So tx_length for example would
always start at the lower 2 bytes since we'd specify "tx_length 0:15" regardless
of whether those 2 bytes are higher in memory or lower in memory.  Whether it is
higher or lower depends on CPU endianness AFAICS, and if interacting with HW is
needed, the user of the macro would do endianness conversion. Maybe we should
add a comment about such conversion requirements?

Then there is the issue of the byte ordering within a multi-byte field. That
again follows CPU endianness, and we could add a comment for the benefit of
macro user.
> 
> 	union tx_descr {
> 		struct {
> 	#ifdef  LITTLE_ENDIAN
> 		unsigned int    tx_length:16 ;  /* frame length lower/upper byte */
> 		unsigned int    tx_res   :8 ;   /* reserved      (bit 16..23) */
> 		unsigned int    tx_xmtabt:1 ;   /* transmit abort */
> 		unsigned int    tx_nfcs  :1 ;   /* no frame check sequence */
> 		unsigned int    tx_xdone :1 ;   /* give up token */
> 		unsigned int    tx_rpxm  :2 ;   /* byte offset */
> 		unsigned int    tx_pat1  :2 ;   /* must be TXP1 */
> 		unsigned int    tx_more  :1 ;   /* more frame in chain */
> 	#else
> 		unsigned int    tx_more  :1 ;   /* more frame in chain */
> 		unsigned int    tx_pat1  :2 ;   /* must be TXP1 */
> 		unsigned int    tx_rpxm  :2 ;   /* byte offset */
> 		unsigned int    tx_xdone :1 ;   /* give up token */
> 		unsigned int    tx_nfcs  :1 ;   /* no frame check sequence */
> 		unsigned int    tx_xmtabt:1 ;   /* transmit abort */
> 		unsigned int    tx_res   :8 ;   /* reserved      (bit 16..23) */
> 		unsigned int    tx_length:16 ;  /* frame length lower/upper byte */
> 	#endif
> 		} t ;
> 		long    i ;
> 	} ;
> 

This is indeed yuck though but afaics not what hopefully we'd be doing ;-)

thanks,

 - Joel

