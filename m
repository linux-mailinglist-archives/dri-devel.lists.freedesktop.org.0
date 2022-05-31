Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0695E5396E3
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 21:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AFC10E380;
	Tue, 31 May 2022 19:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2786710E36D;
 Tue, 31 May 2022 19:19:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ep0P769WG8LKDde90w5zdG9bDsgsqm6Fcm69PM+g9VMsIzxVz+JCYJPdLOSLFh0iVZ7I3pK3h4UwWn3Y7SXU1pt2x2rBAhxIsofzbhb8IQ32QPvxI0vVnv/SU0e52ZMH0fE3/S59fu4wi8Mnanzmuhp61YHFXkWbwSgIt6iwfjUf8eiTgoTUN+J/dhuKXraA9xBAEdzg5L8m/Hcx6QA45oOndfI8ABaKbHopJ5/yd3FzsfJzaotE94nx1Y67vI2gV2b+kpCiHxOXDJVqQTeCbatCvHiJQDnFMRQlQH+LlygvGHYxmh+mrsFU5UL/NAPoZWxmw9qvp2AFt4tOVazp3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzKrUhxDnPyGFA8fq4Nu0PWSiZqzHnGZbd0pZ3cO0mA=;
 b=kLezjdPDyE2ZKj9ZdvNiAfEAVnI/CWJe1v8s26rMl+6ZlrFJs7BhyySfB5QTQdRSjEkxawu+oVbSTRVE+q1lYUuQhREz1aQszXvRaZPokBV7d9DuqdZPDhMBseKDQ+rvyXwMg+bSX0CgUCfrxgGyuT+nWZ7BogOYT+Dh9ntF6tBkOtbd5v7QmGGNfKosAtVC2Y/ea/2/W6i/Z8VAisgbA9SUiY/s0zjJNAkpFqxO8JcnnpJgGlbW6Q2eXHTkxU1loVhQBrVkwuUrUDyQEhTwpS4C/lxtuLteF9v4Brxz7ORH8U1TK24R8OlvZSjX4QWxb3lB3p7/0JxD8uK0RyX5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzKrUhxDnPyGFA8fq4Nu0PWSiZqzHnGZbd0pZ3cO0mA=;
 b=wPPCmt4k51T+kkR0BJO/HR4JWyoDnqKrETCnOs0WNvgSdHmo4c1i1XDQ1Yy47Cq2D+qmqPF9d3NdDY1T3yVjqIaadm+h9v7ScCAfcFUHmatJAEOrEDBGPHJ02FueQw6ePmq9akxSHxFQZrIcw5d5/jjC+a+dPdZ7YOcIYKJo4F8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by BN9PR12MB5225.namprd12.prod.outlook.com (2603:10b6:408:11e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 19:19:48 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 19:19:48 +0000
Message-ID: <2600dde0-be65-f1f8-1563-4f3753a395aa@amd.com>
Date: Tue, 31 May 2022 14:19:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 07/13] lib: test_hmm add ioctl to get zone device type
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
References: <20220531155629.20057-1-alex.sierra@amd.com>
 <20220531155629.20057-8-alex.sierra@amd.com>
 <20220531103152.6b9214cc39a87020d7d7927b@linux-foundation.org>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <20220531103152.6b9214cc39a87020d7d7927b@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:610:119::17) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 387ea414-fdc8-40c4-a037-08da433a877f
