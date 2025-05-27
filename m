Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468AAAC51A6
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AD310E3DC;
	Tue, 27 May 2025 15:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k1GgL9jp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F42910E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 15:10:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJlplHqIYbKJxd2VKG+GpIaOA+KehSBDR/FAa6BUaGZ1CngiflnZM9Ps//pxdJQAnXUW2j5Za0D+2vNhASMon5L/jAdGP8V9M8CroDJSfUqQIpFHhhxmuuckBCnKZSqv0PDQbFK2/YCuZ6DCRuumfMVLg7qXQAE7mqxQxekY8vwYTm/mLFUPcbHORXlCBAKf4b3IiAH04eU0dj194VIKIs7IySDcZHjWqWZepweogytuncoyvWVnPsV74R4xqVuxOjvhb9LUIccDTyiKkNUlI7l1xhfQAktK3EGd0A5SerNsL4L51uSoliEX8j/jyGStvSdckcUIkmnDsuFrH6GCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbHN0AssXKaXhGiBtqaJelUl051jRGfmIAzeLo+Z5Bc=;
 b=yNow1i5RngjajFj07DrTnOvwocCAzi3+KQcR1ngD9sU4gdmHGozMQbu2SShGXJfgpbcvG4t6jZmFS8fzqOl2p9hlcLjvUJNlw30iEHZ/VeUXIl0xQc+YwIRy1n/wGNEAzQxeyR7nDdubNHvo/7NpuhBIV/xfuMiwNBH/pbp3X7Ci9ImMYlMVe5DaB7mqDuDzx6XgJnvtsAco/40McPlu+6vEhTnPIt1L+vTfyzHpRIOuBomN/sGQjArycJAwCV/kaV2Hnh4q+fmbAjurIZAZbb882S720pb4M5GEzPX2qVy0mNUdqHjP2iXJFmZDTIcn0r/QKqELNKf1ZEfxRaj36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbHN0AssXKaXhGiBtqaJelUl051jRGfmIAzeLo+Z5Bc=;
 b=k1GgL9jpLB4SBYD1mVdSXqFsnZp2JwWNjUurgYXk1sMA+ntCm9z2SD2JpfY4NvzkUpYJSc+C5i3ncOSj3dm6EIhW+2rgQssQeU3lEENHCOGU/J/B8aAzzd0uZBO18+eo2wdjXdh6/qcPIl9yGprLEYlq5XSNwuzsKaDwiIXqR7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 27 May
 2025 15:10:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 27 May 2025
 15:10:23 +0000
