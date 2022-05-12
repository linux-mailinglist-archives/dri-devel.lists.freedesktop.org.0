Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B9525515
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 20:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E625610EB94;
	Thu, 12 May 2022 18:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C7610EBAC;
 Thu, 12 May 2022 18:45:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmWjlA6s/LvvGKdDmKZ5s0fhQ9XTgWZcK63cLz/aTXtrPUcBK6glxtgpiaStM686CJIOClQV1H+Gk2CO8GABDDHRr5UFm4THBIxgVRP9SHg0dqtiNCM4ZkRrOsf1TBXiZ5GcfYRx6sKpQ1e+PGaVNB8awoaTa5cCLjvExPEjS+8hcdnM1OxJKIH6gyE5z/fl/JgZ6/ZOrBDyJKZieHM8+1k5EqunsBVZQCVDjVfdq1p+snw2givBwcxigqwWgbm/HcjaQGZzH4uIKFXgVRmYMHLSFbjcKwH3oMZe/0Jho52a8BVtZa1cLbE9GMl4ARxnq5ZIMu6MCQKOwYnE/a9ogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3DbWHp1Uj1Ku3ctx/LWRBoXc6m3uSe4ZFfu8JVbQfg=;
 b=D4C9z/JLbhV9LXeeMCqHuDdR6fVijtoxQ5IwvvXH7IbICBgt+2ngy+yb3aqatP47hXJEK02N8yckp2gyBXH0Afa4iOba/7nHWiL/sLNukzy+cKFEBiCkd56sBDrHjR7mIi6EPF9Q/E9k8SmGDCvgugbPnkLi/SDh1hf7QOxSE4ojXU3iZNDp162LF6CKnGYnr0UidlaOYATKVyOafp6JdbkSjTPZ7H/7qoo23LpZY2ZlOJCnXOc83DAOc+ElUEkvejI2jucHaTGyOqOFTELJUfzWZh0OQheULlYZZbgd8U0QyJJI2l7JIyTsjqQPjfCkB2cN1THl5LmfOW32JA39rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3DbWHp1Uj1Ku3ctx/LWRBoXc6m3uSe4ZFfu8JVbQfg=;
 b=MkaG6Rcnu9lrMPSBw8dLZwMtwHg6wH1PNPshlF7uX0T68f379CV2EUA3JEID6dRGxdZrgKMMZyptnHudVdtpWJVEg7Q5b+mutXff5xWMGo9SUfI71mUXcK3FIPfOtNYJ+rCrHYVUFjctQtTzxiPS4Jau4t1YUqzGPcUxeVIHjos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 18:45:20 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::2c05:6d91:e76a:6e24]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::2c05:6d91:e76a:6e24%4]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 18:45:20 +0000
Message-ID: <b0e51a83-ad9f-92db-2fa0-48b21ef3e1e3@amd.com>
Date: Thu, 12 May 2022 13:45:16 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 01/15] mm: add zone device coherent type memory support
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>
References: <20220505213438.25064-1-alex.sierra@amd.com>
 <20220505213438.25064-2-alex.sierra@amd.com>
 <87bkw3qwc8.fsf@nvdebian.thelocal>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <87bkw3qwc8.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR05CA0024.namprd05.prod.outlook.com (2603:10b6:610::37)
 To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca7dae06-e637-4d0d-8ac6-08da3447909c
