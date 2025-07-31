Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA05B1746A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E5710E7CD;
	Thu, 31 Jul 2025 15:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Y/BGCnQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC3510E7CD
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 15:58:34 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-4e9a7bfb3c8so607730137.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 08:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753977513; x=1754582313; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jKKboCZbQOuMPhW93A7UzwoZX1h4N/abO1uaKk6KKOQ=;
 b=Y/BGCnQ1Jeg06cNlpP7fkJBBLQcwymPOO6ENBfo9AUw0wG3L+KNtgJHCvb1jaQs6gQ
 T0eKPGRwDY8BQbDCLWB4iZ2B1RFYHdROTJ99YC2v3FvY7Vj14jLXTte4/vCsMBifnhcR
 1CC8d/Qy/z6J0Ag15SWscDXounahVd6VfCo7jogZ5HXy6tkwi56ZmQyw8CeEpEu+hCjL
 IMQf/+vaHqVDgzMponCS8FefKIcQEgeYJr+h3OxiLsfn/5uz5rzZusmlMnu2TxdmfCDM
 +6ctXEDudOwCVmoSaRysRi5D8H5EhOKyHW+sz1nzbA+5t546GB1Cm1S+KC/Qqb1hQMQ8
 lBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753977513; x=1754582313;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jKKboCZbQOuMPhW93A7UzwoZX1h4N/abO1uaKk6KKOQ=;
 b=LXXaNicKpqzhrYA/72CkXZKZvPqMZYixh5wFYqEum9uFFlTmySTrbf0RCI5ypjMyEs
 sVvvu66Aefmt0KR5SvRRhE9mF2RWBCTuYxQ7lWWv6WK+kdycgNkkv4Yd1TfK+P109WJw
 GCvo+OHP9GlF+9ISFz5H+uk9IJ1u4ooqWU0g2x0jhxhvVrLhDc9lfqT7VUaw2LmP0Dno
 BNoXQyVSYr40Bx9qOPuG7W2WyBCW0WFJVt1echRMoxuRnJzkKAAcUzlepqQP1vaLDLHW
 3D1fWAYw2Y2lVrVov4AK5zr0WfFEuIRi8GoVJ2U4LLpQ/8F5yMaGMwXwgm7iWQg5DbUk
 IdlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuEhab8ZbCWzzvtp31ou/7IDriC8ipvgQtz9d9EvS7kTqCMJmcE7TwH/KjXJ1/t/mR4fUYgGyY5YY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX+qKtJiqMDmLZqbXGAFxW1yqqLqIeXIYRsYxObvwF3ufQ3iHr
 wHPIkW2pJLysv4t/WD11lskFQnfmsVCmHBAsq9TnVaQvF/LIq4Z3jMCHiuYpo8p+ltQ=
X-Gm-Gg: ASbGnctgM4JvDJ7RwET1sR50xYxM3F5vCcMg9OJ+naQ2NYbPyCg4numxvp9wAGHLu30
 Z1CMzmwiybf9OFSa2dnaFfaYnEfHjuEsDF9P8aOVaVHOEPVbIZZ20KiKDCQpmNaERwqPXOqcX6/
 x2wxtgMqGtzbw9/FK/xhDDxCoaQVpK/IIQZJUdUmUEkePX8oA91+uJsMBt7GuZmV4gLKiuleOfn
 eX/2/3OV88dTDix/uIWC0/22yDyb/1mT5L4oMQZY47BaLtvu1iO74t715xuAQG9046Mk6IKZkxD
 Qi4B1w/CVhP+glwJ8uYUFrvYzZpMPYmOmSu+Hll58VFEnIhDypK9IdxVjuVC/31KeolbEcHdkWn
 +VYZjf53MwsAFvQdbCtNKGVEIL94=
X-Google-Smtp-Source: AGHT+IFlKXeAtHhTk1SLO+CqePwO/w0WEyRur6i2wT7kumlydhvgPfkl/quSflZO/twV73QrziIhPg==
X-Received: by 2002:a05:6102:5686:b0:4e7:3e76:cd21 with SMTP id
 ada2fe7eead31-4fbe7f376f5mr4909961137.9.1753977512820; 
 Thu, 31 Jul 2025 08:58:32 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-88d8f422459sm431284241.21.2025.07.31.08.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:32 -0700 (PDT)
Date: Thu, 31 Jul 2025 18:58:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marie Zhussupova <marievic@google.com>,
 rmoar@google.com, davidgow@google.com, shuah@kernel.org,
 brendan.higgins@linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, elver@google.com,
 dvyukov@google.com, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 kasan-dev@googlegroups.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Marie Zhussupova <marievic@google.com>
Subject: Re: [PATCH 6/9] kunit: Enable direct registration of parameter
 arrays to a KUnit test
Message-ID: <5683507a-dacc-4e46-893f-d1e775d2ef22@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729193647.3410634-7-marievic@google.com>
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