Message-ID: <48ea826a-54fe-4df0-bff9-18ae29117f57@amd.com>
Date: Tue, 27 May 2025 17:10:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>, "T.J. Mercier" <tjmercier@google.com>
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>,
 hanfeng 00012985 <feng.han@honor.com>,
 "amir73il@gmail.com" <amir73il@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "hughd@google.com" <hughd@google.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
 <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
 <2755aae2f1674b239569bf1acad765dc@honor.com>
 <2487bad4-81d6-4ea2-96a7-a6ac741c9d9c@amd.com>
 <a3f57102bc6e4588bc7659485feadbc1@honor.com>
 <5c11b50c-2e36-4fd5-943c-086f55adffa8@amd.com>
 <CABdmKX30c_5N34FYMre6Qx5LLLWicsi_XdUdu0QtsOmQ=RcYxQ@mail.gmail.com>
 <375f6aac8c2f4b84814251c5025ae6eb@honor.com>
 <38aa6cf19ce245578264aaa9062aa6dd@honor.com>
 <CABdmKX0nAYDdgq-PHv0HxucfYQzvvTAJjVCo7nQ0UtjwcF02aQ@mail.gmail.com>
 <7198873a044143c7be12f727b469649b@honor.com>
 <fdd7a11b-140c-40bd-a1c1-334d69256b92@amd.com>
 <e61fcdbf71ba4f9dbfef2f521d1b2fc1@honor.com>
 <d786ff9f-9bf0-42e1-987f-f2091fd90279@amd.com>
 <068cca07bc5a4e68be5355c884843b8a@honor.com>
 <4a53b6bf-9273-4e77-9882-644faafa200a@amd.com>
 <d7b506bd3be242d290b57449c353c07a@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d7b506bd3be242d290b57449c353c07a@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0127.namprd02.prod.outlook.com
 (2603:10b6:208:35::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: e6fcf68a-e153-4865-4180-08dd9d309a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVlyMEtDMG5STURuUDRKZGlGeGw5TldBRzFIMXpkbllheXZkcitObEpNR3Ez?=
 =?utf-8?B?b08yOTRqUnBJdGd6QVhpYUJpUS9WejBZQWxrUmJGR3ZHZ1N5VzRFUXQ2dCti?=
 =?utf-8?B?cFZDMmQ0V2d6N3JYM3R2ZGc1WGM3QUNlY2ljVkZJNFNsNHRDNTJCSFk5U3NC?=
 =?utf-8?B?YVBVYXJLLzJaVUFmblR5SWcvL04vdmNrek5Pc0tyS1J6L0VjSTJuMTdKWGZy?=
 =?utf-8?B?UXZ6Nnh4dm5uN2IrNWxpT29pT0F3TXUxaU5xNURweC92NnBpYnNva2xQR09Z?=
 =?utf-8?B?TEpYbjJMYmlZSEt2aDF0TFVPc0NZUm00UllFdEkvWm9Ick1vc3RuS05KNFdq?=
 =?utf-8?B?Nll3WURDSUo5VDNzMFh6NXNuQ1R5N1RqNC9reTN2YVBCTE4vc0NwWDA0dS9r?=
 =?utf-8?B?VHg2QnVIYUkwOEU0MGxQR3htQjVFUHJOU25haVI2dlBVdTlCbXo4VUhzZlUz?=
 =?utf-8?B?UDlnYUREVUxJd0ZmWlRNOWxOb0VUVUI0U05HNGZZQVIzcDNBODRDQktaMHRL?=
 =?utf-8?B?aXpsTktTZGZoNFdwVVJzNXpvOWM0ZzhKdVBSK1ZrNk1TZjkrVnJKdGR6WGF5?=
 =?utf-8?B?UDYrclhscGY2WlBmVnJvTHlKS016VDd6dDlsMUNNNmRtVGUvQUZ4VTg3VWo0?=
 =?utf-8?B?K3BhZEZRSzVEZzBmRGtST1FXRDFSVEZVbFNGM0VsbkJwS3pqZmp2Z1BRZmFV?=
 =?utf-8?B?VlpNeE9iZUpBNk5GckUvd1AyaUlGdmZhUnBWZUJZdmhJT1RkQzdFeWVqTmoy?=
 =?utf-8?B?cE5sZDlFNzdMYWQvWHl1VVNsSjdmbUZ4Y0JjemtFY2Vrb1RSSFJnVVpodnc2?=
 =?utf-8?B?cUljcWtCYy8rQ1RnTjZ4QzQ2WG9ScTV2T3JVb1B0ZGJVOVcvcHJaM29Tb3g0?=
 =?utf-8?B?T3lvOWxxWi80VkdubzY1RytFVnEzQ0dXbytrYkNqemVPNm9GdlJjSG5JQ25V?=
 =?utf-8?B?akFDYXcyVlBJRldSN1RvbUk3VGhCSTloYmN3VitFSkhCcnRsTmErNkNpMFlQ?=
 =?utf-8?B?OEIzRnVNVEZ4YndrMGhOdlZoSHBQNnZ6SThNS1E0Tk1iRFU4TG9BWEdmQmt4?=
 =?utf-8?B?VTh3cTVScFhtWElVV05TVENOdFEySHNvYWtrTlNsb1duV3NSNkM2WTNIKzhH?=
 =?utf-8?B?SjM2WUNGRDZCTk96QittaFBmaDhlblVoMUthRytURkVaR3NGcE5FMGhrTU9L?=
 =?utf-8?B?d1M2MytubEZkdGFuclc3dTY4NXR0Um5LaVlKVWVSNmpqeHl6OHpYY0NDMGh4?=
 =?utf-8?B?VW1yNnJBc2YraHNCS2p0YitnS0F5UTk2cXcyYjlVRCtENk1paURDZmpoYUtW?=
 =?utf-8?B?V3E4RDNDR0Z2ZEJmMXFONlFJQ3F5UHhtVEt6UmFmRXcrQjJqUllmelVNTTh3?=
 =?utf-8?B?dlNSTXpOdVJnUEpxU040MC9oMWZXUGhKVWFwY0NyTkdSTndLdTdzRUF3NnZM?=
 =?utf-8?B?M0tlT1JORXo5Y1VlTGNOSnVXM200bkV1dTBEOUxXT1pGaWZPWlR3OHpNbWtX?=
 =?utf-8?B?SzJjcVFzWjBsU2pNZWVlMEdKcWlDWUNNU3hueWZRblh6NmhUUEloVE1mUUlW?=
 =?utf-8?B?QUhScUcra0Uxd2NBSzRNNmVwY3R2L0kwY091ZUFPUm1WWjlqN3IxNGZ2bjBp?=
 =?utf-8?B?R1Q3RHVQMWtJZDZSQWhwUEdJUWNHVVlTd2IzSjgzaTdiMVEwZlZmYUZhMlR3?=
 =?utf-8?B?cGR4WERBR0JIWjlrc0YrSlI2OUZZWGpBUWdWQXlqZjk0VXZYeGxFQzRVUkdF?=
 =?utf-8?B?TWFrV0Z6c2RvZVphQm9VR0NPdDhRN3hrL1o3STUrbERnOW1wb3ZWUnZEZEUr?=
 =?utf-8?B?VjVBbkJpdFpkZEdaVVJxa2dPcFc0d2hsRDRERloyWlFqcXlRT3NJN3h4elVt?=
 =?utf-8?B?TDRnZWcwalBwWExDMit6WEloMHFRMVBGams5RHhLS2FmTWUydVlPQzNLTllK?=
 =?utf-8?Q?ApYunOKPC4A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVg1RUxYRXM5bnFwRmsyTVpiaVFScUU4d3ZDVE4zZVRkT1VHdzlwNFdUM0hK?=
 =?utf-8?B?aFc4anRhZHFwK2wwTTVtdXZSSnI3d3RHd3ZpZ2hmbG9DaXdTZmZNb3p4RzY5?=
 =?utf-8?B?djhreHFMbENQTFhubURnWE12dWhidzV2OFNHd3dPMEdzQXM0TzlHVGJIdUZt?=
 =?utf-8?B?ZklhMmI5QnF0ajdRTExDSmtvejBSZU9ITDVqS1FPV0ZnZEt3cStIZmFJQm5v?=
 =?utf-8?B?MU9DQTZScnJXdzJsQWwzY08vVjNVM1puRmhIMlpvM0E5aUxURFFvRHR3Y2JT?=
 =?utf-8?B?ZlYrMnVTbEpscHJTazMxZFdCZEtpWHJmdjBIZ1FPN3hxZnMwb3ZqYzBlaHA0?=
 =?utf-8?B?bUd0Vm9DcFk1NHhTTzBodWRMRngvaGVNUTQzdGJ5Tk00OWdOektaaDVpUjdx?=
 =?utf-8?B?Wk5XdEtNaWJPZXhDUzVqVDd4SGtzaExUeEJpMVdOcVhFZ3NMR0UzR0hQemk1?=
 =?utf-8?B?SUpXcm52M1NLdkZrRTdWYUdVMTVHamsxOUw1emxtVXhHUVlLY05JN1gvV1Ey?=
 =?utf-8?B?b083cG5zSTJnTU5URHEzVE5tN3N0Y29QZWE2SU4vaVdJZDN3YStFZ3ZxUzda?=
 =?utf-8?B?RjhjN1hzbFljT3ZXR1RPTThKL29JaTBxaTlwbXpyNkFQdmxTUTlQSXhIajZl?=
 =?utf-8?B?TlMyZE15RFV0VTJTdklIMG03UDNrQWlmSnU4blpMT2RneTdDcFZsNzZlbDZQ?=
 =?utf-8?B?NllOZ2E2a3JQY0FwUUt6eXdJbG00MUZ2Rjh3NkVIekNzQkgxWGFXeHZxUnEz?=
 =?utf-8?B?Y1BCTGlGQ21IRjA1ZkdSNTYwa3pDTVAzbnFPV2VWM1J0S09WMG5IdkNwUFgv?=
 =?utf-8?B?aGh1ZlAyT3R6VXJ4S1YvOEZmL05ncUJmM1B3L2QrK1BhRHpQc1J6a1k3VVhW?=
 =?utf-8?B?b3JaZkViRHpYRk5zMGlxUFVyaDF3dkZmZUxJa0xXSnpqYXpHWWQ4MjBXNXI2?=
 =?utf-8?B?ajhtM2tEaWNhQjRXbTFCcWxWVUw2Rmg0VXh5V2hqR09xUWJVUWI5anl5WTBk?=
 =?utf-8?B?cjRFSXh1RmJpWm1EWkczcEREanpyWGxtRldxSmpoQlBYYzZLRjFIMkw5RFFX?=
 =?utf-8?B?R2ROVE9EYU9sTzBNc09aLzBtRkdBendXbm4zeXdOMkxuZ3lCSW4vNXY4alJ5?=
 =?utf-8?B?UEdmdFlNNHY1OFpkRFRqSlhnM2tQOTZOOCtGTU8yWmZvTjN4WmJOR0Q5eExR?=
 =?utf-8?B?b0NNalVhVWMrTmpLQ2hBQnpyOEcrMmZzNk00dHV3VDBRdkxIQXZIdGRXc3Vx?=
 =?utf-8?B?dWpRbXNiTGNaRHd5VzdiYmRMZ2I4Z21YWFVuK05nT1dOOUc5WHBYK21EUmFQ?=
 =?utf-8?B?MFdid21jNjBOcldvcytWV0MyRHdiWkxaaHJGSlRUa3pkajI1Zm96NFpod2Yz?=
 =?utf-8?B?UXl4NTNEQytjZVV5RjRiQTdGOE84Qzd0MEVNaStyQzVUVHJDTXl4SnowSVFq?=
 =?utf-8?B?V2F4NzUvRnZ3ajBZRXc2TUQ0cVhXblB2bkxqUTE1a0ZGR1NucUcrRCt3L2pk?=
 =?utf-8?B?TG5MVllpUGUyYXg1ZWludzZ1alNVSHRJSGtKRlY5dDgvNlJwNnVWVWszcFcw?=
 =?utf-8?B?Nmx2aWpUUFdoNEYvRW1leG1PaDE0NFdISllBclpWNENid2VHVnpSV0NPc3No?=
 =?utf-8?B?VkVXZ0ZNUmpjMmNXREN4akpZaE9QZTVOcDRqVkdrMlRnc3JwVmFOaVl5a05E?=
 =?utf-8?B?QlNsSVNmS1p3RHJ5L2ZQNU9wdjl2UFN0OU02UWg2Z2hqOG54dGRJZ0sxaUlu?=
 =?utf-8?B?enNrbkZpYmcxcFNaNkwyMUhzVWFtSXl3YzExRHZqd01VRkl0ejJ2blFDemZm?=
 =?utf-8?B?NVFHWjFqVEdHRE1XTDZZTmlTZ1VQdHF2aDVkYzd4V0p5bXI4RDVHY3o4MHBD?=
 =?utf-8?B?azVSZ2h5QXhJL2VwenRmbEhHKzdHM3EvYkcwSXhHbzBBWkpGaGNseVZtYmRX?=
 =?utf-8?B?aWVHenQ1UWdqeW1mSURkUTFmc3dNcFVPVVNWaXNpQy9kMXNZUm1RR3NsOU45?=
 =?utf-8?B?YWJRMjhtdkJMVDYycTFOZnlPNnhjTUsvazM5TEJ3Qk9KMVVDVGhwL3o3cGtB?=
 =?utf-8?B?ejdzbHpxV1JUc0FmVlZZQ0JpaXBxZDVxTVV2ZTd5OHpQWEIvWk5oT2R4QkJM?=
 =?utf-8?Q?DPEg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6fcf68a-e153-4865-4180-08dd9d309a65
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 15:10:23.3875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9eV1d3vZqu0k5aDn7R0dPVJQgMjkJFg/qH+6FCIlSqHqGksIiZ6pDfAUMK/3Tdl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273
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

On 5/27/25 16:35, wangtao wrote:
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Thursday, May 22, 2025 7:58 PM
>> To: wangtao <tao.wangtao@honor.com>; T.J. Mercier
>> <tjmercier@google.com>
>> Cc: sumit.semwal@linaro.org; benjamin.gaignard@collabora.com;
>> Brian.Starkey@arm.com; jstultz@google.com; linux-media@vger.kernel.org;
>> dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; linux-
>> kernel@vger.kernel.org; wangbintian(BintianWang)
>> <bintian.wang@honor.com>; yipengxiang <yipengxiang@honor.com>; liulu
>> 00013167 <liulu.liu@honor.com>; hanfeng 00012985 <feng.han@honor.com>;
>> amir73il@gmail.com
>> Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
>> DMA_BUF_IOCTL_RW_FILE for system_heap
>>
>> On 5/22/25 10:02, wangtao wrote:
>>>> -----Original Message-----
>>>> From: Christian König <christian.koenig@amd.com>
>>>> Sent: Wednesday, May 21, 2025 7:57 PM
>>>> To: wangtao <tao.wangtao@honor.com>; T.J. Mercier
>>>> <tjmercier@google.com>
>>>> Cc: sumit.semwal@linaro.org; benjamin.gaignard@collabora.com;
>>>> Brian.Starkey@arm.com; jstultz@google.com;
>>>> linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org;
>>>> linaro-mm-sig@lists.linaro.org; linux- kernel@vger.kernel.org;
>>>> wangbintian(BintianWang) <bintian.wang@honor.com>; yipengxiang
>>>> <yipengxiang@honor.com>; liulu
>>>> 00013167 <liulu.liu@honor.com>; hanfeng 00012985
>>>> <feng.han@honor.com>; amir73il@gmail.com
>>>> Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
>>>> DMA_BUF_IOCTL_RW_FILE for system_heap
>>>>
>>>> On 5/21/25 12:25, wangtao wrote:
>>>>> [wangtao] I previously explained that
>>>>> read/sendfile/splice/copy_file_range
>>>>> syscalls can't achieve dmabuf direct IO zero-copy.
>>>>
>>>> And why can't you work on improving those syscalls instead of
>>>> creating a new IOCTL?
>>>>
>>> [wangtao] As I mentioned in previous emails, these syscalls cannot
>>> achieve dmabuf zero-copy due to technical constraints.
>>
>> Yeah, and why can't you work on removing those technical constrains?
>>
>> What is blocking you from improving the sendfile system call or proposing a
>> patch to remove the copy_file_range restrictions?
> [wangtao] Since sendfile/splice can't eliminate CPU copies, I skipped cross-FS checks
> in copy_file_range when copying memory/disk files.

It will probably be a longer discussion, but I think that having the FS people take a look as well is clearly mandatory.

If Linus or anybody else of those maintainers then say that this isn't going to fly either we can still look into alternatives.

Thanks,
Christian.


> Will send new patches after completing shmem/udmabuf callback.
> Thank you for your attention to this issue.
> 
> UFS 4.0 device @4GB/s, Arm64 CPU @1GHz:
> | Metrics                  |Creat(us)|Close(us)| I/O(us) |I/O(MB/s)| Vs.%
> |--------------------------|---------|---------|---------|---------|-------
> | 0)    dmabuf buffer read |   46898 |    4804 | 1173661 |     914 |  100%
> | 1)   udmabuf buffer read |  593844 |  337111 | 2144681 |     500 |   54%
> | 2)     memfd buffer read |    1029 |  305322 | 2215859 |     484 |   52%
> | 3)     memfd direct read |     562 |  295239 | 1019913 |    1052 |  115%
> | 4) memfd buffer sendfile |     785 |  299026 | 1431304 |     750 |   82%
> | 5) memfd direct sendfile |     718 |  296307 | 2622270 |     409 |   44%
> | 6)   memfd buffer splice |     981 |  299694 | 1573710 |     682 |   74%
> | 7)   memfd direct splice |     890 |  302509 | 1269757 |     845 |   92%
> | 8)    memfd buffer c_f_r |      33 |    4432 |     N/A |     N/A |   N/A
> | 9)    memfd direct c_f_r |      27 |    4421 |     N/A |     N/A |   N/A
> |10) memfd buffer sendfile |  595797 |  423105 | 1242494 |     864 |   94%
> |11) memfd direct sendfile |  593758 |  357921 | 2344001 |     458 |   50%
> |12)   memfd buffer splice |  623221 |  356212 | 1117507 |     960 |  105%
> |13)   memfd direct splice |  587059 |  345484 |  857103 |    1252 |  136%
> |14)  udmabuf buffer c_f_r |   22725 |   10248 |     N/A |     N/A |   N/A
> |15)  udmabuf direct c_f_r |   20120 |    9952 |     N/A |     N/A |   N/A
> |16)   dmabuf buffer c_f_r |   46517 |    4708 |  857587 |    1252 |  136%
> |17)   dmabuf direct c_f_r |   47339 |    4661 |  284023 |    3780 |  413%
> 
>>
>> Regards,
>> Christian.
>>
>>  Could you
>>> specify the technical points, code, or principles that need
>>> optimization?
>>>
>>> Let me explain again why these syscalls can't work:
>>> 1. read() syscall
>>>    - dmabuf fops lacks read callback implementation. Even if implemented,
>>>      file_fd info cannot be transferred
>>>    - read(file_fd, dmabuf_ptr, len) with remap_pfn_range-based mmap
>>>      cannot access dmabuf_buf pages, forcing buffer-mode reads
>>>
>>> 2. sendfile() syscall
>>>    - Requires CPU copy from page cache to memory file(tmpfs/shmem):
>>>      [DISK] --DMA--> [page cache] --CPU copy--> [MEMORY file]
>>>    - CPU overhead (both buffer/direct modes involve copies):
>>>      55.08% do_sendfile
>>>     |- 55.08% do_splice_direct
>>>     |-|- 55.08% splice_direct_to_actor
>>>     |-|-|- 22.51% copy_splice_read
>>>     |-|-|-|- 16.57% f2fs_file_read_iter
>>>     |-|-|-|-|- 15.12% __iomap_dio_rw
>>>     |-|-|- 32.33% direct_splice_actor
>>>     |-|-|-|- 32.11% iter_file_splice_write
>>>     |-|-|-|-|- 28.42% vfs_iter_write
>>>     |-|-|-|-|-|- 28.42% do_iter_write
>>>     |-|-|-|-|-|-|- 28.39% shmem_file_write_iter
>>>     |-|-|-|-|-|-|-|- 24.62% generic_perform_write
>>>     |-|-|-|-|-|-|-|-|- 18.75% __pi_memmove
>>>
>>> 3. splice() requires one end to be a pipe, incompatible with regular files or
>> dmabuf.
>>>
>>> 4. copy_file_range()
>>>    - Blocked by cross-FS restrictions (Amir's commit 868f9f2f8e00)
>>>    - Even without this restriction, Even without restrictions, implementing
>>>      the copy_file_range callback in dmabuf fops would only allow dmabuf
>> read
>>> 	 from regular files. This is because copy_file_range relies on
>>> 	 file_out->f_op->copy_file_range, which cannot support dmabuf
>> write
>>> 	 operations to regular files.
>>>
>>> Test results confirm these limitations:
>>> T.J. Mercier's 1G from ext4 on 6.12.20 | read/sendfile (ms) w/ 3 >
>>> drop_caches
>>> ------------------------|-------------------
>>> udmabuf buffer read     | 1210
>>> udmabuf direct read     | 671
>>> udmabuf buffer sendfile | 1096
>>> udmabuf direct sendfile | 2340
>>>
>>> My 3GHz CPU tests (cache cleared):
>>> Method                | alloc | read  | vs. (%)
>>> -----------------------------------------------
>>> udmabuf buffer read   | 135   | 546   | 180%
>>> udmabuf direct read   | 159   | 300   | 99%
>>> udmabuf buffer sendfile | 134 | 303   | 100%
>>> udmabuf direct sendfile | 141 | 912   | 301%
>>> dmabuf buffer read    | 22    | 362   | 119%
>>> my patch direct read  | 29    | 265   | 87%
>>>
>>> My 1GHz CPU tests (cache cleared):
>>> Method                | alloc | read  | vs. (%)
>>> -----------------------------------------------
>>> udmabuf buffer read   | 552   | 2067  | 198%
>>> udmabuf direct read   | 540   | 627   | 60%
>>> udmabuf buffer sendfile | 497 | 1045  | 100% udmabuf direct sendfile |
>>> 527 | 2330  | 223%
>>> dmabuf buffer read    | 40    | 1111  | 106%
>>> patch direct read     | 44    | 310   | 30%
>>>
>>> Test observations align with expectations:
>>> 1. dmabuf buffer read requires slow CPU copies 2. udmabuf direct read
>>> achieves zero-copy but has page retrieval
>>>    latency from vaddr
>>> 3. udmabuf buffer sendfile suffers CPU copy overhead 4. udmabuf direct
>>> sendfile combines CPU copies with frequent DMA
>>>    operations due to small pipe buffers 5. dmabuf buffer read also
>>> requires CPU copies 6. My direct read patch enables zero-copy with
>>> better performance
>>>    on low-power CPUs
>>> 7. udmabuf creation time remains problematic (as you’ve noted).
>>>
>>>>> My focus is enabling dmabuf direct I/O for [regular file] <--DMA-->
>>>>> [dmabuf] zero-copy.
>>>>
>>>> Yeah and that focus is wrong. You need to work on a general solution
>>>> to the issue and not specific to your problem.
>>>>
>>>>> Any API achieving this would work. Are there other uAPIs you think
>>>>> could help? Could you recommend experts who might offer suggestions?
>>>>
>>>> Well once more: Either work on sendfile or copy_file_range or
>>>> eventually splice to make it what you want to do.
>>>>
>>>> When that is done we can discuss with the VFS people if that approach
>>>> is feasible.
>>>>
>>>> But just bypassing the VFS review by implementing a DMA-buf specific
>>>> IOCTL is a NO-GO. That is clearly not something you can do in any way.
>>> [wangtao] The issue is that only dmabuf lacks Direct I/O zero-copy
>>> support. Tmpfs/shmem already work with Direct I/O zero-copy. As
>>> explained, existing syscalls or generic methods can't enable dmabuf
>>> direct I/O zero-copy, which is why I propose adding an IOCTL command.
>>>
>>> I respect your perspective. Could you clarify specific technical
>>> aspects, code requirements, or implementation principles for modifying
>>> sendfile() or copy_file_range()? This would help advance our discussion.
>>>
>>> Thank you for engaging in this dialogue.
>>>
>>>>
>>>> Regards,
>>>> Christian.
> 

