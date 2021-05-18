Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23545387E39
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 19:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8F56EC43;
	Tue, 18 May 2021 17:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2074.outbound.protection.outlook.com [40.107.212.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE746EC43
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 17:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heip+Cj/QHqJtU62xxuvRJl98z18gzpV+QjmSxQrgn5JOj9a19BiCKXPSCVjL3DwURBos1v6+NbXxuLUAivXNFJstvGIG+U6qBguAKkKqGsqEBOdIFQoaeELmHNPKehcg8UI06mE+e4gHtOJsMtuFkKAMZSd+FxNzk6CyyYa+6SodB1k3Q92w+1hPqFenEP0uaFksNrcHQgy8wAe87mtCbRENpjI19XbAgz1AgCi1WxWFNFSkydoWARvpxOIzVVYFI6GUe7HTxgdMMIx9k3BELEixnasixVDpnJhDAk0ZxCbrc3h0S7AvS91j+fxQdRk4wNEvF/L+Iyg2TQ/u/4A6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yf+G6Ub8JNKoOvXfcWoD31kE2CeG6zG12VktJp/IoGE=;
 b=k5lyAEwezQrx+e/Oibnj/ZEyYgkTmnC6q1OJ0zYJTFDdvAtVCFO3IksiWaF/S+/346oZOfbr0xAlRWbfQTAAGREHk9HHzjErgHmxUkaINvMeK6K+pHsal83xeP+KytaF9KtcGcLtyWrSoZRSHwz1f3Cv+pF6plyioP+oN+d//1PQxInEpSyz2iqzUT5Tv3Ox8jO1UXoq7N4KJbvOEr+O3iZG2grO1+6QL4z6kqa1uS+23rb2IlWjFm4FypmPYtU4wJMy6wOFjY0Ucz330ysJiUoIZvhnlGxkFIbFBhzQ+jXf4RBk3bX/MlXsv113AuMrPdbx/drqLBhDi/qmYP+9WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yf+G6Ub8JNKoOvXfcWoD31kE2CeG6zG12VktJp/IoGE=;
 b=SEbureJ5QyHMx/Q/s+p9IwOuQg4SyNiRxtfLbjYWV/zYHvY4/bbOzZ4SeeT4nmyXy1OejREKnZzqrdSDMD07vjy17q39j9kn12/Q9+b7uC5g/yxIXJeMcHd/lR2J0BKrK3EDbtYHCEd/JncRFnTmXSLWxN+YeLgMFaYinFwvmaY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 17:06:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 17:06:20 +0000
Subject: Re: [PATCH v2 13/15] drm/ttm: Add BO and offset arguments for
 vm_access and vm_fault ttm handlers.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210518145543.1042429-1-thomas.hellstrom@linux.intel.com>
 <9e465ab2-4272-4a41-2ebf-4b34d4724f77@amd.com>
 <b5483666-4bb6-d297-ff39-8fdad19ce4ef@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <778c8cec-8c89-f288-cd11-f2177257f6e5@amd.com>
Date: Tue, 18 May 2021 19:06:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <b5483666-4bb6-d297-ff39-8fdad19ce4ef@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
X-ClientProxiedBy: AM0PR01CA0114.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::19) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:88c7:d7d9:22ef:f850]
 (2a02:908:1252:fb60:88c7:d7d9:22ef:f850) by
 AM0PR01CA0114.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.32 via Frontend
 Transport; Tue, 18 May 2021 17:06:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88a76c5e-91ac-4806-929a-08d91a1f4193
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41425E6921C4ED7DCBD23D83832C9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NXRdSMoB3Kbk9RcSh4WOiRzI9XSfpcplWoSLXj62ZxjA/EV8jSeNfg+BSfR6ycGlWj+F027N5J4Ve0l/lyo+VlakKjsHJ64uQYv4t8/NZ/OHvD3vZBXo02e0TkPVXnOZwGEsPjvoG3/OB/eaErgp5Qe91jIunD2jkFOy7c+JdoejWoJzfvFs431swmrenNUEJLfEtn8o7/O2T/5YKcxHwrqBPMVwvznJplwyq3TMbrD3OqEYunCTHr0CydJAPvmcScq+RzNcn+8A6e4bA6dKgPViEOrSD6zymtkd6JnY3R5kWUyii81cbayyE14LCGp5alyTrN+z611zF5gQn6FZabytHiCHQBZxf0WDii/55HOC2seKchO/9xTnNYzzEASq5DWWINeJ+nNg4b6wBwfLd53/zFJQUfvaUyYMJzFSctACLbcv4FUlfccCZHj+lqAht6HJ8nmv4DOjPwDkoDqr3Si+eqlMtu/zbnDIabe8UlItZbq5n1XKEycu4nrwmLnKZIncxRHMIMbA20zI9X5/S/A/5LvywScXMg8TWvg4EDbu/nu0XyVE9Q57abfnNVPIfQGJ9h2BuO+dsTkuiEt36W/zdvGYO2tcLR/BlgSW9e/tlT8Tvk/itDa++n3T3p8patlCOXgnu7hZiiXEOpQYVAHrs+BJnC19d9ysM89+JzA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(2616005)(36756003)(478600001)(86362001)(31696002)(8936002)(6666004)(66476007)(31686004)(2906002)(52116002)(38100700002)(316002)(5660300002)(186003)(4744005)(66556008)(6486002)(16526019)(110136005)(66946007)(8676002)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M0NMa3Awd2taeEl4M1lGZ2VkMXJMRUxkcUMzQ014ay9tWHgyT20rSEt5T2Qw?=
 =?utf-8?B?UU5JN29MczF2RDRCdVJjcVNlYnAxdVFNb2lzV3plWUFZZmduOTJpcG5iSzh4?=
 =?utf-8?B?eXp4RlRtTEZ1Rm1iYWZUYWVXcHRXNDN1cUd2c2JENW9wa1lHbXRQRDlGSi9E?=
 =?utf-8?B?RVlJMjRxUGgrdEY3ZXA3RFI1aUs5anhqYWNjWnhtc2dXRUR4dVcwYStIeW01?=
 =?utf-8?B?SEFraE5QN0xEWHJzY2JMcFNhS2dzUDFIQjdxZS95TE1jK09GMVU2Ry9WSHVY?=
 =?utf-8?B?K2k4ZjlhY1lBYkJWa0ZvOG5aaDM1Sm5UWTk3MEFpMkVsOEVhdG0vV0wzUUFY?=
 =?utf-8?B?TFRYbDhmbW1hQW8xWjhNcDB5UTJvdDJOZytNei91TnZjNjVneWtCWTczQnZp?=
 =?utf-8?B?VGNXUEZodWhReThCa3h5S3hucExDMG15b1BBM3kwV2tLNHdES2FaUVJ3SktW?=
 =?utf-8?B?eHo0WjhqWkphcXhzTnRTRkh3R3VGUkZKZ0JuNVpyREFqc1VaZEQ4QVZITjht?=
 =?utf-8?B?VXVWV1psMmkxQm1oMkdEUkp3UGFZYjFDRkRKcDl3cFdhMmRWRE5ML0FseFB2?=
 =?utf-8?B?bnFkT3Zhby9JN0tGb1orYklWaWo0T0libTZhRXp2b29XOXpZWW9veWx1NnRL?=
 =?utf-8?B?TG0vV3NwQURuTE80SjVrSW5SUDVMcW1ORlRSU0N0Z1NoUGdpaVBEVUVVV29I?=
 =?utf-8?B?VXFHYXc0NVlVaHcwV2NDaHc1ZlVkVzdBUS94Yi9zYkxONnRPWjhNY2NaeGFu?=
 =?utf-8?B?aG0xTkRTTG1EUnZVdTF4R1NwcHhtbnFEeVlPaVRYcExzZG14MHBXNFFKY09L?=
 =?utf-8?B?ekd1TktrNndYVTdRVkVKWlJUQjh3SHVaVE1QemE4cVg3TUhDUlJrQ1IzclJM?=
 =?utf-8?B?bkhvUnk1aDhKNUZWa0Jpd0J2ZUc5VmtxUUE1eEdMcGZiUjYwamNXaVFBTEsz?=
 =?utf-8?B?Ry9WT3dwNnlzWlZOa0pRK04vdklHU3RQb2w3Q1JwSkFpbzRhY3E2RnZ4Vm13?=
 =?utf-8?B?SEpsNmsvd0dXcWtPKzJrcUdhOGdCM29RcGJ1YnF2a2JkWGZPdU5ubk8yVHA3?=
 =?utf-8?B?bStjQUFKZFZUOExubzJsS21ZQnBoOXZFaEZYSDlxdXhTQUtIMFc3Tnd5SjdI?=
 =?utf-8?B?emVqc1NZUDE1REROUkNsOXR4TmRuV1hQTC80MmVuc2t3NzdzeDhHRlVRazNO?=
 =?utf-8?B?UWdlTXA0OTBHakRvTDBydG56M3BncEs4QzQ1WjZDQVhlZDVtQW9GRzU5a3kx?=
 =?utf-8?B?QzJ6RmdjVWxtRzFQQjBLRWVTWE1MVldnLzgvM3RGeW1ZSWRoRWE4SER4UFJL?=
 =?utf-8?B?ZVBFQVQrNDJqTGpBSzBYTHQvVW4yWFBGcmEwckx1SHNhYytyckkrdW10ZFBV?=
 =?utf-8?B?Nk5jUkFuUGxHRnVaY2RpRkt1VlpGWERUSUFaVENvdjlZd3prQm55R0Jydnk5?=
 =?utf-8?B?S2lHS25BOW4rR0ZEdmVxaXEyb1NsMlJUWVFJL2JIOFpFV3Vnd3MxeVIzZ2ow?=
 =?utf-8?B?Yk12QnJDWDRDREdhTmtpaGEydjhtUWl4bE5RN2I2cGV1Ny82WVNzbFgxaE5C?=
 =?utf-8?B?elhFaVZHRmxBK1Q1T1NCUjdCOHhKSGFuL29HK3ZkQzBQR2M1UEt0cUNaWmw2?=
 =?utf-8?B?Q29ZMnY3bmxRYkRrT3dyUnA2UmhFTTk3RG9MaiticVg1WlhxWE5wRHdqWVdC?=
 =?utf-8?B?SFpKUm9qSFRZNnpQeXNTT2hJUjlJTk45TDZnak8wdEZCTUxZYUo2TkZ1bGE1?=
 =?utf-8?B?SEt5VUNDcTdWUDBnOHllRTRTVHBGZDZuNDZHYU00aFZKTVRINHRGWVE3U1N3?=
 =?utf-8?B?MXp1UjMzNDlsWHhwU0NDNzVuMjBNRlhNbmpBWGlCYVNSMWYzeldSQ1hXcFFZ?=
 =?utf-8?Q?EjiNB2C1KZb51?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a76c5e-91ac-4806-929a-08d91a1f4193
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 17:06:19.8373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/VRkjRflGJj1wGzHnNkA34DKmRholnuR5IX4rP9zp/RTczScLdbxgePhJ+XlIVl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 18.05.21 um 18:49 schrieb Maarten Lankhorst:
> Op 18-05-2021 om 17:07 schreef Christian König:
>> Am 18.05.21 um 16:55 schrieb Thomas Hellström:
>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>
>>> This allows other drivers that may not setup the vma in the same way
>>> to use the ttm bo helpers.
>> Uff can you please explain why exactly you need that?
>>
>> Providing the BO is not much of a problem, but having the BO at different VMA offsets is really a no-go with TTM.
> i915 has its own mmap allocation handling to handle caching modes, and wouldn't use TTM's vma handling. But we do want to use the ttm fault handlers, which only need mmap_base + bo to work correctly.

Yeah, but that is really a no-go. The VMA handling is a very essential 
part of TTM.

If you want to use TTM we have to find a cleaner way to implement this.

Christian.

>
> ~Maarten
>