Hi Marie,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marie-Zhussupova/kunit-Add-parent-kunit-for-parameterized-test-context/20250730-033818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git kunit
patch link:    https://lore.kernel.org/r/20250729193647.3410634-7-marievic%40google.com
patch subject: [PATCH 6/9] kunit: Enable direct registration of parameter arrays to a KUnit test
config: nios2-randconfig-r072-20250731 (https://download.01.org/0day-ci/archive/20250731/202507310854.pZvIcswn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507310854.pZvIcswn-lkp@intel.com/

New smatch warnings:
lib/kunit/test.c:723 kunit_run_tests() error: we previously assumed 'test_case->generate_params' could be null (see line 714)

vim +723 lib/kunit/test.c

914cc63eea6fbe Brendan Higgins     2019-09-23  681  int kunit_run_tests(struct kunit_suite *suite)
914cc63eea6fbe Brendan Higgins     2019-09-23  682  {
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  683  	char param_desc[KUNIT_PARAM_DESC_SIZE];
914cc63eea6fbe Brendan Higgins     2019-09-23  684  	struct kunit_case *test_case;
acd8e8407b8fcc David Gow           2021-08-03  685  	struct kunit_result_stats suite_stats = { 0 };
acd8e8407b8fcc David Gow           2021-08-03  686  	struct kunit_result_stats total_stats = { 0 };
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  687  	const void *curr_param;
914cc63eea6fbe Brendan Higgins     2019-09-23  688  
c272612cb4a2f7 David Gow           2022-07-01  689  	/* Taint the kernel so we know we've run tests. */
c272612cb4a2f7 David Gow           2022-07-01  690  	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
c272612cb4a2f7 David Gow           2022-07-01  691  
1cdba21db2ca31 Daniel Latypov      2022-04-29  692  	if (suite->suite_init) {
1cdba21db2ca31 Daniel Latypov      2022-04-29  693  		suite->suite_init_err = suite->suite_init(suite);
1cdba21db2ca31 Daniel Latypov      2022-04-29  694  		if (suite->suite_init_err) {
1cdba21db2ca31 Daniel Latypov      2022-04-29  695  			kunit_err(suite, KUNIT_SUBTEST_INDENT
1cdba21db2ca31 Daniel Latypov      2022-04-29  696  				  "# failed to initialize (%d)", suite->suite_init_err);
1cdba21db2ca31 Daniel Latypov      2022-04-29  697  			goto suite_end;
1cdba21db2ca31 Daniel Latypov      2022-04-29  698  		}
1cdba21db2ca31 Daniel Latypov      2022-04-29  699  	}
1cdba21db2ca31 Daniel Latypov      2022-04-29  700  
cae56e1740f559 Daniel Latypov      2022-04-29  701  	kunit_print_suite_start(suite);
914cc63eea6fbe Brendan Higgins     2019-09-23  702  
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  703  	kunit_suite_for_each_test_case(suite, test_case) {
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  704  		struct kunit test = { .param_value = NULL, .param_index = 0 };
acd8e8407b8fcc David Gow           2021-08-03  705  		struct kunit_result_stats param_stats = { 0 };
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  706  
887d85a0736ff3 Rae Moar            2023-03-08  707  		kunit_init_test(&test, test_case->name, test_case->log);
03806177fa4cbb Marie Zhussupova    2025-07-29  708  		__kunit_init_parent_test(test_case, &test);
03806177fa4cbb Marie Zhussupova    2025-07-29  709  
529534e8cba3e6 Rae Moar            2023-07-25  710  		if (test_case->status == KUNIT_SKIPPED) {
529534e8cba3e6 Rae Moar            2023-07-25  711  			/* Test marked as skip */
529534e8cba3e6 Rae Moar            2023-07-25  712  			test.status = KUNIT_SKIPPED;
529534e8cba3e6 Rae Moar            2023-07-25  713  			kunit_update_stats(&param_stats, test.status);
44c50ed8e59936 Marie Zhussupova    2025-07-29 @714  		} else if (!test_case->generate_params && !test.params_data.params) {
                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^
Imagine ->generate_parms is NULL but test.params_data.params is
non-NULL.

37dbb4c7c7442d David Gow           2021-11-02  715  			/* Non-parameterised test. */
529534e8cba3e6 Rae Moar            2023-07-25  716  			test_case->status = KUNIT_SKIPPED;
37dbb4c7c7442d David Gow           2021-11-02  717  			kunit_run_case_catch_errors(suite, test_case, &test);
37dbb4c7c7442d David Gow           2021-11-02  718  			kunit_update_stats(&param_stats, test.status);
03806177fa4cbb Marie Zhussupova    2025-07-29  719  		} else if (test_case->status != KUNIT_FAILURE) {
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  720  			/* Get initial param. */
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  721  			param_desc[0] = '\0';
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  722  			/* TODO: Make generate_params try-catch */
13ee0c64bd88a3 Marie Zhussupova    2025-07-29 @723  			curr_param = test_case->generate_params(&test, NULL, param_desc);
                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
Then this could crash.

I suspect that this is fine, but I bet that in the previous
condition, just testing one would probably have been sufficient
or maybe we could have change && to ||.

529534e8cba3e6 Rae Moar            2023-07-25  724  			test_case->status = KUNIT_SKIPPED;
6c738b52316c58 Rae Moar            2022-11-23  725  			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
6c738b52316c58 Rae Moar            2022-11-23  726  				  "KTAP version 1\n");
44b7da5fcd4c99 David Gow           2021-11-02  727  			kunit_log(KERN_INFO, &test, KUNIT_SUBTEST_INDENT KUNIT_SUBTEST_INDENT
44b7da5fcd4c99 David Gow           2021-11-02  728  				  "# Subtest: %s", test_case->name);
fadb08e7c7501e Arpitha Raghunandan 2020-11-16  729  
8631cd2cf5fbf2 Marie Zhussupova    2025-07-29  730  			while (curr_param) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