X-MS-TrafficTypeDiagnostic: BN9PR12MB5225:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB52254B4A0E75721D132E860FFDDC9@BN9PR12MB5225.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rRzOIYwkJc0GBayR5La44NlNnpxiEbSH+mTyDi+6Q/udnoeI5rfE32Ikd9V3GWloLwuwtV3xwYiU8gHLGTWmSevnqMeYHhF4Nsj2zhqULO09GxaAVBJtwARZuWUEGVrPp+bmFFY6dSGvutSfjVu6ow7pJEQLKZNisNOaYwQHYCGHDSmZD9m51JKUk9l7sCtba1hzvButYQk0jPhkwL3mcYCXAJw4543RpH6wKBZbfb2b/Utpt7U8q8sz4F/Q3/CccxPwJCpupXyH8SOy0HpZoLf0h79EkZDWbuHcOnj8kzKwi5wSxWOzWEKIzXcUGHWNnBlv2g+PGyrLx+Y6+gT39ganuH0yztKgrzGOfR3K3/Yas3a7YgCzHxmC/IG2EGGAEwfYoAF5smlayPQ8FKlCyIQm1OBFGCzMxcN0D0DMa+9+GGHX9jSaG6g/yGuejtj/23BrBDHgYw5i59ATM397BZ1qXwigEvdbCgLFPTCQnCjEh8VpwmbEqpwynmxfuq7eTpCyZvtmK9nqSDqPB+3avSc+CjGbqkA/GUQaUf5XwJmBA8xXKdkRmJyRGM2C96qrFpdiEApZOZfQUB1/BhCk80NJd62w07wfVZDhl23aMCeChMvYZfIFQRFqbk1mhB02NImZkrjRt4AaONUE/+tXU+XFTpAkxOehscsOzSZMxSdp7Swdp8A6gs7Ga+qOZ6O/RW9OrhQ3qfn5siiivDQeh86AOdVINgmGU5xK0KzAcs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(31696002)(8936002)(7416002)(316002)(86362001)(2906002)(53546011)(26005)(36756003)(6506007)(6512007)(6666004)(2616005)(38100700002)(6916009)(6486002)(508600001)(4326008)(66946007)(66556008)(66476007)(83380400001)(186003)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjUvT00vNUJOVStlSExobWgwM3JrL3JBb20xckdiOTY4LzVndWFkRjkvYXYz?=
 =?utf-8?B?NCtzdW5HRTFjMzA5WDJzVllPWFRUMWlWb0NXdXZjcjg3ZS81c0t2enlBOWlQ?=
 =?utf-8?B?OXVoYmFubzErQ3l0NkNtM2Q3elpYcEE3RDIxMVNHc2d4WC82RkdVRDZLUmJJ?=
 =?utf-8?B?ejUwd21NTmJPeEFzcTVJT0JHTTdQZURCZEtUeS9UczE4SHFOU3BWM2tvTjV0?=
 =?utf-8?B?S1BGYVAyMzkvZDRCWlJaMjJ5WTIwZ2hjR0pOSWUyTEdqd2ZIa2RtMzBjU1c2?=
 =?utf-8?B?eW5RZHcwZy9zRm9VUENXMXlYYkx3RjNIcmZJWEFNZW9CenpOSzByMXBuSW9W?=
 =?utf-8?B?dVVKZE84OUNKclRzUEJWTnlPWTN1aU0rZUNrbURpQUVyU0UyVjlONlFxQXZz?=
 =?utf-8?B?OWhXVTZUbEVwRVgvOXRCRTZlTFJ1Z01WM0wyNUtRZzhzSGs3ZlVNa3NKNVIz?=
 =?utf-8?B?S1BWb1B5dlVzdEJ3UVVTaWFaZU1vR1BCZTNJbzZpZG4rNTMxbldMZTk0UE9h?=
 =?utf-8?B?S1ZVT0JhNVUyTlFGT0JaSXZBenE3dS9JQ0hBVkZjYzFFTDVjRzdVWnZuOG5E?=
 =?utf-8?B?UVErdGt6aER4aUk1NHhINVZDUU5UREJIS0E0MUE1bExkYW5ZNXJvOXpaaTBq?=
 =?utf-8?B?TmthRmtXZUEwdjFBRVRwdzVOb1VvWm9yc2pPdnVwUVN3SWVmWlpjNFlsQkJC?=
 =?utf-8?B?eWJFME94M3hFQ2JRZnNGdFd5MHBmVXZ2V3huNTdubXRCL0YzZ2tnSzYwKzBR?=
 =?utf-8?B?T3VnazR6UHgzd0VpMnVYSjRXZUs5bGYyRE04U0NtQm1ZcHpuclRKTmU3UlEv?=
 =?utf-8?B?cElMVGJMT3RmRGt0Rk5aRU9udjVvUzZrU1BVT2pZK3JSUTFQUS8vUGl5bHox?=
 =?utf-8?B?cjZYbzZWcklHYUxCYlZJV3VuNkVOMzUySDZVbXVOTnFoMk5CWHptZ21XdjZW?=
 =?utf-8?B?ZFRDVXVrbExSUU5lYVBUSTNBWjJnYTNXVHBTbDZFVGdtTmFmL0xsTlNJcjEx?=
 =?utf-8?B?b2dpWTVrczQwNXlDVlZiblRxK2pBMHJ6MzNKditMRnhnZjhoNXFCTnlGd0h5?=
 =?utf-8?B?bU91ekgyM1RLOW44dnBiRFNMTk1BaHo1NEtnaml2ekdpRzFaYmswRUZOZ3Zy?=
 =?utf-8?B?eExta1RoVkhsaDM5TG13cyt2OTkrME9pWlBDQ0xMZlZCeERtbWd6bTZsOEIz?=
 =?utf-8?B?cVQrVWNaTG51eml6MUp6RHBCYS9aWXNVdDRINEJQdHNXTXdoM0pDUFhoejNP?=
 =?utf-8?B?SEdOZGx5UlBVNmdpUTZvNnVJNkxHUWNWdHhUTFFadFpWa3pqRmZkbHRxZk5z?=
 =?utf-8?B?elVRR3pTN0g0NnhVT0h0TzluK29YcXQ0UHBUNkEzOHozZXdRQTBkTEtOOWdV?=
 =?utf-8?B?N29pOUFaZTFIbWFsNUF1b3lGNlo5VjdwdXVIWVhDdm1sTW8vcHZZMzcvZklU?=
 =?utf-8?B?NEhIM0Y2dHQySEViR1lTbTN3NlFadDR5WGV5Q2U0WlBHbmFQdmNEL2QwZ21D?=
 =?utf-8?B?aEpFZEhuN3g0L0E0UmxyUHRSazNLK2MyQlQ3cmtUUDh1SXkrU0pCbmQ3Q3Jo?=
 =?utf-8?B?V0pua1AxdGdXM09KV2dvWW1TZ25FRzdodkY2c0VtZExic3ZpZHdRUitJcnVU?=
 =?utf-8?B?WkRxbGl5RThQMmlpWmw3UXRWTE1UcmZ6Zk1VZnNsNnRmZFlnVFdyUXo1WWRV?=
 =?utf-8?B?WkNsNmNLUWYwVU1JNVRHcnZIQUFVSjlEMjhRSVNGVDZOK08vSXhiUGgwRWFF?=
 =?utf-8?B?TExIVHhId3UyYVQycEJkbXAvOVFpT3FnaWRDSmx5OU53WDFiTlhqZGpFL2Ir?=
 =?utf-8?B?TXZOVk5RKzJVbnZaSEdYcEtDcnI3RktZc0I0OFEweHFXUGJ4cTg2UmFsdUpW?=
 =?utf-8?B?Z3RXT3Q2cHk1cm5wYWkzMTM3bWZKaTNGenJnZjIrc1NVbkYzam1RQ25Ddldp?=
 =?utf-8?B?MjZ4R21PVjREVjFpNkl1TzZHK0kzbzMwY3NaZmZGSUVES1c0dE5RcmpBd0U3?=
 =?utf-8?B?aTlaRzJrSDJuaTJPWDErZTNyelo0UlBLY3JqbWdPNTVJSE1LQnZ0STMrRkxh?=
 =?utf-8?B?Zlk1UndWWDc5VHBnSEJQMy9kM05iZmJWNEtJallZUkt0bTdJUkVxaVNaeCtU?=
 =?utf-8?B?bTJDdHdJUTZjdWdOZi8zZTdqMjl6NzluL0dxNnAzOS9HM1NUTm5IZ3FpbEtp?=
 =?utf-8?B?Qm9oRFc0ZFBMUUs3c1NWZ3VKK1ptc0xpS3ZlbVVhcHcrZ1d1ZmRmU1h5WjRx?=
 =?utf-8?B?c3UxOTQ3VlFxM0tacndzbnFjQnlHa1JyNUpaQ2dFTXlqKzBIdTJCeVpvR1B5?=
 =?utf-8?B?NUR3MGZTMWFoNUgrbVJuRER2RmxXeG53VmM3ZlRHVzFoQnUzclhEZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387ea414-fdc8-40c4-a037-08da433a877f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 19:19:48.8673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MliJxvMCXflg8xmnI2csdNkyj/YJ+5G1vD+WZd+zG6Gp+yiyj4u9JrvooLUYui91YveqNnRO0k8se7NiLIhVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5225
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, linux-ext4@vger.kernel.org,
 hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/31/2022 12:31 PM, Andrew Morton wrote:
> On Tue, 31 May 2022 10:56:23 -0500 Alex Sierra <alex.sierra@amd.com> wrote:
>
>> new ioctl cmd added to query zone device type. This will be
>> used once the test_hmm adds zone device coherent type.
>>
>> @@ -1026,6 +1027,15 @@ static int dmirror_snapshot(struct dmirror *dmirror,
>>   	return ret;
>>   }
>>   
>> +static int dmirror_get_device_type(struct dmirror *dmirror,
>> +			    struct hmm_dmirror_cmd *cmd)
>> +{
>> +	mutex_lock(&dmirror->mutex);
>> +	cmd->zone_device_type = dmirror->mdevice->zone_device_type;
>> +	mutex_unlock(&dmirror->mutex);
> What does the locking here do?
>
> Presumably cmd->zone_device_type can become out of date the instant the
> mutex is released, so what was the point in taking the mutex?

Actually this is not used at all. Thanks for finding it. Honestly, I 
don't remember what we used this type request for.
I will remove all related code  and send a new patch series version.

Regards,
Alex Sierra
>
> And does it make sense to return potentially out-of-date info to
> userspace?  Perhaps this interface simply shouldn't exist?