X-MS-TrafficTypeDiagnostic: DM6PR12MB4404:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB440404BF88B5D96F90A384FDFDCB9@DM6PR12MB4404.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y2O3XNjbNv9XvMVjnUKlice6AFXVdPlmatoiUaWAkAIpgws2hui8dJ6s3jqttGhUNsOa/Tyg7QJHZn07izC5uxv8MgyQt0uHdGTJcXnj3/zMebqsU+s9HMGej79I1qZlGmfssQU24uf4M6dliB9kjeyz7gcNVHC02ITerFWTxiSt+1IFziQwYTM/XC6rT2RYkIAa+ezzQ1Tf2vX7JP73s/OUMxlrTN8H3NkwckQpQP23DwV4qpy+0zSd87+jniz3wu4doghqPuXcbg9jHuA88N6gn/E2yQVw9ggjHFY/CXRXXfbmDpddZhkUKWVT6aR24QSi5new5SEG03BOUFZxiN9+xWwDaLRozYikSwqdTXEYhs9GvN/O8+J8SzDYSIOj8hcGbovGZlWyRMh5m5yWHPkkkGirajVSODtFEw7gRsSflJEEo3AAtYBpjpS+sNmLFOHDe10xJORyUx58dWyZSSc0e5fxy2jf7FYQRSKX4r3pIuRsEDT5HmOZJE/tZSQQXYkoXQ1VIa3ZQmW81X5eRmNSsQUCeh50SwKbcq3z38OCcFN7F7LVVadxC4pxvp5+mDe9dBVRKTLZBbK/EoB6L/F7SRhcMRc8nRjYyUrQEHnDN9A+l4x2M1ZU6bdtz4qrIitpIlaYfUzrovjSla95f+nHLal7L5cPXpprEt2bXYOHwIZVxU07fVcBpn5qmLG7esUAFM3teAhBANkFvfFvAmxiwhnCtZpEY/+yozOlfbbJKViVfE7xZZKQQIPjcVgF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(5660300002)(7416002)(66476007)(6916009)(316002)(6512007)(31696002)(83380400001)(2616005)(6506007)(86362001)(38100700002)(53546011)(6486002)(66946007)(66556008)(4326008)(6666004)(36756003)(8676002)(8936002)(508600001)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1NIOVNXQ3ZqSmhyZmlob3c5UUhBMVBKN2pzSkFkUXlUY3JOT0tITi9Xc3RS?=
 =?utf-8?B?dk1Sc3U5Y2syVG5FMElVVGx6cEN2bDY5NFdmWG5qOXRmbHcrTmdzalFYMmV3?=
 =?utf-8?B?ZXEyWG5JQ2RrMXVxbGVxTTkwa1FqSEhGTVZUWjJPZFJXbDdiMkl3czJEQUNF?=
 =?utf-8?B?cGJUK1dxd0k3eTdsT0NielVySUFlYjc2QkdsL0cvcGp0VHZUWnhEb3I3UG5I?=
 =?utf-8?B?WVRkRWtmT3dUZ1J6aTJPa1ZjNGNRNkxwN2dQV055d3JCcHNXRnpKaUtMTE5y?=
 =?utf-8?B?RHhnQXhtcW4xQmN1MWhSS0FPSVlWMElRUXEvVGIvNXdUSFNlWXhEK3h6YURr?=
 =?utf-8?B?NmNYYm9SLy9XaWI1MnlTaWN5ajkzOGJVZ2ZzQUV2L0JqNytIQys3bWI0dG9K?=
 =?utf-8?B?WGFpQnNpU0pLc0tSK2lFQU9jWnR6RUZRNjlqRGR4MXZnYm5NS0pnU1hZZjcv?=
 =?utf-8?B?dHNPc0NUM1NZdmZGZ0hOUWVNVFNhWjNJOHFBUmdSWkFCWElnK2lhajBMNkI2?=
 =?utf-8?B?dFZBQnNWR3MrakhlSUdIbmNVSGZ6aHVNMU83YXpMakU1K2lRTUVreDZBQjdr?=
 =?utf-8?B?QWwrZzQ3OEhUUDBtSUN0THZFYnpnQUlGYTAvREMvQ01TZVIrY3MzVVd0TWxm?=
 =?utf-8?B?UEM5U1NKNTNDZnkrc2dpajBkOFJ2bitiRmpkV0JJelFKcVR4b0ZnaWxmeVhy?=
 =?utf-8?B?UmlZSTBKWGlDYlNxbnB4LzdmMDRMUkhrM0M1KzNGME5JRUlsblh1eUxFb3E0?=
 =?utf-8?B?OW5uNEU0SWxMbFh3djh1YUttZy9YWERTZkVmakxidnhxamwzR2QvamQ2RGo2?=
 =?utf-8?B?dWdiclg2NW43WnJUdHcxRXN5ZHpkc3VoVWVmOUlRTmZJcmxUR1RCaFM0SjVD?=
 =?utf-8?B?UXpkZXlrSENhRjArNnFwM0hrUjJteHVvb2hyYkN0QmM4UjZNMU9OeFBSY2JL?=
 =?utf-8?B?c0VrQXZVTlQ5M3o3YWdvbUxJbjFmR1hZSk5jRTNhbXFPbk9ZZ2FjYThmczV1?=
 =?utf-8?B?bGhGallRbEMvZG13TDFIVVJTYUExYmJBNWw2QXp1M0x4Z0pXc3htVUVpZ0Ey?=
 =?utf-8?B?K3NpZXBQSFdXY1N0SnR3WFBEalZXU3lvcGZSREcvN1AxeHFSTGVsc0dhTTZK?=
 =?utf-8?B?bDdhU3ZRVmpGK2FuR0Z4K3J3d2tNazRmM3pLbE1PMDVCTmgxWVZxajZVZ2xV?=
 =?utf-8?B?cHdPWTZuNXRFSjVNOEd5Qmh0SnZ4aUxQOEF0UW4wckh2QzFsODhaMUY2ZnJZ?=
 =?utf-8?B?dzJwTW5MeXk5N1RkMGk1MWZMY0R0a2M1c2dqMnJVN3JrUlpaTU5sUC9lZWZo?=
 =?utf-8?B?V2hKWGxObURxT25OVEVVNkJpOVF4MXlxeFo5di9tanRRc2N2dk5pNThDSVV2?=
 =?utf-8?B?dFdnSmRObENBZ2tWY2hST1Jjb2FqOTVoWXdNR3NFb1RPUzcybGtqdjRkZ0sv?=
 =?utf-8?B?ekZwd0hYVU5sZkhGT3VVMS9pZGdtek8zYXM3WGVvNFFsdWxmdGtlM0d6d2Zv?=
 =?utf-8?B?dWJ6VWlrWlZraE05NFlpTkVlbSsyWHVFdEJmWWpLbGVnVmxsWlZVUkszOE5a?=
 =?utf-8?B?UEJkQ05YN0IrZmtDelVtd0VtL3lhTzczL2JBTFFvNURRSmh5QnMvcGVQRlBr?=
 =?utf-8?B?ZEhFQjJkc1NaZXltWTlORzM5a0RzRmdmaU9DTVA1QXBtckpaUEk1VllaaXd3?=
 =?utf-8?B?T3c2bEY2ejJvc2tkOUJpTExma2xKdEE2VFNjWjhlSE1XcG9ZQnFvenBrV0t5?=
 =?utf-8?B?M0xXT21OZ2VmeVhucmRVdzVIc3RvYUt3RUxnemt2dlFwVVZqMU1JRmpWNzQ3?=
 =?utf-8?B?dVc3REk0OEJGbllWeFNRRVFwN0RWQlYwUnBDajE1SUNwYUlQNGhxSXBlNmQy?=
 =?utf-8?B?V3VQdXFqcDErUFNhZ1ptTFhnM1k5Nm5NaDhOWGs3a1h4MXpBS014THFTZjE3?=
 =?utf-8?B?YklaZGE5L2xERnJiM2pEVE5GT2ErSmpwWTJRMjFzK2oyNEp0V3hJb0Vhd0ZP?=
 =?utf-8?B?NFI0cFhodjJyWWxDbVkrOUdraWlGM2FWZDRVMWJGdE5XZ0NpVWczY2k4Q3Nj?=
 =?utf-8?B?UktSd1NZVUowM3lRTC9YWWpieU11VWVjTkJiZXRBekxLRlBwdnFNOWpnTzNP?=
 =?utf-8?B?UklmclRIOWhlc3V4ZTFBbjdJcXg2eVpNdlFTQzNIY2xlTHNhSTNwNkI3QlVP?=
 =?utf-8?B?VW5NamtQdjRZcjd0UVdyNU1vK09NK2JWTm9VNXRUS0xUeGRDK093WmVTcXFx?=
 =?utf-8?B?bHArOXFHTSt0N05LbUdrdXZXNVlJMGYzeW1GYWVYcHoyeWozUW9iOEphTHBZ?=
 =?utf-8?B?ZGgwdHJqT0xScGRzYW43a0hlNlpSTnNmdURPaEtJWXJqRU41NzFldz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca7dae06-e637-4d0d-8ac6-08da3447909c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 18:45:20.2190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nG7mNgCBMmQLYJUoN3odaKwvA+ICh9N3Q2mtEak7ISQPXS8Qmh7e64sWtzKbldXAvEeIEuSZZZKVciv29hu+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404
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
 Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/11/2022 9:58 PM, Alistair Popple wrote:
