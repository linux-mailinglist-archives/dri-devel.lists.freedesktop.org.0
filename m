Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D65D139152A
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 12:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657D36EC70;
	Wed, 26 May 2021 10:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2071.outbound.protection.outlook.com [40.107.212.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1E36EC6C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 10:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGHEqZz6SKkKP+wxteCt7LoYtI687pf9gD3fVeGGoX/c7NETZIvnWsd9RkCJ2djta1IKPW6uUVrqiqxZEOPiCdt/yPC0ZYdfroSGgbQSM///J2ikFUa83wdItF1XpDULijT+FtgZNzM4W33DwCaglvJbiHmi2j/iQlC1R6QssNf/pORDvuZgnTeWpuekU8jpa7uG27rNmxbItcRqhTX5rQtyQKOaOmIySU5CE2haJlQWz61d1EJoZgEFYE/OghjzFJjMKC2eQOQvQ8C0Lcg5NPU2Bt1wpZn4E0B/4367SdHCku9jNAtzH7DtpD7aT7AnLCNVGpDfZ7ByekVVf8ja5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFKLVfnT+jzgJONqcbB7gN2NQ/tip+adMgAY2vj/kg8=;
 b=Gj4pFUHM7Ht96Si80TLI9mW3TuANbZR/8s8JRiSueRHXcjywGWVup5lTWjvUdwae5AJL3EnVaM197vOl7IQ2B4+YafZhpaR782gJlAZprDuHj6lC/jQT+JfpAV2Q4K5Dnq0IvfvSk/n8EHgETyNNxgN6RmU6GKhfJ4MjBnueIq4WVnHzFdpqsXQ5Ek9G79iV0vfkkT1oZ4VsXhFG4Tm4oa+vSlIdMbUZY+YzYVtdqmS5qD0Plj+4fa+48CDXFy30gqJXU3X1CIBkmdQ8D6uUnwPTI1BuNcjcAFEdf7M8/TyTD8tTMf4zGBCQlBarmDkyxw5rTecxu+VED6m9KfzoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFKLVfnT+jzgJONqcbB7gN2NQ/tip+adMgAY2vj/kg8=;
 b=3Idx+KQrDke4MKZ+phK0RWeZiYh0H68dF9iJiM17geOIHffj7kGdaYz2ZF93WMA5zdteX8Vcskj++fv7dXavRUJW0Jw8Z3wCjaCP7+0TVAwjDEanUrjfhYcB6mxnarhofFRO03FXK+Olbn2h23376z99qcW/0v1noxVU2LMyWyk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 10:40:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 10:40:21 +0000
Subject: Re: [PATCH v4] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
To: Hridya Valsaraju <hridya@google.com>, daniel@ffwll.ch,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20210525183720.1739480-1-hridya@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3fd5145c-bb71-6f09-d412-6328ae9ea0a1@amd.com>
Date: Wed, 26 May 2021 12:40:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210525183720.1739480-1-hridya@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:7216:94bf:3812:bd88]
X-ClientProxiedBy: PR1PR01CA0021.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7216:94bf:3812:bd88]
 (2a02:908:1252:fb60:7216:94bf:3812:bd88) by
 PR1PR01CA0021.eurprd01.prod.exchangelabs.com (2603:10a6:102::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Wed, 26 May 2021 10:40:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ff5a5cc-5f5f-4d7d-4d87-08d92032a94a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41251D9C8294E639E83BB82083249@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iwWoLJXAUw6yiy3TtvPsGYV7EBJpFpK9IYbINT6q1vzpYB9jHGq8+tHixB2T8BQjfK6iNo34qS2xWf3iwUtd1jLZkfVj6MRXITIAsdgnTJWb7KxwSZ+kWgydZwLiBcTXTJ4gm3EClf5Oj9DB/i2jve9JqEkUg43JLtAb0o+szTercGiI13UO26liaBtUkMplocGO/94E9qIo3OChWTKDi8tV67x2iJMVEqG/6v/Ds/E6ntPWLVsoV/2Y8JDgJ/tf4zPlNDA+43kzBkxj1uhyynFaPO2Aot7FSgtnLf+F3bkgIsQVq+Nd+4sJG5tlL9HW3mfrD6SCZNaVGw8aolAXzLBY590TBo50PR6iTLmjBrvzVfYUvmPAzVmsSmgHB+v2/UcwluoRVMohHmuJNXlp3xfl+kDGyIPOPoM2Bg7Olegl798w9LegE9azPmkSoFRYY19vm7WJTmT/3sqB0tGY+9rAXcj/2E7ZMraeyKNbhPl3NNhLBDQk7n8dkjmZa7H/JKxp2zzkY8PDJzZqcjq/yGfypihCVPOUVC4G8rMMulXTfAocoyK+lSJw1TbjKR+ZARFkvJEqkWwqw3h4UJLM6ileYNktiTZqz5nFjJCUSWJpO8oh6PCHEAy+kcCcIUrmfl8OCm1/houFGZd9HZ9JCS6LtHE006tUGzuXZ+fNWJ/YBXmYixFdcBfbnEtDGaUPDwO+WgA/msOhmmrN/gvFPQ1WgOAa5xCvJT3798w7kxZkaGNmUN8L73CHXVF7HEa7WXtaLaP4MaZ9OUk651ZbZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(45080400002)(8936002)(6486002)(8676002)(2906002)(4326008)(478600001)(316002)(38100700002)(36756003)(66476007)(966005)(83380400001)(66574015)(186003)(66556008)(6666004)(66946007)(31696002)(52116002)(86362001)(2616005)(16526019)(30864003)(5660300002)(7416002)(110136005)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TTMxczVnMFhrWDBabVN5UzF0bXdnK0JkYXdKMkJ3NjIzZXc1VGkrTlEwZzdw?=
 =?utf-8?B?N2x3WlNHdDJ0MVNTeGZ4UnJoQWEyNDZzREh4UDZXT2lFbU5mN1hjd0t6ZDJz?=
 =?utf-8?B?VHpUUXZkYlJqYWlhbjNacnBWd290WHA1eVprSHhCazRsOURuWW1CSFhwZGpo?=
 =?utf-8?B?OWdqMjJkUHlqSmJpb285Z0Y5TnRkRDRKVXdwazloN2htTzFuUTFKTDE2dk0v?=
 =?utf-8?B?RWhwUEpNSnBneXpQNzhCYTdEOVRON1RSby9NeERMTmNCcTdjVzl1eHAxR1pi?=
 =?utf-8?B?TVk1OS9BV2Jxb2Rhd3RrRVhJN2I1dExWVGRvYVdaemtGdlpkaWVmMjZIckxl?=
 =?utf-8?B?UTRkKy9EOWRVdmhzeEp6bVVTalEvR2lzeU1NQ1BzTHhMeTNWalRWRkxpRVQ4?=
 =?utf-8?B?dkxPZGtZcWVCVGVnVU5RMi85cjVxU051NHFWSDVrSkZUZHB0cFFuS2hNbU9E?=
 =?utf-8?B?aVpBd0hGN2VyU1Y5cFUrTkxEOUtmNGx5QWQ5Z0U1Y2lzZWF3bkdYUW5WMHFr?=
 =?utf-8?B?VDhGT1NqdzdqblU4MndqUlo1MGhJT1hiUzVQZENOOGJ0UkpWa3NtMmtUZFBI?=
 =?utf-8?B?cGZqb3VvbnFPSWx5Qks4RmxTYS94SjFsUTJtTWhzcjg2WFpucC9wWmd0R3kx?=
 =?utf-8?B?SFd6OWZTZTlkM3p4ZmNra1loSG15YkVDQk4yL29PeEk4NTZIeXQzTmdBYjY4?=
 =?utf-8?B?aDVQajRGL0F3NHV2VzljNmlNM0RCenZ4V1NqTWkzRjFwWFdCVWpyUDRZb0JL?=
 =?utf-8?B?K0Y1ZlRxaHF0V0FnRDYrbXBqWHVjYkl3RjhQd1UyL28xbGZ5Ym1Hb3JyRDZr?=
 =?utf-8?B?eVlCV0lOTmlCK1k0OWQxWVd5dXhOVmdOWEFFYStSUTkyZmxRWmplandoK0NU?=
 =?utf-8?B?Zmg5YmpHN0p4Qy9HS2FNNUJmT0VmMTJmVXAzdzViL2NuOUFVN0kvcTlpTUVB?=
 =?utf-8?B?QzBHemd1VjRpUlRJU0tBdWdVR21haW03Qy9zSGZ3MFBQbGJuMEMvRzZVejFk?=
 =?utf-8?B?VDdYdXpoQ0lTeGVmYUN2dWNrTlFoMkRDa0JCOEVlbXpnSzdxMXkvL0V1MkRJ?=
 =?utf-8?B?Rk9EcEU4b1AyRVIwdTUyd2FHc1N6VFJscld1MjJlRmw4QjR0Umh3dWNKM3Bk?=
 =?utf-8?B?MXZ1ZGgyZml2OHpWVDNoRGVXS1pXaVBTSGxlN0EyaGhINjN5djRCUXNyWmll?=
 =?utf-8?B?N01XRWxFK2Yzc1BOb1EzeDdwQkw3UjJ6UXpsQWtwQ0M0QTlNSi9zU0NsM0Zv?=
 =?utf-8?B?d1VMUC9uQkZtcE15cE15ZWQzUElHdFBTNzZWUlJpeU1VZ3ZXQXBXeXoxOTBa?=
 =?utf-8?B?dTNHUkpGL2RZZ25pVko4VGUwRTN5ZWtrcU5TVUFSN2RpQ202cDFwVEI0bDNZ?=
 =?utf-8?B?Ukw3eDdWdm0rVXJjS1djMG15YlJmVFpPaUU4aVZZcTNFcUdlVVZGbTJzclg5?=
 =?utf-8?B?UVhsNFAxV1M5cjZoUmxsUjRjaHhwWkEzeFMwVGFGRm9TMkJQeXl6UnY2NFcx?=
 =?utf-8?B?SWk2RWEvSXYySzRPZVRNOWx6bmRWS0c3Q0dTbDdHRVdoSHpod2ZFN1JHdkxr?=
 =?utf-8?B?ekF5S0lMRDdRNWxlanZJYUZNTDBwV1JOL24rcTVYL2cvY2VBYU9qbG1JUXgr?=
 =?utf-8?B?L3dvM253UFFwM0xPUm55ZS9uaVYxOEpvczVaTGljTG5TYmhJYkUwOWV4Z1hQ?=
 =?utf-8?B?aWF0M1gwT3AyOTE2NE1zRDBpbVVBM0VvRzBrdkM3Y3NReTJiQ0wvUUNPWlM3?=
 =?utf-8?B?UndjMCtCWk8xQ0xqU01wdzFoWnBvWEREOGFqOW9kTzhRSGs1NzcvbW5FelZQ?=
 =?utf-8?B?WEg3TGNITkNHUzJITDdLSHJYTDlaTGpHcFI0SnJEWjhyUVhWdDFXandXeFRn?=
 =?utf-8?Q?QpwTt3TGCjHnd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff5a5cc-5f5f-4d7d-4d87-08d92032a94a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 10:40:21.2567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihkNKhSNyGXDqCxxIBMU5ifJ7XaP+X8JihGzW95RG0vzwszshwQhvE0PKmf9dsQZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: gregkh@linuxfoundation.org, kernel-team@android.com, surenb@google.com,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hridya,

Am 25.05.21 um 20:37 schrieb Hridya Valsaraju:
> This patch allows statistics to be enabled for each DMA-BUF in
> sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
>
> The following stats will be exposed by the interface:
>
> /sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> /sys/kernel/dmabuf/buffers/<inode_number>/size
> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/device
> /sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attach_uid>/map_counter
>
> The inode_number is unique for each DMA-BUF and was added earlier [1]
> in order to allow userspace to track DMA-BUF usage across different
> processes.
>
> Currently, this information is exposed in
> /sys/kernel/debug/dma_buf/bufinfo.
> However, since debugfs is considered unsafe to be mounted in production,
> it is being duplicated in sysfs.
>
> Procfs also uses the proc/<pid>/fdinfo/<fd> file to expose some
> information about DMA-BUF fds. However, the existing procfs interfaces
> can only provide information about the buffers for which processes
> hold fds or have the buffers mmapped into their address space.
> The sysfs interface also exposes attachment statistics for each buffer.
>
> This information will be used to derive DMA-BUF
> per-exporter stats and per-device usage stats for Android Bug reports.
> The corresponding userspace changes can be found at [2].
> Telemetry tools will also capture this information(along with other
> memory metrics) periodically as well as on important events like a
> foreground app kill (which might have been triggered by Low Memory
> Killer). It will also contribute to provide a snapshot of the system
> memory usage on other events such as OOM kills and Application Not
> Responding events.
>
> A shell script that can be run on a classic Linux environment to read
> out the DMA-BUF statistics can be found at [3](suggested by John
> Stultz).
>
> The patch contains the following major improvements over v1:
> 1) Each attachment is represented by its own directory to allow creating
> a symlink to the importing device and to also provide room for future
> expansion.
> 2) The number of distinct mappings of each attachment is exposed in a
> separate file.
> 3) The per-buffer statistics are now in /sys/kernel/dmabuf/buffers
> inorder to make the interface expandable in future.
>
> All of the improvements above are based on suggestions/feedback from
> Daniel Vetter and Christian König.
>
> [1]: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fpatchwork%2Fpatch%2F1088791%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C72394dc653194a3fd3fd08d91fac2fb9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637575646676575967%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=EJ8KluQVn8FTOYRBAYpxAaG7rua46eQpmGwI%2FxIMthQ%3D&amp;reserved=0
> [2]: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fandroid-review.googlesource.com%2Fq%2Ftopic%3A%2522dmabuf-sysfs%2522&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C72394dc653194a3fd3fd08d91fac2fb9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637575646676575967%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=4sAAqK%2F6mtSr5MWpcu2EbwOvL93UA6kMwQ2uk4fMP1g%3D&amp;reserved=0+(status:open%20OR%20status:merged)
> [3]: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fandroid-review.googlesource.com%2Fc%2Fplatform%2Fsystem%2Fmemory%2Flibmeminfo%2F%2B%2F1549734&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C72394dc653194a3fd3fd08d91fac2fb9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637575646676575967%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=hs40%2FMAnJaZQA4pkYucGqeCOGk2A9dUU%2Fj9ajqAoyFk%3D&amp;reserved=0
>
> Signed-off-by: Hridya Valsaraju <hridya@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>
> Hi Daniel,
>
> I am sending the latest version of the DMA-BUF sysfs statistics patch to
> the list again as per your suggestion to restart the discussion on it :)
> Please do take a look and let me know your thoughts, thank you!