> Alex Sierra <alex.sierra@amd.com> writes:
>
> [...]
>
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index fedb82371efe..d57102cd4b43 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1995,7 +1995,8 @@ void try_to_migrate(struct folio *folio, enum ttu_flags flags)
>>   					TTU_SYNC)))
>>   		return;
>>
>> -	if (folio_is_zone_device(folio) && !folio_is_device_private(folio))
>> +	if (folio_is_zone_device(folio) &&
>> +	    (!folio_is_device_private(folio) && !folio_is_device_coherent(folio)))
>>   		return;
>>
>>   	/*
> I vaguely recall commenting on this previously, or at least intending
> to. In try_to_migrate_one() we have this:
>
> 		if (folio_is_zone_device(folio)) {
> 			unsigned long pfn = folio_pfn(folio);
> 			swp_entry_t entry;
> 			pte_t swp_pte;
>
> 			/*
> 			 * Store the pfn of the page in a special migration
> 			 * pte. do_swap_page() will wait until the migration
> 			 * pte is removed and then restart fault handling.
> 			 */
> 			entry = pte_to_swp_entry(pteval);
> 			if (is_writable_device_private_entry(entry))
> 				entry = make_writable_migration_entry(pfn);
> 			else
> 				entry = make_readable_migration_entry(pfn);
> 			swp_pte = swp_entry_to_pte(entry);
>
> The check in try_to_migrate() guarantees that if folio_is_zone_device()
> is true this must be a DEVICE_PRIVATE page and it treats it as such by
> assuming there is a special device private swap entry there.
>
> Relying on that assumption seems bad, and I have no idea why I didn't
> just use is_device_private_page() originally but I think the fix is just
> to change this to:
>
> 		if (folio_is_device_private(folio))

Thanks Alistair. This worked fine. I'll drop patch 4 and update this 
patch in the next series version.

Regards,
Alex Sierra

>
> And let DEVICE_COHERENT pages fall through to normal page processing.
>
>   - Alistair