Daniel and Sumit might correct me, but I think in the previous 
discussion we came pretty much to the conclusion that this is not the 
right approach.

DMA-buf is just the transport vehicle for driver allocations and as 
Daniel outlined it doesn't really make sense to account on a DMA-buf 
level except for debugging.

So while this patch is technically correct it will only add another 
halve backed uAPI. So question is rather what the alternative should 
look like?

Both AMD and Intel engineers are currently discussion a fdinfo based 
approach on the dri-devel mailing list.

I strongly suggest that you join this discussion as well (and sorry I 
don't have the link at hand).

Regards,
Christian.

>
> Regards,
> Hridya
>
> Changes in v4:
> -Suppress uevents from kset creation to avoid waking up uevent listeners on
> DMA-BUF export/release.
>
> Changes in v3:
> -Fix a warning reported by the kernel test robot.
>
> Changes in v2:
> -Move statistics to /sys/kernel/dmabuf/buffers in oder to allow addition
> of other DMA-BUF-related sysfs stats in future. Based on feedback from
> Daniel Vetter.
> -Each attachment has its own directory to represent attaching devices as
> symlinks and to introduce map_count as a separate file. Based on
> feedback from Daniel Vetter and Christian König. Thank you both!
> -Commit messages updated to point to userspace code in AOSP that will
> read the DMA-BUF sysfs stats.
>
>   .../ABI/testing/sysfs-kernel-dmabuf-buffers   |  52 +++
>   drivers/dma-buf/Kconfig                       |  11 +
>   drivers/dma-buf/Makefile                      |   1 +
>   drivers/dma-buf/dma-buf-sysfs-stats.c         | 300 ++++++++++++++++++
>   drivers/dma-buf/dma-buf-sysfs-stats.h         |  62 ++++
>   drivers/dma-buf/dma-buf.c                     |  37 +++
>   include/linux/dma-buf.h                       |  20 ++
>   7 files changed, 483 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.c
>   create mode 100644 drivers/dma-buf/dma-buf-sysfs-stats.h
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> new file mode 100644
> index 000000000000..73a8c372b0f2
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> @@ -0,0 +1,52 @@
> +What:		/sys/kernel/dmabuf/buffers
> +Date:		May 2021
> +KernelVersion:	v5.13
> +Contact:	Hridya Valsaraju <hridya@google.com>
> +Description:	The /sys/kernel/dmabuf/buffers directory contains a
> +		snapshot of the internal state of every DMA-BUF.
> +		/sys/kernel/dmabuf/buffers/<inode_number> will contain the
> +		statistics for the DMA-BUF with the unique inode number
> +		<inode_number>
> +Users:		kernel memory tuning/debugging tools
> +
> +What:		/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> +Date:		May 2021
> +KernelVersion:	v5.13
> +Contact:	Hridya Valsaraju <hridya@google.com>
> +Description:	This file is read-only and contains the name of the exporter of
> +		the DMA-BUF.
> +
> +What:		/sys/kernel/dmabuf/buffers/<inode_number>/size
> +Date:		May 2021
> +KernelVersion:	v5.13
> +Contact:	Hridya Valsaraju <hridya@google.com>
> +Description:	This file is read-only and specifies the size of the DMA-BUF in
> +		bytes.
> +
> +What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments
> +Date:		May 2021
> +KernelVersion:	v5.13
> +Contact:	Hridya Valsaraju <hridya@google.com>
> +Description:	This directory will contain subdirectories representing every
> +		attachment of the DMA-BUF.
> +
> +What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>
> +Date:		May 2021
> +KernelVersion:	v5.13
> +Contact:	Hridya Valsaraju <hridya@google.com>
> +Description:	This directory will contain information on the attaching device
> +		and the number of current distinct device mappings.
> +
> +What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>/device
> +Date:		May 2021
> +KernelVersion:	v5.13
> +Contact:	Hridya Valsaraju <hridya@google.com>
> +Description:	This file is read-only and is a symlink to the attaching devices's
> +		sysfs entry.
> +
> +What:		/sys/kernel/dmabuf/buffers/<inode_number>/attachments/<attachment_uid>/map_counter
> +Date:		May 2021
> +KernelVersion:	v5.13
> +Contact:	Hridya Valsaraju <hridya@google.com>
> +Description:	This file is read-only and contains a map_counter indicating the
> +		number of distinct device mappings of the attachment.
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 4e16c71c24b7..9561e3d2d428 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -72,6 +72,17 @@ menuconfig DMABUF_HEAPS
>   	  allows userspace to allocate dma-bufs that can be shared
>   	  between drivers.
>   
> +menuconfig DMABUF_SYSFS_STATS
> +	bool "DMA-BUF sysfs statistics"
> +	select DMA_SHARED_BUFFER
> +	help
> +	   Choose this option to enable DMA-BUF sysfs statistics
> +	   in location /sys/kernel/dmabuf/buffers.
> +
> +	   /sys/kernel/dmabuf/buffers/<inode_number> will contain
> +	   statistics for the DMA-BUF with the unique inode number
> +	   <inode_number>.
> +
>   source "drivers/dma-buf/heaps/Kconfig"
>   
>   endmenu
> diff --git a/drivers/dma-buf/Makefile b/drivers/dma-buf/Makefile
> index 995e05f609ff..40d81f23cacf 100644
> --- a/drivers/dma-buf/Makefile
> +++ b/drivers/dma-buf/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_DMABUF_HEAPS)	+= heaps/
>   obj-$(CONFIG_SYNC_FILE)		+= sync_file.o
>   obj-$(CONFIG_SW_SYNC)		+= sw_sync.o sync_debug.o
>   obj-$(CONFIG_UDMABUF)		+= udmabuf.o
> +obj-$(CONFIG_DMABUF_SYSFS_STATS) += dma-buf-sysfs-stats.o
>   
>   dmabuf_selftests-y := \
>   	selftest.o \
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> new file mode 100644
> index 000000000000..45717c8108c8
> --- /dev/null
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -0,0 +1,300 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * DMA-BUF sysfs statistics.
> + *
> + * Copyright (C) 2021 Google LLC.
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/dma-resv.h>
> +#include <linux/kobject.h>
> +#include <linux/printk.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>
> +
> +#include "dma-buf-sysfs-stats.h"
> +
> +#define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_sysfs_entry, kobj)
> +
> +struct dma_buf_stats_attribute {
> +	struct attribute attr;
> +	ssize_t (*show)(struct dma_buf *dmabuf,
> +			struct dma_buf_stats_attribute *attr, char *buf);
> +};
> +#define to_dma_buf_stats_attr(x) container_of(x, struct dma_buf_stats_attribute, attr)
> +
> +static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
> +					    struct attribute *attr,
> +					    char *buf)
> +{
> +	struct dma_buf_stats_attribute *attribute;
> +	struct dma_buf_sysfs_entry *sysfs_entry;
> +	struct dma_buf *dmabuf;
> +
> +	attribute = to_dma_buf_stats_attr(attr);
> +	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
> +	dmabuf = sysfs_entry->dmabuf;
> +
> +	if (!dmabuf || !attribute->show)
> +		return -EIO;
> +
> +	return attribute->show(dmabuf, attribute, buf);
> +}
> +
> +static const struct sysfs_ops dma_buf_stats_sysfs_ops = {
> +	.show = dma_buf_stats_attribute_show,
> +};
> +
> +static ssize_t exporter_name_show(struct dma_buf *dmabuf,
> +				  struct dma_buf_stats_attribute *attr,
> +				  char *buf)
> +{
> +	return sysfs_emit(buf, "%s\n", dmabuf->exp_name);
> +}
> +
> +static ssize_t size_show(struct dma_buf *dmabuf,
> +			 struct dma_buf_stats_attribute *attr,
> +			 char *buf)
> +{
> +	return sysfs_emit(buf, "%zu\n", dmabuf->size);
> +}
> +
> +static struct dma_buf_stats_attribute exporter_name_attribute =
> +	__ATTR_RO(exporter_name);
> +static struct dma_buf_stats_attribute size_attribute = __ATTR_RO(size);
> +
> +static struct attribute *dma_buf_stats_default_attrs[] = {
> +	&exporter_name_attribute.attr,
> +	&size_attribute.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(dma_buf_stats_default);
> +
> +static void dma_buf_sysfs_release(struct kobject *kobj)
> +{
> +	struct dma_buf_sysfs_entry *sysfs_entry;
> +
> +	sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
> +	kfree(sysfs_entry);
> +}
> +
> +static struct kobj_type dma_buf_ktype = {
> +	.sysfs_ops = &dma_buf_stats_sysfs_ops,
> +	.release = dma_buf_sysfs_release,
> +	.default_groups = dma_buf_stats_default_groups,
> +};
> +
> +#define to_dma_buf_attach_entry_from_kobj(x) container_of(x, struct dma_buf_attach_sysfs_entry, kobj)
> +
> +struct dma_buf_attach_stats_attribute {
> +	struct attribute attr;
> +	ssize_t (*show)(struct dma_buf_attach_sysfs_entry *sysfs_entry,
> +			struct dma_buf_attach_stats_attribute *attr, char *buf);
> +};
> +#define to_dma_buf_attach_stats_attr(x) container_of(x, struct dma_buf_attach_stats_attribute, attr)
> +
> +static ssize_t dma_buf_attach_stats_attribute_show(struct kobject *kobj,
> +						   struct attribute *attr,
> +						   char *buf)
> +{
> +	struct dma_buf_attach_stats_attribute *attribute;
> +	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> +
> +	attribute = to_dma_buf_attach_stats_attr(attr);
> +	sysfs_entry = to_dma_buf_attach_entry_from_kobj(kobj);
> +
> +	if (!attribute->show)
> +		return -EIO;
> +
> +	return attribute->show(sysfs_entry, attribute, buf);
> +}
> +
> +static const struct sysfs_ops dma_buf_attach_stats_sysfs_ops = {
> +	.show = dma_buf_attach_stats_attribute_show,
> +};
> +
> +static ssize_t map_counter_show(struct dma_buf_attach_sysfs_entry *sysfs_entry,
> +				struct dma_buf_attach_stats_attribute *attr,
> +				char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", sysfs_entry->map_counter);
> +}
> +
> +static struct dma_buf_attach_stats_attribute map_counter_attribute =
> +	__ATTR_RO(map_counter);
> +
> +static struct attribute *dma_buf_attach_stats_default_attrs[] = {
> +	&map_counter_attribute.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(dma_buf_attach_stats_default);
> +
> +static void dma_buf_attach_sysfs_release(struct kobject *kobj)
> +{
> +	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> +
> +	sysfs_entry = to_dma_buf_attach_entry_from_kobj(kobj);
> +	kfree(sysfs_entry);
> +}
> +
> +static struct kobj_type dma_buf_attach_ktype = {
> +	.sysfs_ops = &dma_buf_attach_stats_sysfs_ops,
> +	.release = dma_buf_attach_sysfs_release,
> +	.default_groups = dma_buf_attach_stats_default_groups,
> +};
> +
> +void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach)
> +{
> +	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> +
> +	sysfs_entry = attach->sysfs_entry;
> +	if (!sysfs_entry)
> +		return;
> +
> +	sysfs_delete_link(&sysfs_entry->kobj, &attach->dev->kobj, "device");
> +
> +	kobject_del(&sysfs_entry->kobj);
> +	kobject_put(&sysfs_entry->kobj);
> +}
> +
> +int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> +			       unsigned int uid)
> +{
> +	struct dma_buf_attach_sysfs_entry *sysfs_entry;
> +	int ret;
> +	struct dma_buf *dmabuf;
> +
> +	if (!attach)
> +		return -EINVAL;
> +
> +	dmabuf = attach->dmabuf;
> +
> +	sysfs_entry = kzalloc(sizeof(struct dma_buf_attach_sysfs_entry),
> +			      GFP_KERNEL);
> +	if (!sysfs_entry)
> +		return -ENOMEM;
> +
> +	sysfs_entry->kobj.kset = dmabuf->sysfs_entry->attach_stats_kset;
> +
> +	attach->sysfs_entry = sysfs_entry;
> +
> +	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_attach_ktype,
> +				   NULL, "%u", uid);
> +	if (ret)
> +		goto kobj_err;
> +
> +	ret = sysfs_create_link(&sysfs_entry->kobj, &attach->dev->kobj,
> +				"device");
> +	if (ret)
> +		goto link_err;
> +
> +	return 0;
> +
> +link_err:
> +	kobject_del(&sysfs_entry->kobj);
> +kobj_err:
> +	kobject_put(&sysfs_entry->kobj);
> +	attach->sysfs_entry = NULL;
> +
> +	return ret;
> +}
> +void dma_buf_stats_teardown(struct dma_buf *dmabuf)
> +{
> +	struct dma_buf_sysfs_entry *sysfs_entry;
> +
> +	sysfs_entry = dmabuf->sysfs_entry;
> +	if (!sysfs_entry)
> +		return;
> +
> +	kset_unregister(sysfs_entry->attach_stats_kset);
> +	kobject_del(&sysfs_entry->kobj);
> +	kobject_put(&sysfs_entry->kobj);
> +}
> +
> +
> +/* Statistics files do not need to send uevents. */
> +static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *kobj)
> +{
> +	return 0;
> +}
> +
> +static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
> +	.filter = dmabuf_sysfs_uevent_filter,
> +};
> +
> +static struct kset *dma_buf_stats_kset;
> +static struct kset *dma_buf_per_buffer_stats_kset;
> +int dma_buf_init_sysfs_statistics(void)
> +{
> +	dma_buf_stats_kset = kset_create_and_add("dmabuf",
> +						 &dmabuf_sysfs_no_uevent_ops,
> +						 kernel_kobj);
> +	if (!dma_buf_stats_kset)
> +		return -ENOMEM;
> +
> +	dma_buf_per_buffer_stats_kset = kset_create_and_add("buffers",
> +							    &dmabuf_sysfs_no_uevent_ops,
> +							    &dma_buf_stats_kset->kobj);
> +	if (!dma_buf_per_buffer_stats_kset) {
> +		kset_unregister(dma_buf_stats_kset);
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +void dma_buf_uninit_sysfs_statistics(void)
> +{
> +	kset_unregister(dma_buf_per_buffer_stats_kset);
> +	kset_unregister(dma_buf_stats_kset);
> +}
> +
> +int dma_buf_stats_setup(struct dma_buf *dmabuf)
> +{
> +	struct dma_buf_sysfs_entry *sysfs_entry;
> +	int ret;
> +	struct kset *attach_stats_kset;
> +
> +	if (!dmabuf || !dmabuf->file)
> +		return -EINVAL;
> +
> +	if (!dmabuf->exp_name) {
> +		pr_err("exporter name must not be empty if stats needed\n");
> +		return -EINVAL;
> +	}
> +
> +	sysfs_entry = kzalloc(sizeof(struct dma_buf_sysfs_entry), GFP_KERNEL);
> +	if (!sysfs_entry)
> +		return -ENOMEM;
> +
> +	sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
> +	sysfs_entry->dmabuf = dmabuf;
> +
> +	dmabuf->sysfs_entry = sysfs_entry;
> +
> +	/* create the directory for buffer stats */
> +	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
> +				   "%lu", file_inode(dmabuf->file)->i_ino);
> +	if (ret)
> +		goto err_sysfs_dmabuf;
> +
> +	/* create the directory for attachment stats */
> +	attach_stats_kset = kset_create_and_add("attachments",
> +						&dmabuf_sysfs_no_uevent_ops,
> +						&sysfs_entry->kobj);
> +	if (!attach_stats_kset) {
> +		ret = -ENOMEM;
> +		goto err_sysfs_attach;
> +	}
> +
> +	sysfs_entry->attach_stats_kset = attach_stats_kset;
> +
> +	return 0;
> +
> +err_sysfs_attach:
> +	kobject_del(&sysfs_entry->kobj);
> +err_sysfs_dmabuf:
> +	kobject_put(&sysfs_entry->kobj);
> +	dmabuf->sysfs_entry = NULL;
> +	return ret;
> +}
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.h b/drivers/dma-buf/dma-buf-sysfs-stats.h
> new file mode 100644
> index 000000000000..5f4703249117
> --- /dev/null
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.h
> @@ -0,0 +1,62 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * DMA-BUF sysfs statistics.
> + *
> + * Copyright (C) 2021 Google LLC.
> + */
> +
> +#ifndef _DMA_BUF_SYSFS_STATS_H
> +#define _DMA_BUF_SYSFS_STATS_H
> +
> +#ifdef CONFIG_DMABUF_SYSFS_STATS
> +
> +int dma_buf_init_sysfs_statistics(void);
> +void dma_buf_uninit_sysfs_statistics(void);
> +
> +int dma_buf_stats_setup(struct dma_buf *dmabuf);
> +int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> +			       unsigned int uid);
> +static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
> +						       int delta)
> +{
> +	struct dma_buf_attach_sysfs_entry *entry = attach->sysfs_entry;
> +
> +	entry->map_counter += delta;
> +}
> +void dma_buf_stats_teardown(struct dma_buf *dmabuf);
> +void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach);
> +static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabuf)
> +{
> +	struct dma_buf_sysfs_entry *entry = dmabuf->sysfs_entry;
> +
> +	return entry->attachment_uid++;
> +}
> +#else
> +
> +static inline int dma_buf_init_sysfs_statistics(void)
> +{
> +	return 0;
> +}
> +
> +static inline void dma_buf_uninit_sysfs_statistics(void) {}
> +
> +static inline int dma_buf_stats_setup(struct dma_buf *dmabuf)
> +{
> +	return 0;
> +}
> +static inline int dma_buf_attach_stats_setup(struct dma_buf_attachment *attach,
> +					     unsigned int uid)
> +{
> +	return 0;
> +}
> +
> +static inline void dma_buf_stats_teardown(struct dma_buf *dmabuf) {}
> +static inline void dma_buf_attach_stats_teardown(struct dma_buf_attachment *attach) {}
> +static inline void dma_buf_update_attachment_map_count(struct dma_buf_attachment *attach,
> +						       int delta) {}
> +static inline unsigned int dma_buf_update_attach_uid(struct dma_buf *dmabuf)
> +{
> +	return 0;
> +}
> +#endif
> +#endif // _DMA_BUF_SYSFS_STATS_H
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index f264b70c383e..184dd7acb1ed 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -29,6 +29,8 @@
>   #include <uapi/linux/dma-buf.h>
>   #include <uapi/linux/magic.h>
>   
> +#include "dma-buf-sysfs-stats.h"
> +
>   static inline int is_dma_buf_file(struct file *);
>   
>   struct dma_buf_list {
> @@ -79,6 +81,7 @@ static void dma_buf_release(struct dentry *dentry)
>   	if (dmabuf->resv == (struct dma_resv *)&dmabuf[1])
>   		dma_resv_fini(dmabuf->resv);
>   
> +	dma_buf_stats_teardown(dmabuf);
>   	module_put(dmabuf->owner);
>   	kfree(dmabuf->name);
>   	kfree(dmabuf);
> @@ -580,6 +583,10 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   	file->f_mode |= FMODE_LSEEK;
>   	dmabuf->file = file;
>   
> +	ret = dma_buf_stats_setup(dmabuf);
> +	if (ret)
> +		goto err_sysfs;
> +
>   	mutex_init(&dmabuf->lock);
>   	INIT_LIST_HEAD(&dmabuf->attachments);
>   
> @@ -589,6 +596,14 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>   
>   	return dmabuf;
>   
> +err_sysfs:
> +	/*
> +	 * Set file->f_path.dentry->d_fsdata to NULL so that when
> +	 * dma_buf_release() gets invoked by dentry_ops, it exits
> +	 * early before calling the release() dma_buf op.
> +	 */
> +	file->f_path.dentry->d_fsdata = NULL;
> +	fput(file);
>   err_dmabuf:
>   	kfree(dmabuf);
>   err_module:
> @@ -723,6 +738,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   {
>   	struct dma_buf_attachment *attach;
>   	int ret;
> +	unsigned int attach_uid;
>   
>   	if (WARN_ON(!dmabuf || !dev))
>   		return ERR_PTR(-EINVAL);
> @@ -748,8 +764,13 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	}
>   	dma_resv_lock(dmabuf->resv, NULL);
>   	list_add(&attach->node, &dmabuf->attachments);
> +	attach_uid = dma_buf_update_attach_uid(dmabuf);
>   	dma_resv_unlock(dmabuf->resv);
>   
> +	ret = dma_buf_attach_stats_setup(attach, attach_uid);
> +	if (ret)
> +		goto err_sysfs;
> +
>   	/* When either the importer or the exporter can't handle dynamic
>   	 * mappings we cache the mapping here to avoid issues with the
>   	 * reservation object lock.
> @@ -776,6 +797,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   			dma_resv_unlock(attach->dmabuf->resv);
>   		attach->sgt = sgt;
>   		attach->dir = DMA_BIDIRECTIONAL;
> +		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
>   	}
>   
>   	return attach;
> @@ -792,6 +814,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
>   	if (dma_buf_is_dynamic(attach->dmabuf))
>   		dma_resv_unlock(attach->dmabuf->resv);
>   
> +err_sysfs:
>   	dma_buf_detach(dmabuf, attach);
>   	return ERR_PTR(ret);
>   }
> @@ -841,6 +864,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   			dma_resv_lock(attach->dmabuf->resv, NULL);
>   
>   		__unmap_dma_buf(attach, attach->sgt, attach->dir);
> +		dma_buf_update_attachment_map_count(attach, -1 /* delta */);
>   
>   		if (dma_buf_is_dynamic(attach->dmabuf)) {
>   			dma_buf_unpin(attach);
> @@ -854,6 +878,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>   	if (dmabuf->ops->detach)
>   		dmabuf->ops->detach(dmabuf, attach);
>   
> +	dma_buf_attach_stats_teardown(attach);
>   	kfree(attach);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_detach);
> @@ -993,6 +1018,9 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   	}
>   #endif /* CONFIG_DMA_API_DEBUG */
>   
> +	if (!IS_ERR(sg_table))
> +		dma_buf_update_attachment_map_count(attach, 1 /* delta */);
> +
>   	return sg_table;
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_map_attachment);
> @@ -1030,6 +1058,8 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
>   	if (dma_buf_is_dynamic(attach->dmabuf) &&
>   	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>   		dma_buf_unpin(attach);
> +
> +	dma_buf_update_attachment_map_count(attach, -1 /* delta */);
>   }
>   EXPORT_SYMBOL_GPL(dma_buf_unmap_attachment);
>   
> @@ -1480,6 +1510,12 @@ static inline void dma_buf_uninit_debugfs(void)
>   
>   static int __init dma_buf_init(void)
>   {
> +	int ret;
> +
> +	ret = dma_buf_init_sysfs_statistics();
> +	if (ret)
> +		return ret;
> +
>   	dma_buf_mnt = kern_mount(&dma_buf_fs_type);
>   	if (IS_ERR(dma_buf_mnt))
>   		return PTR_ERR(dma_buf_mnt);
> @@ -1495,5 +1531,6 @@ static void __exit dma_buf_deinit(void)
>   {
>   	dma_buf_uninit_debugfs();
>   	kern_unmount(dma_buf_mnt);
> +	dma_buf_uninit_sysfs_statistics();
>   }
>   __exitcall(dma_buf_deinit);
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index efdc56b9d95f..342585bd6dff 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -295,6 +295,9 @@ struct dma_buf_ops {
>    * @poll: for userspace poll support
>    * @cb_excl: for userspace poll support
>    * @cb_shared: for userspace poll support
> + * @sysfs_entry: for exposing information about this buffer in sysfs.
> + * The attachment_uid member of @sysfs_entry is protected by dma_resv lock
> + * and is incremented on each attach.
>    *
>    * This represents a shared buffer, created by calling dma_buf_export(). The
>    * userspace representation is a normal file descriptor, which can be created by
> @@ -330,6 +333,15 @@ struct dma_buf {
>   
>   		__poll_t active;
>   	} cb_excl, cb_shared;
> +#ifdef CONFIG_DMABUF_SYSFS_STATS
> +	/* for sysfs stats */
> +	struct dma_buf_sysfs_entry {
> +		struct kobject kobj;
> +		struct dma_buf *dmabuf;
> +		unsigned int attachment_uid;
> +		struct kset *attach_stats_kset;
> +	} *sysfs_entry;
> +#endif
>   };
>   
>   /**
> @@ -379,6 +391,7 @@ struct dma_buf_attach_ops {
>    * @importer_ops: importer operations for this attachment, if provided
>    * dma_buf_map/unmap_attachment() must be called with the dma_resv lock held.
>    * @importer_priv: importer specific attachment data.
> + * @sysfs_entry: For exposing information about this attachment in sysfs.
>    *
>    * This structure holds the attachment information between the dma_buf buffer
>    * and its user device(s). The list contains one attachment struct per device
> @@ -399,6 +412,13 @@ struct dma_buf_attachment {
>   	const struct dma_buf_attach_ops *importer_ops;
>   	void *importer_priv;
>   	void *priv;
> +#ifdef CONFIG_DMABUF_SYSFS_STATS
> +	/* for sysfs stats */
> +	struct dma_buf_attach_sysfs_entry {
> +		struct kobject kobj;
> +		unsigned int map_counter;
> +	} *sysfs_entry;
> +#endif
>   };
>   
>   /**

